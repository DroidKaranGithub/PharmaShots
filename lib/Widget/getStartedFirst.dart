
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:pharmashots/Constants/ColorButton.dart';
// import 'package:pharmashots/Constants/Constant.dart';
// import '../Screen/home.dart';
//
// Widget firstScreen(BuildContext context,PageController maincontroll)
// {
//   return Container(
//     height: MediaQuery.of(context).size.height * 1,
//     width: MediaQuery.of(context).size.width * 1,
//     child: Stack(
//       //mainAxisAlignment: MainAxisAlignment.end,
//         children: [ Center(
//     child: Column(
//       children: [
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.4,
//         ),
//         Padding(padding: EdgeInsets.all(12),child: Center(
//           child: Image.asset('assets/images/Image1@2x.png'),
//         )),
//         SizedBox(
//           height: MediaQuery.of(context).size.height * 0.15,
//         ),
//         Padding(padding: EdgeInsets.all(12),
//             child: Center(
//               child:InkWell
//                 (
//                 onTap: (){
//                   print("Click Next");
//                   maincontroll.animateToPage(1,duration: Duration(milliseconds: 500), curve: Curves.ease);
//                   // Navigator.push(context,
//                   //     MaterialPageRoute(builder: (context) {
//                   //       return GetStarted1();
//                   //     }));
//                 },
//                 child:ColorButton(
//                   title: 'Next',
//                   width: 178,
//                   height: 50,
//                   colorValue: orange,
//                 ) ,
//               )
//
//               ,
//             )),
//       ],
//     ),
//   )
//         ],
//     ),
//   );
// }


import 'package:flutter/material.dart';
import 'package:pharmashots/ApiRepository/shared_pref_helper.dart';
import 'package:pharmashots/Posts/postProvider.dart';
import 'package:pharmashots/Screen/home_screen.dart';
import 'package:pharmashots/Screen/login.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';

import 'alert_widget.dart';
import 'getStartedSecond.dart';

class firstScreen extends StatefulWidget {
  const firstScreen({Key? key}) : super(key: key);

  @override
  _firstScreenState createState() => _firstScreenState();
}

class _firstScreenState extends State<firstScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 1),
            (){
              getOnboard();

    }
    );
  }
  Widget build(BuildContext context) {
    return  Container(
    height: MediaQuery.of(context).size.height * 1,
    width: MediaQuery.of(context).size.width * 1,
    child: Stack(
      //mainAxisAlignment: MainAxisAlignment.end,
        children: [ Center(
    child: Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
        ),
        Padding(padding: EdgeInsets.all(12),child: Center(
          child: Image.asset('assets/images/Image1@2x.png'),
        )),
      ],
    ),
  )
        ],
    ),
  );
  }

  void getOnboard() async{
    final pref = await SharedPreferences.getInstance();
    var check_onboard=pref.getString("is_onboard");

    if(check_onboard=="yes")
      {
       getAuthStr(context);
      }
    else{
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder:
              (context) =>
              secondScreen()
          )
      );
    }

  }


  void getAuthStr(BuildContext context) async {
    String? s = "";
    s = await SharedPreferenceHelper().getAuthToken();
    print("--------");
    if (s == null || s == "") {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return SignInScreen();
      }));
    } else {

      await Provider.of<Posts>(context, listen: false).getToken().then((_) async {
        await Provider.of<Posts>(context, listen: false)
            .fetchUserDiscovered()
            .then((_) {
          print('fetched');
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return HomePage();
          }));
        });
      });

    }
  }



}

