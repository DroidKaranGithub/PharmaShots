import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pharmashots/ApiRepository/shared_pref_helper.dart';
import 'package:pharmashots/Category/categoryModal.dart';
import 'package:pharmashots/Constants/color_resource.dart';
import 'package:pharmashots/Constants/components.dart';
import 'package:pharmashots/Constants/fonts.dart';
import 'package:pharmashots/Posts/postModal.dart';
import 'package:pharmashots/Posts/postProvider.dart';
import 'package:pharmashots/Screen/search_result.dart';
import 'package:pharmashots/Widget/floatingActionWidget.dart';
import 'package:pharmashots/Widget/intrestCardWidget.dart';
import 'package:pharmashots/Widget/post_list_widget.dart';
import 'package:pharmashots/Widget/recent_search_word_widget.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bottom_bar_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<PostModal> _searchList=[];
  bool is_loaded=false;
  bool is_load_intrest=true;
  List<String> recentsearch=[];
  List<IntrestModal> followings=[];
  List<IntrestModal> follows=[];
  List<IntrestModal> allintrest=[];

  getRecentSearchList() async{

    final prefs = await SharedPreferences.getInstance();
    var s= SharedPreferenceHelper().getRecentSearch();
    s.then((value) {
      print(value);
      if(value !=null) {
        setState(() {
          recentsearch = value;
        });
      }
    });


  }

  fetchAllIntrest() async{
    Provider.of<Posts>(context, listen: false).fetchIntrest().then((value) {
      setState(() {
        Provider.of<Posts>(context, listen: false).getFollowings();
        Provider.of<Posts>(context, listen: false).getFollows();
        allintrest=Provider.of<Posts>(context, listen: false).intrestlist;

        followings= Provider.of<Posts>(context, listen: false).followinglist;
        follows= Provider.of<Posts>(context, listen: false).followlist;
        is_load_intrest=false;

      });
    });
    // final dailyNewsData=Provider.of<Posts>(context, listen: false).dailynewsposts;
    // final dailynewsCount = dailyNewsData.length;

  }


  @override
  void initState() {
    getRecentSearchList();
    fetchAllIntrest();
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.WHITE,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        actions: [

          // Padding(
          //   padding: const EdgeInsets.all(20.0),
          //   child: Image(
          //     image: AssetImage(
          //       'assets/images/Path 707@2x.png',
          //     ),
          //     height: 13,
          //     width: 13,
          //   ),
          // )
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 12.0, left: 22,
            right: 22),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  width:  MediaQuery.of(context).size.width * 75,
                  decoration: BoxDecoration(
                      // color: Color(0xfff5f8fd),
                      border: Border.all(color: ColorResources.HINT_TEXT_COLOR),
                      borderRadius: BorderRadius.circular(25)),
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Searchs Article",
                              border: InputBorder.none,
                            ),
                           // autofillHints: ["sourabh","deepal","depa"],
                            onSubmitted: (x){
                              print(x);
                              search(x);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Center(
                            child: is_loaded?CircularProgressIndicator():null,
                          )
                        ],
                      ),

                    ],
                  )
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Recent Search',
                    style: FormaDJRDisplayBold.copyWith(
                      color: ColorResources.BLACK,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                if(recentsearch.isNotEmpty)
                Wrap(
                  children: [
                    for(var i=0;i<recentsearch.length;i++)
                      //Text(recentsearch[i].toString()),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                        InkWell(
                          onTap: (){
                            search(recentsearch[i].toString());
                          },
                        child:recentSearchWord(recentsearch[i].toString()))
                      ),
                  ],
                )
                else
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:Text('none')),

                SizedBox(
                  height: 35,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                    bottom: BorderSide(
                      color: ColorResources.GAINS_BORO,
                    ),
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Favourites',
                    style: FormaDJRDisplayBold.copyWith(
                      color: ColorResources.BLACK,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Center(
                              child: is_load_intrest?CircularProgressIndicator():null,
                            )
                          ],
                        ),

                      ],
                    )
                ),
                if(followings.length>0)
                GridView.count(
                  shrinkWrap: true,
                  primary: false,
                  padding: const EdgeInsets.all(0.0),
                  crossAxisSpacing: 10.0,
                  crossAxisCount: 3,
                  children: [

                      for (var i = 0; i < followings.length; i++)
                        intrestCardWidget(followings[i],unfollow,"following"),
                  ],
                ),
                SizedBox(
                  height: 35,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: ColorResources.GAINS_BORO,
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Category (Select Any 3 Interests)',
                    style: FormaDJRDisplayBold.copyWith(
                      color: ColorResources.BLACK,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Center(
                              child: is_load_intrest?CircularProgressIndicator():null,
                            )
                          ],
                        ),

                      ],
                    )
                ),
                GridView.count(
                  shrinkWrap: true,
                  primary: false,
                  padding: const EdgeInsets.all(0.0),
                  crossAxisSpacing: 10.0,
                  crossAxisCount: 3,
                  children: [
                    for (var i = 0; i < follows.length; i++)
                    intrestCardWidget(follows[i],follow,"follow"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FlotingAction(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(pageName: "search",),
    );
  }

   unfollow(int index)
  {
    Provider.of<Posts>(context, listen: false).doUnFollows(index);
    setState(() {
      follows=Provider.of<Posts>(context, listen: false).followlist;
      followings=Provider.of<Posts>(context, listen: false).followinglist;

      print(follows.length);
    });
  }
  follow(int index) async
  {
   // followings.removeAt(index);
    if(followings.length < 3) {
      print(index);
      Provider.of<Posts>(context, listen: false).doFollows(index);

      // followings.remove(followings[index]);
      //  followings.removeWhere((element) => element.id==index);
      setState(() {
        follows = Provider
            .of<Posts>(context, listen: false)
            .followlist;
        followings = Provider
            .of<Posts>(context, listen: false)
            .followinglist;


        print(follows.length);
      });
    }else{
      Fluttertoast.showToast(msg: "You can  select upto 3 Interests");
    }

  }
  void search(String string) async
  {
    if(string!="" || string!="") {
      SharedPreferenceHelper().setRecentSearch(string);
      Provider.of<Posts>(context, listen: false).clearSearchPost();
      setState(() {
        is_loaded = true;
      });
      await Provider.of<Posts>(context, listen: false)
          .fetchSearchPost(string)
          .then((_) {
        setState(() {
          _searchList = Provider
              .of<Posts>(context, listen: false)
              .searchposts;
          is_loaded = false;
          if(_searchList.isNotEmpty)
            {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                          SearchResult(_searchList)));
            }
        });

      }

      );
    }
  }
}

