import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pharmashots/ApiRepository/shared_pref_helper.dart';
import 'package:pharmashots/Constants/Constant.dart';
import 'package:http/http.dart' as http;
import 'package:pharmashots/Posts/postModal.dart';
import 'package:pharmashots/Widget/post_list_widget.dart';

class PostBookmarkWidget extends StatefulWidget {
  String? Id;
  int? iSBookmarked;
  Color? color;
  double? h;
  double? w;
   PostBookmarkWidget({@required this.Id,@required this.iSBookmarked,this.color,this.h,this.w, Key? key}) : super(key: key);

  @override
  _PostBookmarkWidgetState createState() => _PostBookmarkWidgetState();
}

class _PostBookmarkWidgetState extends State<PostBookmarkWidget>{

  bool inittial=true;
  bool is_bookmark=false;
  @override
  void initState() {
    if(widget.iSBookmarked==1)
      {
        setState(() {
          is_bookmark=true;
        });
      }
    super.initState();


  }

  @override
  void dispose() {
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

      return Container(
        child:is_bookmark?activeBookmark():deactiveBookmark(),
      );

  }

  Widget activeBookmark()
  {
    return InkWell(
      onTap:(){ removeBookmark(widget.Id);},
      child:SvgPicture.asset(
        'assets/images/icons svg/fill_bookmark_icon.svg',
        color: Colors.red,
        height: widget.h==null?null:widget.h,
        width: widget.w==null?null:widget.w,
      ) ,
    );
  }
  Widget deactiveBookmark()
  {
    return InkWell(
      onTap:(){ addBookmark(widget.Id);},
      child:SvgPicture.asset(
        'assets/images/icons svg/Icon ionic-ios-bookmark.svg',
        color: widget.color==null?Colors.white:widget.color,
        height: widget.h==null?null:widget.h,
        width: widget.w==null?null:widget.w,

      ) ,
    );
  }


  void addBookmark(String? post_id) async
  {
    var url = BASE_URL + 'user/add-to-bookmark';
    var uri = Uri.parse(url);

//var request = http.MultipartRequest('POST', uri);
    var token=await SharedPreferenceHelper().getAuthToken();
    Map<String,String> userHeader = {"Content-type": "application/json", "Accept": "application/json","Authorization": "Bearer $token"};

    if(post_id !=null )
    {
      var request = http.MultipartRequest('POST', uri);

      request.headers.addAll(userHeader);
      request.fields['post_id'] = post_id.toString();

      final response = await request.send();
      if (response.statusCode == 200) {
        // If the server did return a 201 CREATED response,
        // then parse the JSON.\\
        Fluttertoast.showToast(msg: "Bookmarked Successfully");
        if(is_bookmark==false){
          setState(() {
            is_bookmark=true;
          });
        }else{
          setState(() {
            is_bookmark=false;
          });
        }
      } else {
        // If the server did not return a 201 CREATED response,
        // then throw an exception.
        Fluttertoast.showToast(msg: "Exception occur");

      }




    }
  }


  void removeBookmark(String? post_id) async
  {
    var url = BASE_URL + 'user/remove-from-bookmark';
    var uri = Uri.parse(url);
    var token=await SharedPreferenceHelper().getAuthToken();
    Map<String,String> userHeader = {"Content-type": "application/json", "Accept": "application/json","Authorization": "Bearer $token"};

    if(post_id !=null )
    {
      var request = http.MultipartRequest('POST', uri);

      request.headers.addAll(userHeader);
      request.fields['post_id'] = post_id.toString();

      final response = await request.send();
      if (response.statusCode == 200) {
        // If the server did return a 201 CREATED response,
        // then parse the JSON.\\
        Fluttertoast.showToast(msg: "Bookmarked Removed Successfully");
        if(is_bookmark==false){
          setState(() {
            is_bookmark=true;
          });
        }else{
          setState(() {
            is_bookmark=false;
          });
        }
      } else {
        // If the server did not return a 201 CREATED response,
        // then throw an exception.
        Fluttertoast.showToast(msg: "Exception occur");
      }




    }
  }
}