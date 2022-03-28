import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmashots/ApiRepository/shared_pref_helper.dart';
import 'package:pharmashots/Constants/ColorButton.dart';
import 'package:pharmashots/Constants/Constant.dart';
import 'package:pharmashots/Posts/postProvider.dart';
import 'package:pharmashots/Screen/home_screen.dart';
import 'package:pharmashots/Screen/login.dart';
import 'package:pharmashots/Screen/login_Screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class secondScreen extends StatefulWidget {
  const secondScreen({Key? key}) : super(key: key);

  @override
  _secondScreenState createState() => _secondScreenState();
}

class _secondScreenState extends State<secondScreen> {


  @override
  void initState() {
    super.initState();
    setOnboard();

  }
  void setOnboard() async{
    final pref = await SharedPreferences.getInstance();
    pref.setString("is_onboard","yes");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Container(
        height: MediaQuery.of(context).size.height * 1,
        width: MediaQuery.of(context).size.width * 1,
        child: Stack(
          //mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 70,
                  ),
                  Container(
                    width: 200,
                    height: 220,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: const AssetImage('assets/images/Asset4.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'Welcome To\nPharmaShots',
                      style: TextStyle(
                        fontFamily: 'Forma DJR Display',
                        fontSize: 40,
                        color: const Color(0xffff5038),
                        fontWeight: FontWeight.w700,
                        height: 1,
                      ),
                      textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 12, right: 20.0, left: 20.0),
                    child: Center(
                      child: Text(
                        'Real - time summarised news in 3 shots from Biopharma, MedTech, Digital Health & Life Science Industry.',
                        style: TextStyle(
                          fontFamily: 'Helvetica',
                          fontSize: 14,
                          color: const Color(0x9a000000),
                          height: 1.2857142857142858,
                        ),
                        textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 18, bottom: 12),
                    child: Center(
                      child: Text(
                        'Readable In 60 Seconds',
                        style: TextStyle(
                          fontFamily: 'Helvetica',
                          fontSize: 16,
                          color: const Color(0xffff5038),
                          height: 1.25,
                        ),
                        textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.all(12),
                      child: Center(
                        child: InkWell(
                          onTap: () {
                            print("Click Next");
                            getAuthStr(context);
                          },
                          child: ColorButton(
                            title: 'Next',
                            width: 178,
                            height: 50,
                            colorValue: orange,
                          ),
                        ),
                      )),
                  SizedBox(
                    height: 40,
                  ),
                  Text.rich(
                    TextSpan(
                      style: TextStyle(
                        fontFamily: 'Helvetica',
                        fontSize: 15,
                        color: const Color(0xff000000),
                        height: 1.3333333333333333,
                      ),
                      children: [
                        TextSpan(
                          text: 'By creating an account, you agree to our\n',
                        ),
                        TextSpan(
                          text: 'Terms & Condition',
                          style: TextStyle(
                            color: const Color(0xffff5038),
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        TextSpan(
                          text: ' and agree to our ',
                        ),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: TextStyle(
                            color: const Color(0xffff5038),
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                    textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            //SizedBox(height: 80,),
          ],
        ),
      ),
    );
  }
}




// Widget secondScreen(BuildContext context) {
//   return Container(
//     height: MediaQuery.of(context).size.height * 1,
//     width: MediaQuery.of(context).size.width * 1,
//     child: Stack(
//       //mainAxisAlignment: MainAxisAlignment.end,
//       children: [
//         Center(
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 70,
//               ),
//               Container(
//                 width: 200,
//                 height: 220,
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: const AssetImage('assets/images/Group.png'),
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//               ),
//               Center(
//                 child: Text(
//                   'Welcome To\nPharmaShots',
//                   style: TextStyle(
//                     fontFamily: 'Forma DJR Display',
//                     fontSize: 40,
//                     color: const Color(0xffff5038),
//                     fontWeight: FontWeight.w700,
//                     height: 1,
//                   ),
//                   textHeightBehavior:
//                       TextHeightBehavior(applyHeightToFirstAscent: false),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(top: 12, right: 20.0, left: 20.0),
//                 child: Center(
//                   child: Text(
//                     'Real - time summarised news in 3 shots from Biopharma, MedTech, Digital Health & Life Science Industry.',
//                     style: TextStyle(
//                       fontFamily: 'Helvetica',
//                       fontSize: 14,
//                       color: const Color(0x9a000000),
//                       height: 1.2857142857142858,
//                     ),
//                     textHeightBehavior:
//                         TextHeightBehavior(applyHeightToFirstAscent: false),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(top: 18, bottom: 12),
//                 child: Center(
//                   child: Text(
//                     'Readable In 60 Seconds',
//                     style: TextStyle(
//                       fontFamily: 'Helvetica',
//                       fontSize: 16,
//                       color: const Color(0xffff5038),
//                       height: 1.25,
//                     ),
//                     textHeightBehavior:
//                         TextHeightBehavior(applyHeightToFirstAscent: false),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               ),
//               Padding(
//                   padding: EdgeInsets.all(12),
//                   child: Center(
//                     child: InkWell(
//                       onTap: () {
//                         print("Click Next");
//                         getAuthStr(context);
//                       },
//                       child: ColorButton(
//                         title: 'Next',
//                         width: 178,
//                         height: 50,
//                         colorValue: orange,
//                       ),
//                     ),
//                   )),
//               SizedBox(
//                 height: 40,
//               ),
//               Text.rich(
//                 TextSpan(
//                   style: TextStyle(
//                     fontFamily: 'Helvetica',
//                     fontSize: 15,
//                     color: const Color(0xff000000),
//                     height: 1.3333333333333333,
//                   ),
//                   children: [
//                     TextSpan(
//                       text: 'By creating an account, you agree to our\n',
//                     ),
//                     TextSpan(
//                       text: 'Terms & Condition',
//                       style: TextStyle(
//                         color: const Color(0xffff5038),
//                         decoration: TextDecoration.underline,
//                       ),
//                     ),
//                     TextSpan(
//                       text: ' and agree to our ',
//                     ),
//                     TextSpan(
//                       text: 'Privacy Policy',
//                       style: TextStyle(
//                         color: const Color(0xffff5038),
//                         decoration: TextDecoration.underline,
//                       ),
//                     ),
//                   ],
//                 ),
//                 textHeightBehavior:
//                     TextHeightBehavior(applyHeightToFirstAscent: false),
//                 textAlign: TextAlign.center,
//               ),
//             ],
//           ),
//         ),
//         //SizedBox(height: 80,),
//       ],
//     ),
//   );
// }

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



