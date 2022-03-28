
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharmashots/Constants/LoaderClass.dart';
import 'package:pharmashots/Constants/color_resource.dart';
import 'package:pharmashots/Constants/components.dart';
import 'package:pharmashots/Constants/fonts.dart';
import 'package:pharmashots/Posts/postModal.dart';
import 'package:pharmashots/Posts/postProvider.dart';
import 'package:pharmashots/Screen/bottom_bar_screen.dart';
import 'package:pharmashots/Widget/floatingActionWidget.dart';
import 'package:pharmashots/Widget/post_list_widget.dart';
import 'package:provider/provider.dart';

import '../Widget/loadingWidget.dart';


class PostByCategory extends StatefulWidget {
  final String? title;
  final int? catId;
  const PostByCategory({Key? key,this.title,this.catId}) : super(key: key);

  @override
  State<PostByCategory> createState() => _PostByCategoryState();
}

class _PostByCategoryState extends State<PostByCategory> {
  late OverlayEntry loader;
  List<PostModal> postData =[];
  bool is_load=true;


  // At the beginning, we fetch the first 20 posts
  int _page = 0;
  int _limit = 20;

  // There is next page or not
  bool _hasNextPage = true;

  // Used to display loading indicators when _firstLoad function is running
  bool _isFirstLoadRunning = false;

  // Used to display loading indicators when _loadMore function is running
  bool _isLoadMoreRunning = false;






  // This function will be triggered whenver the user scroll
  // to near the bottom of the list view
  void _loadMore() async {
    if (_hasNextPage == true &&
        _isFirstLoadRunning == false &&
        _isLoadMoreRunning == false &&
        _controller.position.extentAfter < 300) {
      setState(() {
        _isLoadMoreRunning = true; // Display a progress indicator at the bottom
      });
      _page += 1; // Increase _page by 1
      try {
        await Provider.of<Posts>(context, listen: false).categoryByPosts(
            widget.catId.toString(),page: _page).then((_) {
          setState(() {
            is_load = false;
            postData = Provider
                .of<Posts>(context, listen: false)
                .categorybyposts;
            Provider.of<Posts>(context, listen: false).setpostItem(postData);
          });
        }
        );


      } catch (err) {
        print('Something went wrong!');
      }

      setState(() {
        _isLoadMoreRunning = false;
      });
    }
  }

  // The controller for the ListView
  late ScrollController _controller;




  @override
  void dispose() {
    _controller.removeListener(_loadMore);
    super.dispose();
  }

  void initState() {
    fetchPost();
    _controller = new ScrollController()..addListener(_loadMore);
    super.initState();

  }

  void fetchPost() async
  {


      await Provider.of<Posts>(context, listen: false).categoryByPosts(
          widget.catId.toString()).then((_) {
        setState(() {
          is_load = false;
          postData = Provider
              .of<Posts>(context, listen: false)
              .categorybyposts;
          Provider.of<Posts>(context, listen: false).setpostItem(postData);
        });
      }
      );

  }
  @override
  Widget build(BuildContext context) {

   // final postData=Provider.of<Posts>(context, listen: false).categorybyposts;
    final courseCount = postData.length;
    print(courseCount);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            }
        ),
        backgroundColor: Colors.transparent,
        title:Text(widget.title.toString(),style:  FormaDJRDisplayBold.copyWith(
              color: ColorResources.BLACK,
              fontSize: 20
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body:is_load?displayloading(context):  Column(
          children: [
        Expanded(
        child: ListView.builder(
             controller: _controller,
                itemBuilder:(context,index){
                return postlistwidget(postData[index],read_index: index,read_mode: "inAppScreen");
                },
                itemCount: postData.length,
                ),)
            // for (var i = 0; i < courseCount; i++)
            //   postlistwidget(postData[i],read_index: i,read_mode: "inAppScreen"),

          ],

      ),
      floatingActionButton: FlotingAction(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(pageName: "Category Post",),
    );
  }
}
