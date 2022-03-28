
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:pharmashots/Constants/components.dart';
import 'package:pharmashots/Screen/login.dart';
import 'package:pharmashots/Users/userProvider.dart';
import 'package:provider/provider.dart';
import '../Constants/Constant.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'SignupScreen.dart';
import 'login_Screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static const routeName = '/ForgotPasswordScreen';

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  var _isLoading = false;

  final emailController = TextEditingController();

  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      // Invalid!
      return;
    }
    _formKey.currentState!.save();

    setState(() {
      _isLoading = true;
    });
    try {
      // Log user in
      await Provider.of<Users>(context, listen: false).forgot(
        _authData['email'].toString(),
      );
      print("login..");
      //Navigator.pushNamedAndRemoveUntil(context, '/home', (r) => false);
      // CommonFunctions.showSuccessToast('Login Successful');
    } on Exception {
      var errorMsg = 'Auth failed';
      // CommonFunctions.showErrorDialog(errorMsg, context);
    } catch (error) {
      print(error);
      const errorMsg = 'Could not authenticate!';
      // CommonFunctions.showErrorDialog(errorMsg, context);
    }
    setState(() {
      _isLoading = false;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          body: Form(
            key: _formKey,
            child:SingleChildScrollView(
                child: Column(
                    children: [
                      SizedBox(
                        height: 110,
                        child: Stack(
                          children: [
                            Pinned.fromPins(
                              Pin(size: 380.0, start: 33.0),
                              Pin(size: 37.0, start: 67.0),
                              child: Stack(
                                children: <Widget>[
                                  Pinned.fromPins(
                                    Pin(size: 282.0, end: 0.0),
                                    Pin(start: 0.0, end: 0.0),
                                    child: Text(
                                      'Forgot Password',
                                      style: TextStyle(
                                        fontFamily: 'Forma DJR Display',
                                        fontSize: 28,
                                        color: const Color(0xff000000),
                                        fontWeight: FontWeight.w700,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  Pinned.fromPins(
                                    Pin(size: 30.0, start: 0.0),
                                    Pin(size: 30.0, end: 1.0),
                                    child:
                                    // Adobe XD layer: 'Layer 2' (group)
                                    Stack(
                                      children: <Widget>[
                                        Pinned.fromPins(
                                          Pin(start: 0.0, end: 0.0),
                                          Pin(start: 0.0, end: 0.0),
                                          child:
                                          // Adobe XD layer: 'invisible box' (group)
                                          Stack(
                                            children: <Widget>[
                                              Pinned.fromPins(
                                                Pin(start: 0.0, end: 0.0),
                                                Pin(start: 0.0, end: 0.0),
                                                child: Container(
                                                  decoration: BoxDecoration(),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Pinned.fromPins(
                                          Pin(size: 18.5, middle: 0.4809),
                                          Pin(size: 17.2, middle: 0.4831),
                                          child:
                                          // Adobe XD layer: 'Q3 icons' (group)
                                          Stack(
                                            children: <Widget>[
                                              Pinned.fromPins(
                                                Pin(start: 0.0, end: 0.0),
                                                Pin(start: 0.0, end: 0.0),
                                                child:InkWell(
                                                  onTap: (){
                                                    Navigator.push(context,
                                                        MaterialPageRoute(builder: (context) {
                                                          return SignInScreen();
                                                        }));
                                                  },
                                                  child: SvgPicture.string(
                                                    BackArrowSvg,
                                                    allowDrawingOutsideViewBox: true,
                                                    fit: BoxFit.fill,
                                                  ),
                                                ),)
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 190,
                        child: Stack
                          (
                          children: [
                            Pinned.fromPins(
                              Pin(start: 36.0, end: 36.0),
                              Pin(size: 120.0, middle: 0.9126),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  Text(
                                    'Your Email',
                                    style: TextStyle(
                                      fontFamily: 'Forma DJR Display',
                                      fontSize: 16,
                                      color: const Color(0xff000000),
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  SizedBox(
                                    height: 12.0,
                                  ),
                                  SizedBox(
                                    //  height: 48.0,
                                    child:TextFormField(
                                      style: TextStyle(fontSize: 14),
                                      decoration: getInputDecoration(
                                        'example@gmail.com',
                                        Icons.title,
                                      ),
                                      controller: emailController,
                                      keyboardType: TextInputType.emailAddress,
                                      validator: (input) =>
                                      !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                                          .hasMatch(input!)
                                          ? "Email Id should be valid"
                                          : null,
                                      onSaved: (value) {
                                        emailController .text = value.toString();
                                        _authData['email'] = value!;
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 12.0,
                                  ),

                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 70,
                        child: Stack(
                          children: [
                            Pinned.fromPins(
                              Pin(start: 47.6, end: 47.4),
                              Pin(size: 50.0, middle: 0.038),
                              child: Stack(
                                children: <Widget>[
                                  Pinned.fromPins(
                                      Pin(start: 0.0, end: 0.0),
                                      Pin(start: 0.0, end: 0.0),
                                      child:InkWell(
                                        onTap: _submit,
                                        child:
                                        // Adobe XD layer: 'bg' (shape)
                                        SvgPicture.string(
                                          BtnBgRedSVG,
                                          allowDrawingOutsideViewBox: true,
                                          fit: BoxFit.fill,
                                        ),)
                                  ),
                                  Pinned.fromPins(
                                    Pin(size: 66.0, middle: 0.4978),
                                    Pin(size: 19.0, middle: 0.4839),
                                    child: Text(
                                      'RESET PASSWORD',
                                      style: TextStyle(
                                        fontFamily: 'Forma DJR Display',
                                        fontSize: 14,
                                        color: const Color(0xffffffff),
                                        letterSpacing: 2.1,
                                        fontWeight: FontWeight.w700,
                                        height: 2.5,
                                      ),
                                      textHeightBehavior:
                                      TextHeightBehavior(applyHeightToFirstAscent: false),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                            ),



                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        child: Stack(
                          children: [

                            Pinned.fromPins(
                              Pin(size: 240.0, middle: 0.5141),
                              Pin(size: 30.0, middle: 1.99),
                              child: Stack(
                                children: <Widget>[
                                  Pinned.fromPins(
                                    Pin(size: 60.0, end: 0.0),
                                    Pin(start: 0.0, end: 0.0),
                                    child: InkWell(
                                      onTap: (){
                                        print("singup clicked");
                                        Navigator.push(context,
                                            MaterialPageRoute(builder: (context) {
                                              return SignInScreen();
                                            }));
                                      },
                                      child:Text(
                                        'Login',
                                        style: TextStyle(
                                          fontFamily: 'Forma DJR Display',
                                          fontSize: 16,
                                          color: const Color(0xffff5038),
                                          fontWeight: FontWeight.w700,
                                        ),
                                        textAlign: TextAlign.center,
                                      ) ,
                                    ),
                                  ),
                                  Pinned.fromPins(
                                    Pin(size: 200.0, start: 0.0),
                                    Pin(start: 0.0, end: 0.0),
                                    child: Text(
                                      'Already  have an account?',
                                      style: TextStyle(
                                        fontFamily: 'Forma DJR Display',
                                        fontSize: 16,
                                        color: const Color(0xff000000),
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                      )






                      //


                      //



                    ])

            ),
          ),
        )





      ],
    );
  }


}




