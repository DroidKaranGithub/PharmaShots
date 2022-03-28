

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharmashots/Constants/LoaderClass.dart';
import 'package:pharmashots/Constants/color_resource.dart';
import 'package:pharmashots/Constants/fonts.dart';
import 'package:pharmashots/Posts/postProvider.dart';
import 'package:pharmashots/Screen/EventsPost.dart';
import 'package:pharmashots/Screen/ExclusivePost.dart';
import 'package:pharmashots/Screen/InsightsPlusPost.dart';
import 'package:pharmashots/Screen/SpotlightPost.dart';
import 'package:pharmashots/Screen/Top20Post.dart';
import 'package:pharmashots/Screen/ViewPointsPost.dart';
import 'package:pharmashots/Screen/list_screen.dart';
import 'package:pharmashots/Screen/post_by_category.dart';
import 'package:provider/provider.dart';

class QuickReadCard extends StatefulWidget {
  final String? title;
  final int? catId;
  final Image? catIcon;
  const QuickReadCard({
    Key? key,
    this.title,
    this.catId,
    this.catIcon,
  }) : super(key: key);

  @override
  State<QuickReadCard> createState() => _QuickReadCardState();
}

class _QuickReadCardState extends State<QuickReadCard> {
  late OverlayEntry loader;

  @override
  Widget build(BuildContext context) {
    loader = Loader.overlayLoader(context);
    return Container(
      height: 106,
      width: 82,
      child: Column(
        children: [
          InkWell(
            onTap: (){
              loadandNavigate(widget.title.toString(), widget.catId!);
            },
          child:widget.catIcon==null?Image.asset('assets/images/icons svg/bookmark ICON.png',height: 84,width: 78,):widget.catIcon),
          SizedBox(
            height: 8,
          ),
          Text(
            "${widget.title}",
            style: FormaDJRDisplayBold.copyWith(
              color: ColorResources.BLACK,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  void loadandNavigate(String catTitle,int catId) async
  {
    print(catId);

    if(catId==24)
      {
        var count = Provider.of<Posts>(context,listen: false).top20postitemCount;

        print(count);
        if(count ==0)
          {
            Overlay.of(context)!.insert(loader);
            Loader.hideLoader(loader);
            await Provider.of<Posts>(context, listen: false).top20Posts().then((value) =>

                Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Top20Post()))
            );

          }else{
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Top20Post()));
        }
      }

    if(catId==27)
    {
      var count = Provider.of<Posts>(context,listen: false).insightspostCount;

      print(count);
      if(count ==0)
      {
        Overlay.of(context)!.insert(loader);
        Loader.hideLoader(loader);

        await Provider.of<Posts>(context, listen: false).insightsPosts().then((value) =>

            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> InsightsPlusPost()))
        );

      }else{

        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> InsightsPlusPost()));
      }
    }

    if(catId==22)
    {
      var count = Provider.of<Posts>(context,listen: false).eventpostCount;

      print(count);
      if(count ==0)
      {
        Overlay.of(context)!.insert(loader);
        Loader.hideLoader(loader);
        await Provider.of<Posts>(context, listen: false).eventPosts().then((value) =>

            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> EventsPost()))
        );

      }else{
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> EventsPost()));
      }
    }

    if(catId==21)
    {
      var count = Provider.of<Posts>(context,listen: false).viewspointpostCount;

      print(count);
      if(count ==0)
      {
        Overlay.of(context)!.insert(loader);
        Loader.hideLoader(loader);
        await Provider.of<Posts>(context, listen: false).viewspointPosts().then((value) =>

            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ViewPointsPost()))
        );

      }else{
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ViewPointsPost()));
      }
    }

    if(catId==29)
    {
      var count = Provider.of<Posts>(context,listen: false).exclusivepostCount;

      print(count);
      if(count ==0)
      {
        Overlay.of(context)!.insert(loader);
        Loader.hideLoader(loader);
        await Provider.of<Posts>(context, listen: false).exclusivePosts().then((value) =>

            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ExclusivePost()))
        );

      }else{
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ExclusivePost()));
      }
    }

    if(catId==31)
    {
      var count = Provider.of<Posts>(context,listen: false).spotlightpostCount;

      print(count);
      if(count ==0)
      {
        Overlay.of(context)!.insert(loader);
        Loader.hideLoader(loader);
        await Provider.of<Posts>(context, listen: false).spotlightPosts().then((value) =>

            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SpotlightPost()))
        );

      }else{
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SpotlightPost()));
      }
    }

    if(catId==100)
    {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ListPage()));
    }
  }
}
