import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:pharmashots/ApiRepository/shared_pref_helper.dart';
import 'package:pharmashots/Category/categoryModal.dart';
import 'package:pharmashots/Constants/Constant.dart';
import 'package:pharmashots/Constants/LoaderClass.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'postModal.dart';

class Posts extends ChangeNotifier{

  List<PostModal> _posts = [];
  List<PostModal> _topItems = [];
  List<PostModal> _postItems = [];
  List<PostModal> _dailynewposts=[];
  List<PostModal> _top20posts=[];
  List<PostModal> _insights=[];
  List<PostModal> _eventsposts=[];
  List<PostModal> _viewspointposts=[];
  List<PostModal> _categorybyposts=[];

  List<PostModal> _searchposts=[];
  List<PostModal> _bookmarposts=[];
  List<PostModal> _relatedposts=[];
  List<PostModal> _exclusiveposts=[];
  List<PostModal> _spotlightposts=[];

  List<CategoryModal> _categoriespost=[];
  List<IntrestModal> _intrestlist=[];
  List<IntrestModal> _followinglist=[];
  List<IntrestModal> _followlist=[];

  String? _token;
  String? _Id;
  String? title;
  String? post_type;
  String? slug;
  String? link;
  PostModal? _post;
  late OverlayEntry loader;

  Posts();

  bool isAuth() {
    if(Shared.pref.getString(userPref.AuthToken.toString()) !=null){
      return true;
    }else{
      return false;
    }

  }

  String? get token {
    if (_token != null) {
      return _token;
    }
    return null;
  }

  PostModal? get post {
    return _post;
  }
  List<PostModal> get posts {
    return [..._posts];
  }
  int get itemCount {
    return _posts.length;
  }
  int get top20postitemCount {
    return _top20posts.length;
  }
  List<PostModal> get top20posts {
      return [..._top20posts];

  }

  List<PostModal> get postItem {
    return [..._postItems];

  }

  int get insightspostCount {
    return _insights.length;
  }
  List<PostModal> get insightsposts {
    return [..._insights];

  }

  int get eventpostCount {
    return _eventsposts.length;
  }
  List<PostModal> get eventposts {
    return [..._eventsposts];

  }

  int get viewspointpostCount {
    return _viewspointposts.length;
  }
  List<PostModal> get viewspointposts {
    return [..._viewspointposts];

  }

  int get exclusivepostCount {
    return _exclusiveposts.length;
  }
  List<PostModal> get exclusiveposts {
    return [..._exclusiveposts];

  }

  int get spotlightpostCount {
    return _spotlightposts.length;
  }
  List<PostModal> get spotlightposts {
    return [..._spotlightposts];

  }

  int get categorybypostCount {
    return _categorybyposts.length;
  }
  List<PostModal> get categorybyposts {
    return [..._categorybyposts];

  }




  int get searchpostCount {
    return _searchposts.length;
  }
  List<PostModal> get searchposts {
    return [..._searchposts];

  }

  int get bookmarkpostCount {
    return _bookmarposts.length;
  }
  List<PostModal> get bookmarkposts {
    return [..._bookmarposts];

  }


  int get dailynewspostCount {
    return _dailynewposts.length;
  }
  List<PostModal> get dailynewsposts {
    return [..._dailynewposts];

  }



  int get categoriespostCount {
    return _categoriespost.length;
  }
  List<CategoryModal> get categoriesposts {
    return [..._categoriespost];

  }

  List<IntrestModal> get intrestlist {
    return [..._intrestlist];
  }
  List<IntrestModal> get followinglist {
    return [..._followinglist];
  }
  List<IntrestModal> get followlist {
    return [..._followlist];
  }

  List<PostModal> get relatedposts {
    return [..._relatedposts];
  }


  Map<String, String> get headers => {
    "Content-Type": "application/json",
    "Accept": "application/json",
    "Authorization": "Bearer $_token",
  };

  Future<void> setpostItem(List<PostModal> posts) async
  {
     _postItems=posts;
     notifyListeners();
  }


   getToken() async
  {
    var s= await SharedPreferenceHelper().getAuthToken();
    _token=s;
  }
  PostModal findById(int id) {
    // return _topItems.firstWhere((course) => course.id == id);

    return _posts.firstWhere((post) => post.Id == id,
        orElse: () => _topItems.firstWhere((course) => course.Id == id));

  }

