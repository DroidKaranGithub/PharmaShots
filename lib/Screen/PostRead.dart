import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharmashots/Constants/color_resource.dart';
import 'package:pharmashots/Constants/components.dart';
import 'package:pharmashots/Constants/fonts.dart';
import 'package:pharmashots/Posts/postModal.dart';
import 'package:pharmashots/Posts/postProvider.dart';
import 'package:pharmashots/Screen/bottom_bar_screen.dart';
import 'package:pharmashots/Screen/list_screen.dart';
import 'package:pharmashots/Screen/post_type_article.dart';

import 'package:pharmashots/Widget/floatingActionWidget.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class PostRead extends StatefulWidget {
  final int? read_index;
  const PostRead({@required this.read_index, Key? key}) : super(key: key);

  @override
  State<PostRead> createState() => _PostReadState();
}

class _PostReadState extends State<PostRead> {
  var postData = [];

  bool isLoaded=false;

  void initState() {
    // _fetchData();
    setState(() {

    });

    super.initState();
  }
  Future<bool> _fetchData() async {
    Provider.of<Posts>(context, listen: false).fetchUserDiscovered().then((_) {
      setState(() {
        isLoaded=true;
      });
    });
    return true;
  }

  Future<Null> refreshList() async {
    try {
      await Provider.of<Posts>(context, listen: false).fetchUserDiscovered();
      setState(() {
        postData = Provider.of<Posts>(context, listen: false).posts;


      });
    } catch (error) {
      print(error);
      const errorMsg = 'Could not refresh!';

    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final postData = Provider.of<Posts>(context, listen: false).postItem;
    final courseCount = postData.length;
    print(courseCount);
    if(courseCount==0)
    {
      refreshList();
    }
    PageController controller = PageController(initialPage: widget.read_index!);

    List<Widget> news=[
      for (var i = 0; i < courseCount; i++)
        PostTypeArticle(postData[i])

    ];
    return Scaffold(
      body: SafeArea(
        child:
        // PageView(
        //   scrollDirection: Axis.horizontal,
        //   controller: maincontroller,
        //   children: [
        //     TopDoctors(),
        PageView(
          scrollDirection: Axis.vertical,


          children: news,
          controller: controller,
        )

        //   ],
        // )

        ,
      ),
      floatingActionButton: FlotingAction(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(pageName: "Post Read",),
    );
  }


}
