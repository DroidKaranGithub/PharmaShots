import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharmashots/Category/categoryModal.dart';
import 'package:pharmashots/Constants/color_resource.dart';
import 'package:pharmashots/Constants/fonts.dart';

Widget intrestCardWidget(IntrestModal intrest, Function action, String name) {
  return InkWell(
    onTap: () {
      action(int.parse(intrest.id!));
    },
    child: Card(
      child: Container(
        height: 110,
        width: 99,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Container(
                height: 70,
                width: 99,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(6),
                    topLeft: Radius.circular(6),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(intrest.image.toString()),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    right: 3,
                  ),
                  child: Row(
                    children: [
                      Spacer(),
                      InkWell(
                        onTap: () {
                          action(int.parse(intrest.id!));
                        },
                        child: Container(
                          // height: 25,
                          // width: 25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                           // color: ColorResources.OrangeLight,
                          ),
                          child: name == "following"
                              ? Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: ColorResources.OrangeLight,
                                    ),
                                    child: Icon(
                                      Icons.close,
                                      color: Colors.white,
                                      size: 15,
                                    ),
                                  ),
                                  //  checkbox_true_svg(),
                                  // Image.asset(
                                  //   'assets/images/check.png',
                                  //   fit: BoxFit.cover,
                                  //   color: Colors.white,
                                  // ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.white,
                                    ),
                                    child: Center(
                                      child: SvgPicture.asset(
                                        'assets/images/icons svg/icons-check-circle.svg',
                                        color: ColorResources.OrangeLight,
                                        height: 19,
                                        width: 19,
                                      ),
                                    ),
                                  )

                                  //  checkbox_false_svg(),
                                ),
                        ),
                      ),


                    ],
                  ),
                ),
              ],
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                    // height: 32,
                    // width: 99,
                    child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    intrest.category_name.toString(),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: Helveticaregular.copyWith(
                      color: ColorResources.BLACK,
                      fontSize: 10,
                    ),
                  ),
                ))),
          ],
        ),
      ),
    ),
  );
}

Widget checkbox_true_svg() {
  return SvgPicture.asset(
    'assets/images/icons svg/checkbox_true.svg',
    color: Colors.red,
    height: 14,
    width: 14,
  );
}

Widget checkbox_false_svg() {
  return SvgPicture.asset(
    'assets/images/icons svg/checkbox_false.svg',
    color: Colors.red,
    height: 14,
    width: 14,
  );
}
