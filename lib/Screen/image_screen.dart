import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharmashots/Constants/components.dart';
import 'package:pharmashots/Widget/floatingActionWidget.dart';

import 'bottom_bar_screen.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          body: SafeArea(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/images.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 35, left: 23,),
                    child: Row(
                      children: [
                        Container(
                          height: 32,
                          width: 71,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.black54,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(

                              children: [
                                SizedBox(
                                  width: 8,
                                ),
                                SvgPicture.asset('assets/images/icons svg/Icon-feather-share.svg',
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                SvgPicture.asset(
                                  'assets/images/icons svg/Icon ionic-ios-bookmark.svg',
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 23.0),
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: FlotingAction(),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomBar(),
        );
      },

    );
  }
}
