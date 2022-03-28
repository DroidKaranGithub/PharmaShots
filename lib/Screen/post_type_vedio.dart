
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharmashots/Constants/color_resource.dart';
import 'package:pharmashots/Constants/fonts.dart';
import 'package:pharmashots/Posts/postModal.dart';

Widget PostTypeVedios(BuildContext context, PostModal post)
{
  return Stack(
    children: [
      Positioned(
        top: 0,
        right: 0,
        left: 0,
        child: Container(
          height: 255,
          width: 390,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/Rectangle 9.png"),
                  fit: BoxFit.fill)),
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
              Image.asset('assets/images/play-button (1).png'),
            ],
          ),
        ),

      ),
      Padding(
        padding: const EdgeInsets.only(top: 200),
        child: Container(
          height: double.infinity,
          width: 390,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft:Radius.circular(40),
                topRight:Radius.circular(40),),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 15,
                  spreadRadius: 5,
                )
              ]
          ),
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: ColorResources.OrangeLight,
                      ),
                      child: Center(child: Text('BIOTHECH',
                        style:HelveticaBold.copyWith(
                            color: ColorResources.WHITE,
                            fontSize: 12
                        ),)),

                    ),
                    Spacer(),
                    Text('7 Jan, 2022',
                      style: Helveticaregular.copyWith(
                          color: ColorResources.BLACK,
                          fontSize: 13
                      ),)
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Text('Boehringer Ingelheim Animal Health Establishes Pawru for its PetPro Portfolio'
                  ,style: FormaDJRDisplayBold.copyWith(
                      color: ColorResources.BLACK,
                      fontSize: 16
                  ),),
                SizedBox(
                  height: 12,
                ),
                Text('Humans depends on livestock for survival and Animal Health has always been an issue to look for since it directly reflects the betterment of human life For a country’s economy and balanced human life, proper care and disease-free health of animals play a key role. Since rapid environmental change has targeted animal health, it becomes important to expand the innovation procedure in the field of medicines meant for animal health In the Top 20 ledgers, Zoetis ensured the top position with total revenue of 6.67B. Our team at PharmaShots has compiled the report of the top 20 Animal Health companies based on the 2020 animal health revenue',
                  style: Helveticaregular.copyWith(
                      color: ColorResources.LIGHTBLACK,
                      fontSize: 13
                  ),),
                SizedBox(
                  height: 12,
                ),
                Container(
                  height: 44,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: ColorResources.OrangeLight,
                  ),
                  child: Center(child: Text('TAP HERE TO READ FULL STORY',
                    style: HelveticaBold.copyWith(
                        color: ColorResources.WHITE,
                        fontSize: 12
                    ),)),

                ),
                TextButton(onPressed: () {

                }, child: Text('Swipe left to see the related news',
                  style: FormaDJRDisplayBold.copyWith(
                      color: ColorResources.BLACK,
                      fontSize: 12
                  ),)),
              ],
            ),
          ),
        ),
      ),


    ],
  );
}