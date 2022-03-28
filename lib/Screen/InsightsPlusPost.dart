
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharmashots/Constants/Constant.dart';
import 'package:pharmashots/Constants/color_resource.dart';
import 'package:pharmashots/Constants/components.dart';
import 'package:pharmashots/Constants/fonts.dart';
import 'package:pharmashots/Posts/postModal.dart';
import 'package:pharmashots/Posts/postProvider.dart';
import 'package:pharmashots/Screen/bottom_bar_screen.dart';
import 'package:pharmashots/Widget/floatingActionWidget.dart';
import 'package:pharmashots/Widget/post_list_widget.dart';
import 'package:provider/provider.dart';

import 'package:pharmashots/Constants/LoaderClass.dart';


class InsightsPlusPost extends StatefulWidget {

  const InsightsPlusPost({Key? key}) : super(key: key);

  @override
  State<InsightsPlusPost> createState() => _InsightsPlusPostState();
}

class _InsightsPlusPostState extends State<InsightsPlusPost> {
  late OverlayEntry loader;
  var postData =[];

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
        await Provider.of<Posts>(context, listen: false).insightsPosts(page: _page).then((value){
          setState(() {
            postData=Provider.of<Posts>(context, listen: false).insightsposts;

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


  void initState() {
    _controller = new ScrollController()..addListener(_loadMore);
    setState(() {
      postData=Provider.of<Posts>(context, listen: false).insightsposts;

    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(_loadMore);
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    loader = Loader.overlayLoader(context);

    // final postData=Provider.of<Posts>(context, listen: false).insightsposts;
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
        title: Text("Insights+",style:  FormaDJRDisplayBold.copyWith(
              color: ColorResources.BLACK,
              fontSize: 20
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body:  Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _controller,
              itemBuilder:(context,index){
                return postlistwidget(postData[index],read_mode: "web");
              },
              itemCount: postData.length,
            ),)
          // for (var i = 0; i < courseCount; i++)
          //   Slidable(
          //
          //     child: postlistwidget(postData[i],read_mode: "web",),
          //   )
        ],
      ),
      floatingActionButton: FlotingAction(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(pageName: "Category Post",),
    );
  }
}