  Future<void> getFollowings() async{
    _followinglist= _intrestlist.where((post) => post.is_intrest == 1).toList();
    notifyListeners();
  }

  Future<void> getFollows() async{
    _followlist= _intrestlist.where((post) => post.is_intrest == 0).toList();
    notifyListeners();
  }

  Future<void> doFollows(int index) async{
    //_followlist= _intrestlist.where((post) => post.is_intrest == 0).toList();
   // _followlist.add(_followinglist[index]);
    _followinglist.add(_followlist.firstWhere((element) => element.id==index.toString()));
    _followlist.removeWhere((element) => element.id==index.toString());
    // _followinglist=_followinglist;
    notifyListeners();
    saveIntrest(_followinglist);
  }

  Future<void> doUnFollows(int index) async{
    //_followlist= _intrestlist.where((post) => post.is_intrest == 0).toList();
    // _followlist.add(_followinglist[index]);
    _followlist.add(_followinglist.firstWhere((element) => element.id==index.toString()));
    _followinglist.removeWhere((element) => element.id==index.toString());
    // _followinglist=_followinglist;
    notifyListeners();
    saveIntrest(_followinglist);
  }

  Future<void> fetchUserDiscovered({int page=1}) async {
    getToken();
    print("get header...........");
    // print(headers);
    var token= await SharedPreferenceHelper().getAuthToken();
    String basicAuth = 'Bearer ' + token.toString();
    print(basicAuth);
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': '$basicAuth'
    };
    //var url = BASE_URL + 'user/discover-user-intrest-posts?page='+page.toString();
    var url=BASE_URL+'search?search=&page='+page.toString();
    // try {
     print(headers);
      final response = await http.get(Uri.parse(url),headers: headers);
      final extractedData = json.decode(response.body);
      // ignore: unnecessary_null_comparison
      if (extractedData == null) {
        return;
      }
      if(page==1){
        _posts = buildPostList(extractedData['data']);
      }else{
        print(buildPostList(extractedData['data']));
        _posts.addAll(buildPostList(extractedData['data']));
        notifyListeners();
        print(_posts.length);
      }

