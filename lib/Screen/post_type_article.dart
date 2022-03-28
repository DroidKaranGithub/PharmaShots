import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharmashots/Constants/Constant.dart';
import 'package:pharmashots/Constants/color_resource.dart';
import 'package:pharmashots/Constants/components.dart';
import 'package:pharmashots/Constants/fonts.dart';
import 'package:pharmashots/Posts/postModal.dart';
import 'package:pharmashots/Screen/home_screen.dart';
import 'package:pharmashots/Screen/post_content_screen.dart';
import 'package:pharmashots/Screen/related_post_screen.dart';
import 'package:pharmashots/Screen/webPage.dart';

import 'discover_screen.dart';

class PostTypeArticle extends StatefulWidget {
  final PostModal post;
  const PostTypeArticle(this.post, {Key? key}) : super(key: key);

  @override
  State<PostTypeArticle> createState() => _PostTypeArticleState();
}

class _PostTypeArticleState extends State<PostTypeArticle> {
  var postData = [];
  bool is_bookmark = false;

  void initState() {
    setState(() {});
  }

  void bookmark(int postid) {
    if (is_bookmark == false) {
      addBookmark(postid);
      setState(() {
        is_bookmark = true;
      });
    } else {
      removeBookmark(postid);
      setState(() {
        is_bookmark = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    PageController maincontroller = PageController(initialPage: 1);
    var is_img = widget.post.image_url;
    if (is_img == "") {}
    return Scaffold(
      body: SafeArea(
        child:
        //PostContentScreen(widget.post),
        PageView(
            scrollDirection: Axis.horizontal,
            controller: maincontroller,
            onPageChanged: null,
            children: [
              RelatedPostScreen(widget.post),
              PostContentScreen(widget.post),
            ]),
      ),
    );
  }
}
