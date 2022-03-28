import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharmashots/Constants/color_resource.dart';
import 'package:pharmashots/Constants/components.dart';
import 'package:pharmashots/Constants/fonts.dart';
import 'package:pharmashots/Screen/bottom_bar_screen.dart';
import 'package:pharmashots/Widget/floatingActionWidget.dart';

class AnimalHealth extends StatelessWidget {
  const AnimalHealth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {}
        ),
        backgroundColor: Colors.transparent,
        title: Center(
          child: Text('Animal Health',style:  FormaDJRDisplayBold.copyWith(
            color: ColorResources.BLACK,
            fontSize: 20
          ),),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(left: 17,right: 17),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Container(
                    height: 220,
                    width: MediaQuery.of(context).size.width * 75,
                    child: Stack(
                      children: [
                        Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: 155,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                image: DecorationImage(
                                  image:
                                  AssetImage('assets/images/Rectangle 9.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )),
                        Positioned(
                         right: 0,
                          bottom: 0,
                          left: 0,
                          top: 162,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Container(
                              height: 31,
                              width: 222,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      'Dengue Cases On Rise : Here’s What You Can Do To Protect Yourself',
                              style: FormaDJRDisplayBold.copyWith(
                                color: ColorResources.BLACK,
                              ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0,top: 6),
                                    child: Row(
                                      children: [

                                        Spacer(),
                                        Text('ANIMAL HEALTH',style:HelveticaBold.copyWith(
                                          color: ColorResources.Orange,
                                        ), ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        SvgPicture.asset(
                                            'assets/images/icons svg/Icon-feather-share.svg',
                                          color: Colors.black,
                                        ),
                                        SizedBox(
                                          width: 8,
                                        ),
                                        SvgPicture.asset(
                                            'assets/images/icons svg/Icon ionic-ios-bookmark.svg',
                                          height: 14,
                                          width: 13,
                                        ),
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
                )
            ),
            for (var i = 0; i < 10; i++)
              Slidable(
                endActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  //  dismissible: DismissiblePane(onDismissed: () {}),
                  children: const [
                    SlidableAction(
                      onPressed: null,
                      // backgroundColor: Colors.white,
                      foregroundColor: Colors.orange,
                      icon: Icons.delete,

                    ),
                  ],
                ),
                child: listwidget(),
              )
          ],
        ),
      ),
      floatingActionButton: FlotingAction(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(),
    );
  }
}
