import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharmashots/Constants/Constant.dart';
import 'package:pharmashots/Constants/color_resource.dart';
import 'package:pharmashots/Constants/components.dart';
import 'package:pharmashots/Constants/fonts.dart';
import 'package:pharmashots/Posts/postModal.dart';
import 'package:pharmashots/Posts/postProvider.dart';
import 'package:provider/provider.dart';

import '../Widget/loadingWidget.dart';


class RelatedPostScreen extends StatefulWidget {
  final PostModal post;
  const RelatedPostScreen(this.post,{Key? key}) : super(key: key);

  @override
  State<RelatedPostScreen> createState() => _RelatedPostScreenState();
}

class _RelatedPostScreenState extends State<RelatedPostScreen> {
  late CarouselSlider carouselSlider;

  final CarouselController _controller = CarouselController();
  bool is_load=true;
  List<PostModal> related=[];
  int _current = 0;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  final List _Img = [
    'assets/images/card.png',
    'assets/images/card.png',
    'assets/images/card.png'
  ];

  void initState() {
    _fetchData();
    print(related);
    setState(() {

    });

    super.initState();
  }

  Future<bool> _fetchData() async {
    Provider.of<Posts>(context, listen: false).relatedPosts(widget.post.slug.toString(), widget.post.Id.toString()).then((_) {
      setState(() {
        related=Provider.of<Posts>(context, listen: false).relatedposts;
        is_load=false;
      });
    });
    return true;
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body:is_load?displayloading(context):
      Container(
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: new LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 33, 135, 186),
                Color.fromARGB(255, 19, 219, 236)
              ],
            )
        ),
        child:LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Text('Related Posts',style:FormaDJRDisplayBold.copyWith(
                          color: ColorResources.WHITE,
                          fontSize: 20
                      ),),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 28,
                        ),
                        CarouselSlider(
                            items: [
                              ...related.map(
                                    (e) =>
                                        Builder(
                                      builder: (BuildContext context) {

                                        return Padding(
                                          padding: const EdgeInsets.only(left: 12.0,right: 12),
                                          child: Card(
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(15.0),
                                            ),
                                            child: Container(
                                              height: MediaQuery.of(context).size.height * 0.29,
                                             width: double.infinity,
                                               child: Stack(
                                                children: [
                                                  Positioned(
                                                      top: 0,
                                                      left: 0,
                                                      right: 0,
                                                      child: Container(
                                                       // height: MediaQuery.of(context).size.height * 0.20,
                                                       // width: double.infinity,
                                                        height: 154,
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.only(
                                                            topRight: Radius.circular(12),
                                                            topLeft: Radius.circular(12),
                                                          ),
                                                          image: DecorationImage(
                                                            image:
                                                            NetworkImage(e.image_url.toString(),),
                                                            fit: BoxFit.fill,
                                                          ),
                                                        ),
                                                      )),
                                                  Positioned(
                                                    right: 0,
                                                    bottom: 0,
                                                    left: 0,
                                                    top: 142,
                                                    child: Padding(
                                                      padding: const EdgeInsets.only(left: 12),
                                                      child: Container(
                                                        height: 31,
                                                        width: double.infinity,
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Container(
                                                              width: MediaQuery.of(context).size.width-200,
                                                              height: 15,
                                                              child:ListView.builder(
                                                                scrollDirection: Axis.horizontal,
                                                                itemBuilder: (ctx,index){
                                                                  return Padding(padding: EdgeInsets.all(2),
                                                                  );
                                                                },

                                                              )
                                                              ,
                                                            ),

                                                            posttitle(e,_current,related),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );

                                      },

                                    ),
                              ),
                            ],
                            options: CarouselOptions(
                                height: MediaQuery.of(context).size.height * 0.71,
                               viewportFraction: 0.45,
                                autoPlay: true,
                                enableInfiniteScroll: false,
                               // enlargeCenterPage: true,
                               aspectRatio: 2.0,
                                scrollDirection: Axis.vertical,

                                enlargeStrategy: CenterPageEnlargeStrategy.height,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    _current = index;
                                  });
                                }
                            )
                        ),

                        // SingleChildScrollView(
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.start,
                        //     children: related.asMap().entries.map((entry) {
                        //       return Flexible(
                        //         child: GestureDetector(
                        //           onTap: () => _controller.animateToPage(entry.key),
                        //           child: Container(
                        //             width: 8.0,
                        //             height: 8.0,
                        //             margin: EdgeInsets.symmetric(
                        //                 vertical: 4.0, horizontal: 4.0),
                        //             decoration: BoxDecoration(
                        //                 shape: BoxShape.circle,
                        //                 color: (Theme.of(context).brightness ==
                        //                     Brightness.dark
                        //                     ? Colors.white
                        //                     : Colors.black)
                        //                     .withOpacity(
                        //                     _current == entry.key ? 0.9 : 0.4)),
                        //           ),
                        //         ),
                        //       );
                        //     }).toList(),
                        //   ),
                        // )

                      ],
                    ),

                  ],
                ),
              );
            }
        ),
      ),
    );
  }

  Widget posttitle(PostModal post,int read_index,List<PostModal> related)
  {
    return InkWell(
      onTap:(){
        var link=  MAIN_URL+"/"+post.Id.toString()+"/"+post.slug.toString();
        //openInAppWeb(context,link);
        openInReadPost(context,related,read_index);

      },
    child:Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(post.title.toString(),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style:FormaDJRDisplayBold.copyWith(
        color: ColorResources.BLACK,
        fontSize: 12,


      ),),
    ));
  }

}



