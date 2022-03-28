import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pharmashots/Constants/Constant.dart';
import 'package:pharmashots/Widget/alert_widget.dart';
import 'package:pharmashots/Widget/getStartedFirst.dart';
import 'package:pharmashots/Widget/getStartedSecond.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Constants/ColorButton.dart';


class HomeState extends StatefulWidget{
  @override
  State<HomeState> createState() => _HomeStateState();
}

class _HomeStateState extends State<HomeState> {
  DateTime? currentBackPressTime;

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: "press back twice to exit");
      return Future.value(false);
    }
    return exit(0);
  }

  @override
  void initState() {
    super.initState();
    checkForPopup();
  }

  void checkForPopup() async{

    final pref = await SharedPreferences.getInstance();

    final int? timestamp = pref.getInt('displayPopupTime');
    if(timestamp==null){
      displayPopupTime();
    }else{
      DateTime before = DateTime.fromMillisecondsSinceEpoch(timestamp);
      DateTime now = DateTime.now();
      Duration timeDifference = now.difference(before);
      int days = timeDifference.inDays;
      print(days);
      if(days>15)
      {
        displayPopupTime();
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                AlertWidget()
            )
        );
      }
    }
  }

  void displayPopupTime() async{
    int timestamp = DateTime.now().millisecondsSinceEpoch;
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('displayPopupTime', timestamp);
  }



  @override
  Widget build(BuildContext context) {
    var height = AppBar().preferredSize.height;
    PageController maincontroller =PageController(initialPage: 0);

    return WillPopScope(
        onWillPop: onWillPop,
        child:
        Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body:
      PageView(
          scrollDirection: Axis.horizontal,
          controller: maincontroller,
          children: [
           // firstScreen(context,maincontroller),
            firstScreen(),
            secondScreen()
            //SizedBox(height: 80,),

      ]
    )
    ));
  }
}