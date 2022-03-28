import 'package:flutter/material.dart';
import 'package:pharmashots/Constants/Constant.dart';

import 'package:pharmashots/ApiRepository/shared_pref_helper.dart';
import 'package:pharmashots/Screen/login.dart';
import 'package:pharmashots/Users/userProvider.dart';
import 'package:provider/provider.dart';

import '../routs.dart';


class userAuthCheck  extends StatefulWidget {
static const routeName = '/authCheck';

@override
_userAuthCheckState createState() => _userAuthCheckState();
}

class _userAuthCheckState extends State<userAuthCheck> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  late OverlayEntry loader;
  bool isloading=true;

  void initState() {
    // Call your async method here
    bool login;
    // var auth=Shared.pref.getString('auth');
    if(SharedPreferenceHelper().getAuthToken()==""){
      print('fff');
      // Navigator.pushNamedAndRemoveUntil(context, MyRoutes.Login, (r) => false);
    }else{
      print('ppp');
      // Navigator.push(context,
      //     MaterialPageRoute(builder: (context) {
      //       return SignInScreen();
      //     }));
      // Navigator.pushNamedAndRemoveUntil(context, MyRoutes.HomePagerouts, (r) => false);
    }

    // if(auth!=null){
    //    print('login');
    // }else{
    //   print('not');
    // }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = AppBar().preferredSize.height;
    // Navigator.pushNamedAndRemoveUntil(context, MyRoutes.Login, (r) => false);
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
                    height: MediaQuery.of(context).size.height * 0.4,
                  ),
                  Padding(padding: EdgeInsets.all(12),child: Center(
                    child: Image.asset('assets/images/Image1@2x.png'),
                  )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  Center(
                    child: isloading?CircularProgressIndicator():Text(''),
                  )

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
