


import 'package:flutter/cupertino.dart';
import 'package:pharmashots/Constants/color_resource.dart';
import 'package:pharmashots/Constants/fonts.dart';

Widget recentSearchWord(String word)
{
  double w=72;
  if(word.length >=9 && word.length <=15) {
    w = 90;
  }
  if(word.length >15)
    {
      w=120;
    }

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        height: 21,
        width:w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: ColorResources.BLACK10),
        child: Center(
            child: Text(
              word,
              overflow: TextOverflow.ellipsis,
              style: Helveticaregular.copyWith(
                  color: ColorResources.BLACK, fontSize: 11),
            )),
      ),
      SizedBox(
        width: 12,
      ),
    ],
  );
}