

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart';
import 'package:pharmashots/Category/categoryModal.dart';
import 'package:pharmashots/Constants/Constant.dart';
import 'package:pharmashots/Constants/color_resource.dart';
import 'package:pharmashots/Constants/components.dart';
import 'package:pharmashots/Constants/fonts.dart';
import 'package:pharmashots/Posts/postModal.dart';
import 'package:pharmashots/Screen/post_by_category.dart';
import 'package:pharmashots/Widget/post_bookmark_widget.dart';

class TopNewsCard extends StatelessWidget {
  final List<PostModal>? posts;
  final String? image_url;
  final String? title;
  final int? id;
  final String? slug;
  final int? is_bookmark;
  final int? read_index;
  final List<PostCategoryModal>? catlist;
  const TopNewsCard({
    this.posts,
    this.slug,
    this.image_url,
    this.id,
    this.title,
    this.is_bookmark,
    this.catlist,
    this.read_index,

    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        height: 200,
        width: 236,
        child: Stack(
          children: [
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: InkWell(
                  onTap: (){
                    var link= MAIN_URL+"/"+id.toString()+"/"+slug.toString();
                   // openInAppWeb(context,link);
                    openInReadPost(context,posts!,read_index!);
                  },
                child:Container(
                  height: 124,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12),
                      topLeft: Radius.circular(12),
                    ),
                    image: DecorationImage(
                      image:
                      NetworkImage(image_url.toString()),
                      fit: BoxFit.contain,
                    ),
                  ),
                ))),
            Positioned(
              right: 0,
              bottom: 0,
              left: 0,
              top: 132,
              child: Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Container(
                  height: 31,
                  width: 222,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Container(
                      //   width: MediaQuery.of(context).size.width-200,
                      //   height: 15,
                      //   child:ListView.builder(
                      //     scrollDirection: Axis.horizontal,
                      //     itemBuilder: (ctx,index){
                      //       return Padding(padding: EdgeInsets.all(2),child:Text(catlist![index].category_name.toString(),style:HelveticaBold.copyWith(
                      //         color: ColorResources.Orange,
                      //       ), ));
                      //     },
                      //     itemCount:catlist!.length,
                      //   )
                      //   ,
                      // ),
                  InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    PostByCategory(
                                      title: catlist![0].category_name.toString(),
                                      catId: int.parse(catlist![0].id.toString()),
                                    )));
                      },child:
                  Padding(padding: EdgeInsets.all(2),child:Text(catlist![0].category_name.toString(),style:HelveticaBold.copyWith(
                    color: ColorResources.Orange,
                  ), ))
                    ,
                  ),

                  InkWell(
                    onTap: (){
                      var link= MAIN_URL+"/"+id.toString()+"/"+slug.toString();
                     // openInAppWeb(context,link);
                      openInReadPost(context,posts!,read_index!);

                    },
                    child:Text(
                        title.toString(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: FormaDJRDisplayBold.copyWith(
                          color: ColorResources.BLACK,
                        ),
                      )),
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0,top: 18),
                        child: Row(
                          children: [

                            Spacer(),

                            SizedBox(
                              width: 8,
                            ),
                        InkWell(
                          onTap: () {
                            var link = MAIN_URL + "/" +
                                id.toString() + "/" +
                                slug.toString();
                            var t = title.toString() + " " + link;
                            onShare(context, title.toString(),
                                t.toString());
                          },
                          child: SvgPicture.asset(
                              'assets/images/icons svg/Icon-feather-share.svg',
                              color: Colors.black,
                            )),
                            SizedBox(
                              width: 8,
                            ),
                            PostBookmarkWidget(iSBookmarked: is_bookmark,Id: id.toString(),color: Colors.black,h: 14,w: 13,),
                            // SvgPicture.asset(
                            //   'assets/images/icons svg/Icon ionic-ios-bookmark.svg',
                            //   height: 14,
                            //   width: 13,
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
