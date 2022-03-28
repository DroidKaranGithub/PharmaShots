import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharmashots/Constants/Constant.dart';
import 'package:pharmashots/Constants/color_resource.dart';
import 'package:pharmashots/Constants/components.dart';
import 'package:pharmashots/Constants/fonts.dart';
import 'package:pharmashots/Posts/postModal.dart';
import 'package:pharmashots/Screen/home_screen.dart';
import 'package:pharmashots/Screen/post_by_category.dart';
import 'package:pharmashots/Widget/post_bookmark_widget.dart';
// import 'package:flutter_html/flutter_html.dart';
import 'package:html/parser.dart' as html_parser;

class PostContentScreen extends StatefulWidget {
  final PostModal post;
  const PostContentScreen(this.post, {Key? key}) : super(key: key);

  @override
  State<PostContentScreen> createState() => _PostContentScreenState();
}

class _PostContentScreenState extends State<PostContentScreen> {
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
    var is_img = widget.post.image_url;
    if (is_img == "") {}
    return Stack(
      children: [
        Positioned(
          top: 0,
          right: 0,
          left: 0,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.25,
            width: double.infinity,
            // MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(widget.post.image_url.toString()),
                    fit: BoxFit.fill)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    left: 20,
                    right: 20,
                  ),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      HomePage()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 6.0),
                          child: Container(
                            height: 32,
                            width: 32,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.black54,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset(
                                'assets/images/icons svg/reload.svg',
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),



                      Container(
                        height: 32,
                       // width: 71,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.black54,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 5,
                              ),
                              InkWell(
                                  onTap: () {
                                    var link = MAIN_URL +
                                        "/" +
                                        widget.post.Id.toString() +
                                        "/" +
                                        widget.post.slug.toString();
                                    var t = widget.post.title.toString() +
                                        " " +
                                        link;
                                    onShare(
                                        context,
                                        widget.post.title.toString(),
                                        t.toString());
                                  },
                                  child: SvgPicture.asset(
                                    'assets/images/icons svg/Icon-feather-share.svg',
                                    color: Colors.white,
                                    height: 20,
                                    width: 19,
                                  )),
                              SizedBox(
                                width: 20,
                              ),
                              PostBookmarkWidget(
                                iSBookmarked: widget.post.is_bookmarked,
                                Id: widget.post.Id!,
                                h: 20,
                                w: 19,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Image.asset('assets/images/play-button (1).png'),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0.0,
          right: 0.0,
          left: 0.0,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.68,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 15,
                    spreadRadius: 5,
                  )
                ]),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      // Container(
                      //   width: MediaQuery.of(context).size.width-200,
                      //   height: 30,
                      //   child:ListView.builder(
                      //       scrollDirection: Axis.horizontal,
                      //       itemBuilder: (ctx,index){
                      //         return Container(
                      //           height: 40,
                      //           width: 90,
                      //           decoration: BoxDecoration(
                      //             borderRadius: BorderRadius.circular(16),
                      //             color: ColorResources.OrangeLight,
                      //           ),
                      //           child: Center(child: Text(widget.post.catlist![index].category_name.toString(),
                      //             style:HelveticaBold.copyWith(
                      //                 color: ColorResources.WHITE,
                      //                 fontSize: 12
                      //             ),)),
                      //         );
                      //       },
                      //   itemCount:widget.post.catlist!.length,
                      //   )
                      //   ,
                      // ),
                      Container(
                        height: 35,
                       // width: 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: ColorResources.OrangeLight,
                        ),
                        child: Center(
                            child: widget.post.catlist!.length > 0
                                ? InkWell(
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              PostByCategory(
                                                title: widget.post.catlist![0].category_name.toString(),
                                                catId: int.parse(widget.post.catlist![0].id.toString()),
                                              )));
                                },
                                child:Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      widget.post.catlist![0].category_name
                                          .toString(),
                                      style: HelveticaBold.copyWith(
                                          color: ColorResources.WHITE,
                                          fontSize: 11),
                                    ),
                                ))
                                : Text("")),
                      ),
                      Spacer(),
                      Text(
                        widget.post.postDt.toString(),
                        overflow: TextOverflow.ellipsis,
                        style: Helveticaregular.copyWith(
                            color: ColorResources.BLACK, fontSize: 13),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    widget.post.title.toString(),
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: FormaDJRDisplayBold.copyWith(
                        color: ColorResources.BLACK, fontSize: 15,
                    fontWeight: FontWeight.bold,),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Expanded(
                    flex: 1,
                    child: Scrollbar(
                      isAlwaysShown: true,
                      child: Html(
                        data: widget.post.shot_content.toString(),
                        // renderNewlines: true,
                        // defaultTextStyle: TextStyle(fontSize: 13,color: Colors.black.withOpacity(0.7), ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  GestureDetector(
                      onTap: () {
                        var link = MAIN_URL +
                            "/" +
                            widget.post.Id.toString() +
                            "/" +
                            widget.post.slug.toString();
                        // openInAppWeb(context, link);
                        openInAppWeb(context, widget.post.fulllink.toString());
                      },
                      child: Container(
                        height: 38,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: ColorResources.OrangeLight,
                        ),
                        child: Center(
                            child: Text(
                          'TAP HERE TO READ FULL STORY',
                          style: HelveticaBold.copyWith(
                              color: ColorResources.WHITE, fontSize: 12),
                        )),
                      )),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                  ),
                  // TextButton(
                  //     onPressed: () {},
                  //     child: Text(
                  //       'Swipe left to see the related news',
                  //       style: FormaDJRDisplayBold.copyWith(
                  //           color: ColorResources.BLACK, fontSize: 12),
                  //     )),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