      notifyListeners();
    // } catch (error) {
    //   throw (error);
    // }
  }


  List<PostModal> buildPostList(List extractedData) {
    final List<PostModal> loadedPosts = [];
    extractedData.forEach((postData) {
      loadedPosts.add(PostModal.fromJson(postData));
      // print(courseData['title']);
    });
    return loadedPosts;
  }





  Future<void> dailyNewsPosts() async {

    getToken();
    var url = BASE_URL + 'user/daily-news';
    // try {
    print(headers);
    final response = await http.get(Uri.parse(url),headers: headers);
    final extractedData = json.decode(response.body);
    // ignore: unnecessary_null_comparison
    if (extractedData == null) {
      return;
    }

      _dailynewposts = buildPostList(extractedData['data']);

    // final List<PostModal> loadedPosts = [];
    //  if(posts.length >0)
    //    {
    //      if(posts.length < 6)
    //        {
    //          for (var i = 0; i < posts.length; i++)
    //           {
    //             loadedPosts.add(posts[i]);
    //           }
    //        }
    //      else{
    //        for (var i = 0; i < 6; i++)
    //        {
    //          loadedPosts.add(posts[i]);
    //        }
    //      }
    //    }
     // _dailynewposts = loadedPosts;
      notifyListeners();


  }

  Future<void> top20Posts({page=1}) async {
    getToken();
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // String basicAuth = 'Bearer ' + token;


    var url = BASE_URL + 'post-by-category/24?page='+page.toString();
    final response = await http.get(Uri.parse(url),headers: headers);
    final extractedData = json.decode(response.body);
    if (extractedData == null) {
      return;
    }else{
      final List<PostModal> loadedPosts = [];
      print(extractedData["data"]);
      extractedData["data"].forEach((postData) {
        loadedPosts.add(PostModal.fromJson(postData));
      });
      if(page==1){
        _top20posts = loadedPosts;
      }else{
        _top20posts.addAll(loadedPosts);
      }

      notifyListeners();
    }

  }

  Future<void> insightsPosts({page=1}) async {
    getToken();
    var url = BASE_URL + 'post-by-category/27?page='+page.toString();
    final response = await http.get(Uri.parse(url),headers: headers);
    final extractedData = json.decode(response.body);
    if (extractedData == null) {
      return;
    }else{
      final List<PostModal> loadedPosts = [];
      print(extractedData["data"]);
      extractedData["data"].forEach((postData) {
        loadedPosts.add(PostModal.fromJson(postData));
      });
      if(page==1){
        _insights = loadedPosts;
      }else{
        _insights.addAll(loadedPosts);
      }

      notifyListeners();
    }

  }

  Future<void> eventPosts({page=1}) async {
    getToken();
    var url = BASE_URL + 'post-by-category/22?page='+page.toString();
    final response = await http.get(Uri.parse(url),headers: headers);
    final extractedData = json.decode(response.body);
    if (extractedData == null) {
      return;
    }else{
      final List<PostModal> loadedPosts = [];
      print(extractedData["data"]);
      extractedData["data"].forEach((postData) {
        loadedPosts.add(PostModal.fromJson(postData));
      });
      if(page==1){
        _eventsposts = loadedPosts;
      }else{
        _eventsposts.addAll(loadedPosts);
      }

      notifyListeners();
    }

  }

  Future<void> viewspointPosts({page=1}) async {
    getToken();
    var url = BASE_URL + 'post-by-category/21?page='+page.toString();
    final response = await http.get(Uri.parse(url),headers: headers);
    final extractedData = json.decode(response.body);
    if (extractedData == null) {
      return;
    }else{
      final List<PostModal> loadedPosts = [];
      print(extractedData["data"]);
      extractedData["data"].forEach((postData) {
        loadedPosts.add(PostModal.fromJson(postData));
      });
      if(page==1){
        _viewspointposts = loadedPosts;
      }else{
        _viewspointposts.addAll(loadedPosts);
      }

      notifyListeners();
    }

  }

  Future<void> exclusivePosts({page=1}) async {
    getToken();
    var url = BASE_URL + 'post-by-category/29?page='+page.toString();
    final response = await http.get(Uri.parse(url),headers: headers);
    final extractedData = json.decode(response.body);
    if (extractedData == null) {
      return;
    }else{
      final List<PostModal> loadedPosts = [];
      print(extractedData["data"]);
      extractedData["data"].forEach((postData) {
        loadedPosts.add(PostModal.fromJson(postData));
      });
      if(page==1){
        _exclusiveposts = loadedPosts;
      }else{
        _exclusiveposts.addAll(loadedPosts);
      }

      notifyListeners();
    }

  }

  Future<void> spotlightPosts({page=1}) async {
    getToken();
    var url = BASE_URL + 'post-by-category/31?page='+page.toString();
    final response = await http.get(Uri.parse(url),headers: headers);
    final extractedData = json.decode(response.body);
    if (extractedData == null) {
      return;
    }else{
      final List<PostModal> loadedPosts = [];
      print(extractedData["data"]);
      extractedData["data"].forEach((postData) {
        loadedPosts.add(PostModal.fromJson(postData));
      });
      if(page==1){
        _spotlightposts = loadedPosts;
      }else{
        _spotlightposts.addAll(loadedPosts);
      }

      notifyListeners();
    }

  }

  Future<void> categoryByPosts(String cat,{page=1}) async {
    getToken();
    var url = BASE_URL + 'post-by-category/'+cat+'?page='+page.toString();
    final response = await http.get(Uri.parse(url),headers: headers);
    final extractedData = json.decode(response.body);
    if (extractedData == null) {
      return;
    }else{
      final List<PostModal> loadedPosts = [];
      print(extractedData["data"]);
      extractedData["data"].forEach((postData) {
        loadedPosts.add(PostModal.fromJson(postData));
      });
      if(page==1){

        _categorybyposts = loadedPosts;
      }else{

        _categorybyposts.addAll(loadedPosts);
      }
      notifyListeners();
    }

  }



  Future<void> relatedPosts(String slug,String id) async {
    getToken();
    var url = BASE_URL + 'show/'+id+'/'+slug;
    final response = await http.get(Uri.parse(url),headers: headers);
    final extractedData = json.decode(response.body);
    if (extractedData == null) {
      return;
    }else{
      final List<PostModal> loadedPosts = [];
      print(extractedData);
      extractedData["data"]["relatedPost"].forEach((postData) {
        loadedPosts.add(PostModal.fromJson(postData));
      });
      _relatedposts = loadedPosts;
      notifyListeners();
    }

  }



  Future<void> fetchCategoryPosts() async {
    getToken();
    var url = BASE_URL + 'category-with-post';
    final response = await http.get(Uri.parse(url),headers: headers);
    final extractedData = json.decode(response.body);
    if (extractedData == null) {
      return;
    }else{
      final List<CategoryModal> loadedPosts = [];
      final List<int> ignored_category_list = [27, 21, 22,23,24,28,29,30,31];
      // print(extractedData["data"]['discover_by_user']);
      extractedData["data"]['discover_by_user'].forEach((postData) {
        if(ignored_category_list.contains(postData['id'])==false){

          print(postData['id']);
          print('---------');
          loadedPosts.add(CategoryModal.fromJson(postData));
        }


      });
      _categoriespost = loadedPosts;
      notifyListeners();
    }

  }

  Future<void> fetchBookmarkPosts() async {
    getToken();
    var url = BASE_URL + 'user/bookmark-list';
    try {
      final response = await http.get(Uri.parse(url), headers: headers);
      final extractedData = json.decode(response.body);
      if (extractedData == null) {
        return;
      } else {
        final List<PostModal> loadedPosts = [];
        print(extractedData["data"]);
        extractedData["data"].forEach((postData) {
          loadedPosts.add(PostModal.fromJson(postData));
        });
        _bookmarposts = loadedPosts;
        notifyListeners();
      }
    }catch(e)
    {
      return;
    }

  }


  Future<void> fetchSearchPost(String search_str) async{
    getToken();
    var url = BASE_URL + 'search?search='+ search_str;
    final response = await http.get(Uri.parse(url),headers: headers);
    final extractedData = json.decode(response.body);
    if (extractedData == null) {
      return;
    }else{
      final List<PostModal> loadedPosts = [];
      print(extractedData["data"]);
      extractedData["data"].forEach((postData) {
        loadedPosts.add(PostModal.fromJson(postData));
      });
      _searchposts = loadedPosts;
      notifyListeners();
    }
  }

  clearSearchPost(){
     _searchposts.clear();
  }

  Future<void> fetchIntrest() async {
    // getToken();
    print("get header...........");
    // print(headers);
    var token= await SharedPreferenceHelper().getAuthToken();
    String basicAuth = 'Bearer ' + token.toString();
    print(basicAuth);
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': '$basicAuth'
    };
    var url = BASE_URL + 'category';
    final response = await http.get(Uri.parse(url),headers: headers);
    final extractedData = json.decode(response.body);
    if (extractedData == null) {
      return;
    }else{
      final List<IntrestModal> loadedPosts = [];
      final List<int> ignored_category_list = [ 21, 22,23,24,27,28,29,30,31];

      extractedData["data"]['discover_by_user'].forEach((postData) {
        if(ignored_category_list.contains(postData["id"])==false) {
          loadedPosts.add(IntrestModal.fromJson(postData));
        }
      });
      _intrestlist = loadedPosts;
      notifyListeners();
    }

  }

  Future<void> saveIntrest(List<IntrestModal> followingList) async {
    // getToken();
    print("tocken----------");
    var token= await SharedPreferenceHelper().getAuthToken();
    String basicAuth = 'Bearer ' + token.toString();
    print(basicAuth);
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': '$basicAuth'
    };
    print(headers);
    var ids=[];
    followingList.forEach((element) {
      print(element.id);
      ids.add(element.id);

    });
    var list_ids=ids.join(",");
    // followinglist.join(",")

    print(list_ids.toString());
    var url = BASE_URL + 'user/save-intrest';
    var uri =Uri.parse(url);
    // final response = await http.post(Uri.parse(url),headers: headers,body: catList);
    var request = http.MultipartRequest('POST', uri);
    request.headers.addAll(headers);
    request.fields['category']=list_ids.toString();
    // Map<String,String> map1 = Map.fromIterable(followingList, key: (e) => e.category_name, value: (e) => e.id);
    // print(map1);
    //
    // request.fields.addAll(map1);
    final response = await request.send();
    print(response);
    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.\\
      Fluttertoast.showToast(msg: "Saving");
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      Fluttertoast.showToast(msg: "Exception occur");
    }

  }

 Future<void> saveNotifation(bool newvalue) async
 {
   print("saved");
 }
}

