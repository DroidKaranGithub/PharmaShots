import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharmashots/Constants/Constant.dart';
import 'package:pharmashots/Screen/animal_health_screen.dart';
import 'package:pharmashots/Screen/discover_screen.dart';
import 'package:pharmashots/Screen/home_screen.dart';
import 'package:pharmashots/Screen/list_screen.dart';
import 'package:pharmashots/Screen/profile_page.dart';
import 'package:pharmashots/Screen/search_screen.dart';


import '../routs.dart';
import 'discover_screen.dart';

class BottomBar extends StatelessWidget {
  final String? pageName;
  const BottomBar({this.pageName='Home', Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      shape: CircularNotchedRectangle(),
      notchMargin: 2,
      child: Container(
        height: 55,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // button 1
            IconButton(
              icon:SvgPicture.asset(
              'assets/images/icons svg/icn_home_inactive.svg',color: (pageName=="Home")?reddark:Colors.black,
              ),
              onPressed: (){
                if(pageName !="Home") {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomePage()));
                }
              },
              splashColor: Colors.white,
            ),
            // button 2
            IconButton(
                icon: Image.asset('assets/images/watch.png',color: (pageName=="Explore")?reddark:Colors.black,),
                onPressed: (){
                  if(pageName!="Explore") {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => DiscoverPage()));
                  }
                }),
            SizedBox.shrink(),

            // button 3
            IconButton(
                icon:  SvgPicture.asset(
                    'assets/images/icons svg/Icon ionic-ios-bookmark.svg',color: (pageName=="Bookmark")?reddark:Colors.black,
                ),
                onPressed: (){
    if(pageName!="Bookmark") {
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => ListPage()));

    }
    //               Navigator.pushNamed(
    //                 context,
    //                 MyRoutes.InterestPageRout,
    //               );
                }),

            // button 4
            IconButton(
                icon:  SvgPicture.asset(
                    'assets/images/icons svg/icn_profile_active.svg',color: (pageName=="Profile")?reddark:Colors.black,
                ),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ProfilePage()));
                }),
          ],
        ),
      ),
    );
  }
}
