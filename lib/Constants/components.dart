import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pharmashots/ApiRepository/shared_pref_helper.dart';
import 'package:pharmashots/Posts/postModal.dart';
import 'package:pharmashots/Posts/postProvider.dart';
import 'package:pharmashots/Screen/PostRead.dart';
import 'package:pharmashots/Screen/webPage.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:flutter_share/flutter_share.dart';
// import 'package:html/parser.dart';
import 'package:share_plus/share_plus.dart';
// import 'package:flutter_web_browser/flutter_web_browser.dart';

import 'package:adobe_xd/pinned.dart';
import 'package:pharmashots/Screen/home_screen.dart';
import '../Constants/Constant.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'color_resource.dart';
import 'fonts.dart';

class Btn_white extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(0.0, -0.03),
      width: 178.0,
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: const Color(0xFFFF5038),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            offset: Offset(0, 8.0),
            blurRadius: 33.0,
          ),
        ],
      ),
      child: Text(
        'GET STARTED',
        style: TextStyle(
          fontFamily: 'Forma DJR Display',
          fontSize: 14.0,
          color: Colors.white,
          letterSpacing: 1.4000000000000001,
          fontWeight: FontWeight.w700,
          height: 1.5,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class googleSVG extends StatelessWidget {


@override
Widget build(BuildContext context) {
  return Stack(
    children: <Widget>[
      Pinned.fromPins(
        Pin(size: 20.9, start: 1.4),
        Pin(size: 10.9, start: 0.0),
        child: SvgPicture.string(
          _svg_ljd0,
          allowDrawingOutsideViewBox: true,
          fit: BoxFit.fill,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 20.8, start: 1.4),
        Pin(size: 10.9, end: 0.0),
        child: SvgPicture.string(
          _svg_ssjldp,
          allowDrawingOutsideViewBox: true,
          fit: BoxFit.fill,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 12.8, end: 0.0),
        Pin(size: 12.5, end: 3.4),
        child: SvgPicture.string(
          _svg_tp366z,
          allowDrawingOutsideViewBox: true,
          fit: BoxFit.fill,
        ),
      ),
      Pinned.fromPins(
        Pin(size: 5.9, start: 0.0),
        Pin(size: 12.0, middle: 0.4994),
        child: SvgPicture.string(
          _svg_e0gdnz,
          allowDrawingOutsideViewBox: true,
          fit: BoxFit.fill,
        ),
      ),
    ],
  );
}

String _svg_dttcl7 =
    '<svg viewBox="48.5 755.5 119.0 1.0" ><path transform="translate(48.5, 755.5)" d="M 0 0 L 119 0" fill="none" stroke="#000000" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
String _svg_gmt7y9 =
    '<svg viewBox="224.0 755.5 119.0 1.0" ><path transform="translate(224.0, 755.5)" d="M 0 0 L 119 0" fill="none" stroke="#000000" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
String _svg_ljd0 =
    '<svg viewBox="1.4 0.0 20.9 10.9" ><path transform="translate(0.15, 0.0)" d="M 5.744513034820557 10.92455387115479 C 6.787891864776611 7.762939929962158 9.759045600891113 5.492290019989014 13.27828788757324 5.492290019989014 C 15.17007637023926 5.492290019989014 16.87878799438477 6.163569927215576 18.22134971618652 7.262027740478516 L 22.12697601318359 3.356399536132812 C 19.74698448181152 1.281534314155579 16.69571304321289 0 13.27828788757324 0 C 7.986442089080811 0 3.430330991744995 3.018855094909668 1.239990234375 7.440045833587646 L 5.744513034820557 10.92455387115479 Z" fill="#ea4335" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
String _svg_ssjldp =
    '<svg viewBox="1.4 16.0 20.8 10.9" ><path transform="translate(0.15, 1.7)" d="M 17.79935264587402 18.45746040344238 C 16.58007049560547 19.24477386474609 15.03072738647461 19.66388511657715 13.27858734130859 19.66388511657715 C 9.772812843322754 19.66388511657715 6.810939311981201 17.41057968139648 5.756875991821289 14.26787567138672 L 1.237462639808655 17.69935989379883 C 3.425083160400391 22.12828636169434 7.981072902679443 25.15617561340332 13.27858734130859 25.15617561340332 C 16.55984306335449 25.15617561340332 19.69529151916504 23.98970222473145 22.04347991943359 21.7993049621582 L 17.79935264587402 18.45746040344238 Z" fill="#34a853" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
String _svg_tp366z =
    '<svg viewBox="13.4 11.0 12.8 12.5" ><path transform="translate(1.43, 1.17)" d="M 20.764892578125 22.32792663574219 C 23.22063064575195 20.03720474243164 24.81534385681152 16.62661552429199 24.81534385681152 12.25919914245605 C 24.81534385681152 11.46586799621582 24.69329261779785 10.61151123046875 24.51021575927734 9.818181991577148 L 12 9.818181991577148 L 12 15.00534439086914 L 19.20100212097168 15.00534439086914 C 18.84568023681641 16.74964332580566 17.89193534851074 18.1006908416748 16.52076530456543 18.98608207702637 L 20.764892578125 22.32792663574219 Z" fill="#4a90e2" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
String _svg_e0gdnz =
    '<svg viewBox="0.0 7.4 5.9 12.0" ><path transform="translate(0.0, 0.79)" d="M 5.903886318206787 15.17287540435791 C 5.636878490447998 14.37679004669189 5.492290019989014 13.52363395690918 5.492290019989014 12.63557624816895 C 5.492290019989014 11.76098537445068 5.632526874542236 10.92024517059326 5.891823768615723 10.13453197479248 L 1.387300848960876 6.650023937225342 C 0.4884536564350128 8.451746940612793 0 10.4823169708252 0 12.63557624816895 C 0 14.78316593170166 0.4976206123828888 16.80889129638672 1.384472966194153 18.6043586730957 L 5.903886318206787 15.17287540435791 Z" fill="#fbbc05" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
String _svg_j8lvd1 =
    '<svg viewBox="0.0 0.0 19.2 18.4" ><path transform="translate(-27.07, -23.97)" d="M 46.27360534667969 35.22006607055664 L 46.27360534667969 42.32160949707031 L 42.15631866455078 42.32160949707031 L 42.15631866455078 35.69600296020508 C 42.15631866455078 34.03238296508789 41.56186676025391 32.89628219604492 40.07112121582031 32.89628219604492 C 38.93347930908203 32.89628219604492 38.25765991210938 33.66115570068359 37.95920562744141 34.40176773071289 C 37.85081481933594 34.66645050048828 37.82286834716797 35.03399276733398 37.82286834716797 35.40522003173828 L 37.82286834716797 42.3213005065918 L 33.70527648925781 42.3213005065918 C 33.70527648925781 42.3213005065918 33.76054382324219 31.09971046447754 33.70527648925781 29.9381275177002 L 37.82317352294922 29.9381275177002 L 37.82317352294922 31.69293975830078 C 37.81488800048828 31.70676040649414 37.80321502685547 31.72027015686035 37.79584503173828 31.73347282409668 L 37.82317352294922 31.73347282409668 L 37.82317352294922 31.69293975830078 C 38.37034606933594 30.85099983215332 39.34616088867188 29.64734840393066 41.53392028808594 29.64734840393066 C 44.24275207519531 29.64734840393066 46.27360534667969 31.41720771789551 46.27360534667969 35.22006607055664 L 46.27360534667969 35.22006607055664 Z M 29.39792251586914 23.9689998626709 C 27.98946762084961 23.9689998626709 27.06800079345703 24.89353942871094 27.06800079345703 26.10824394226074 C 27.06800079345703 27.29715728759766 27.96275329589844 28.24841117858887 29.34388160705566 28.24841117858887 L 29.37059783935547 28.24841117858887 C 30.80668830871582 28.24841117858887 31.69959831237793 27.29715728759766 31.69959831237793 26.10824394226074 C 31.67227172851562 24.89353942871094 30.80668640136719 23.9689998626709 29.39792251586914 23.9689998626709 L 29.39792251586914 23.9689998626709 Z M 27.31272125244141 42.32160949707031 L 31.42877960205078 42.32160949707031 L 31.42877960205078 29.9381275177002 L 27.31272125244141 29.9381275177002 L 27.31272125244141 42.32160949707031 Z" fill="#f1f2f2" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';


}

class socialSVGForSingIn_SingUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(
          width: 51.8,
          child: Pinned.fromPins(
            Pin(size: 51.8, middle: 0.0),
            Pin(start: 0.0, end: 0.0),
            child: Stack(
              children: <Widget>[

                Pinned.fromPins(
                  Pin(size: 34.5, middle: 0.5034),
                  Pin(size: 34.5, middle: 0.5),
                  child:
                  // Adobe XD layer: 'linkedin-svgrepo-com' (group)
                  Stack(
                    children: <Widget>[
                      Pinned.fromPins(
                        Pin(start: 0.0, end: 0.0),
                        Pin(start: 0.0, end: 0.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.elliptical(9999.0, 9999.0)),
                            color: const Color(0xff007ab9),
                          ),
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 19.2, middle: 0.5452),
                        Pin(size: 18.4, middle: 0.4572),
                        child: Stack(
                          children: <Widget>[
                            Pinned.fromPins(
                              Pin(start: 0.0, end: 0.0),
                              Pin(start: 0.0, end: 0.0),
                              child: SvgPicture.string(
                                linkdnSvg,
                                allowDrawingOutsideViewBox: true,
                                fit: BoxFit.fill,
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
        ),
        SizedBox(
          width: 10.0,
        ),
        SizedBox(
          width: 51.8,
          child: Pinned.fromPins(
            Pin(size: -30.8, middle: 1.0),
            Pin(start: 0.0, end: 0.0),
            child: Stack(
              children: <Widget>[

                Pinned.fromPins(
                  Pin(size: 26.2, middle: 0.5),
                  Pin(size: 26.9, middle: 0.5),
                  child:
                  // Adobe XD layer: 'google-svgrepo-com' (group)
                  Stack(
                    children: <Widget>[
                      Pinned.fromPins(
                        Pin(size: 20.9, start: 1.4),
                        Pin(size: 10.9, start: 0.0),
                        child: SvgPicture.string(
                          _svg_ljd0,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 20.8, start: 1.4),
                        Pin(size: 10.9, end: 0.0),
                        child: SvgPicture.string(
                          _svg_ssjldp,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 12.8, end: 0.0),
                        Pin(size: 12.5, end: 3.4),
                        child: SvgPicture.string(
                          _svg_tp366z,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 5.9, start: 0.0),
                        Pin(size: 12.0, middle: 0.4994),
                        child: SvgPicture.string(
                          _svg_e0gdnz,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Pinned.fromPins(
          Pin(start: 47.8, end: 47.8),
          Pin(size: 21.0, middle: 0.2728),
          child: Stack(
            children: <Widget>[
              Pinned.fromPins(
                Pin(size: 18.0, middle: 0.5009),
                Pin(start: 0.0, end: 0.0),
                child: Text(
                  'Or',
                  style: TextStyle(
                    fontFamily: 'Forma DJR Display',
                    fontSize: 16,
                    color: const Color(0xffff5038),
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Pinned.fromPins(
                Pin(size: 119.0, start: 0.0),
                Pin(size: 1.0, middle: 0.625),
                child: SvgPicture.string(
                  _svg_dttcl7,
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                ),
              ),
              Pinned.fromPins(
                Pin(size: 119.0, end: 0.0),
                Pin(size: 1.0, middle: 0.625),
                child: SvgPicture.string(
                  _svg_gmt7y9,
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),

      ],
    );
  }

  String _svg_dttcl7 =
      '<svg viewBox="48.5 755.5 119.0 1.0" ><path transform="translate(48.5, 755.5)" d="M 0 0 L 119 0" fill="none" stroke="#000000" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
  String _svg_gmt7y9 =
      '<svg viewBox="224.0 755.5 119.0 1.0" ><path transform="translate(224.0, 755.5)" d="M 0 0 L 119 0" fill="none" stroke="#000000" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
  String _svg_ljd0 =
      '<svg viewBox="1.4 0.0 20.9 10.9" ><path transform="translate(0.15, 0.0)" d="M 5.744513034820557 10.92455387115479 C 6.787891864776611 7.762939929962158 9.759045600891113 5.492290019989014 13.27828788757324 5.492290019989014 C 15.17007637023926 5.492290019989014 16.87878799438477 6.163569927215576 18.22134971618652 7.262027740478516 L 22.12697601318359 3.356399536132812 C 19.74698448181152 1.281534314155579 16.69571304321289 0 13.27828788757324 0 C 7.986442089080811 0 3.430330991744995 3.018855094909668 1.239990234375 7.440045833587646 L 5.744513034820557 10.92455387115479 Z" fill="#ea4335" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
  String _svg_ssjldp =
      '<svg viewBox="1.4 16.0 20.8 10.9" ><path transform="translate(0.15, 1.7)" d="M 17.79935264587402 18.45746040344238 C 16.58007049560547 19.24477386474609 15.03072738647461 19.66388511657715 13.27858734130859 19.66388511657715 C 9.772812843322754 19.66388511657715 6.810939311981201 17.41057968139648 5.756875991821289 14.26787567138672 L 1.237462639808655 17.69935989379883 C 3.425083160400391 22.12828636169434 7.981072902679443 25.15617561340332 13.27858734130859 25.15617561340332 C 16.55984306335449 25.15617561340332 19.69529151916504 23.98970222473145 22.04347991943359 21.7993049621582 L 17.79935264587402 18.45746040344238 Z" fill="#34a853" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
  String _svg_tp366z =
      '<svg viewBox="13.4 11.0 12.8 12.5" ><path transform="translate(1.43, 1.17)" d="M 20.764892578125 22.32792663574219 C 23.22063064575195 20.03720474243164 24.81534385681152 16.62661552429199 24.81534385681152 12.25919914245605 C 24.81534385681152 11.46586799621582 24.69329261779785 10.61151123046875 24.51021575927734 9.818181991577148 L 12 9.818181991577148 L 12 15.00534439086914 L 19.20100212097168 15.00534439086914 C 18.84568023681641 16.74964332580566 17.89193534851074 18.1006908416748 16.52076530456543 18.98608207702637 L 20.764892578125 22.32792663574219 Z" fill="#4a90e2" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
  String _svg_e0gdnz =
      '<svg viewBox="0.0 7.4 5.9 12.0" ><path transform="translate(0.0, 0.79)" d="M 5.903886318206787 15.17287540435791 C 5.636878490447998 14.37679004669189 5.492290019989014 13.52363395690918 5.492290019989014 12.63557624816895 C 5.492290019989014 11.76098537445068 5.632526874542236 10.92024517059326 5.891823768615723 10.13453197479248 L 1.387300848960876 6.650023937225342 C 0.4884536564350128 8.451746940612793 0 10.4823169708252 0 12.63557624816895 C 0 14.78316593170166 0.4976206123828888 16.80889129638672 1.384472966194153 18.6043586730957 L 5.903886318206787 15.17287540435791 Z" fill="#fbbc05" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
  String _svg_j8lvd1 =
      '<svg viewBox="0.0 0.0 19.2 18.4" ><path transform="translate(-27.07, -23.97)" d="M 46.27360534667969 35.22006607055664 L 46.27360534667969 42.32160949707031 L 42.15631866455078 42.32160949707031 L 42.15631866455078 35.69600296020508 C 42.15631866455078 34.03238296508789 41.56186676025391 32.89628219604492 40.07112121582031 32.89628219604492 C 38.93347930908203 32.89628219604492 38.25765991210938 33.66115570068359 37.95920562744141 34.40176773071289 C 37.85081481933594 34.66645050048828 37.82286834716797 35.03399276733398 37.82286834716797 35.40522003173828 L 37.82286834716797 42.3213005065918 L 33.70527648925781 42.3213005065918 C 33.70527648925781 42.3213005065918 33.76054382324219 31.09971046447754 33.70527648925781 29.9381275177002 L 37.82317352294922 29.9381275177002 L 37.82317352294922 31.69293975830078 C 37.81488800048828 31.70676040649414 37.80321502685547 31.72027015686035 37.79584503173828 31.73347282409668 L 37.82317352294922 31.73347282409668 L 37.82317352294922 31.69293975830078 C 38.37034606933594 30.85099983215332 39.34616088867188 29.64734840393066 41.53392028808594 29.64734840393066 C 44.24275207519531 29.64734840393066 46.27360534667969 31.41720771789551 46.27360534667969 35.22006607055664 L 46.27360534667969 35.22006607055664 Z M 29.39792251586914 23.9689998626709 C 27.98946762084961 23.9689998626709 27.06800079345703 24.89353942871094 27.06800079345703 26.10824394226074 C 27.06800079345703 27.29715728759766 27.96275329589844 28.24841117858887 29.34388160705566 28.24841117858887 L 29.37059783935547 28.24841117858887 C 30.80668830871582 28.24841117858887 31.69959831237793 27.29715728759766 31.69959831237793 26.10824394226074 C 31.67227172851562 24.89353942871094 30.80668640136719 23.9689998626709 29.39792251586914 23.9689998626709 L 29.39792251586914 23.9689998626709 Z M 27.31272125244141 42.32160949707031 L 31.42877960205078 42.32160949707031 L 31.42877960205078 29.9381275177002 L 27.31272125244141 29.9381275177002 L 27.31272125244141 42.32160949707031 Z" fill="#f1f2f2" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';


}

InputDecoration getInputDecoration(String hintext, IconData iconData) {
  return InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
      borderSide: BorderSide(color: Color(0xFFDCD7D7), width: 0.5),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
      borderSide: BorderSide(color: Color(0xFFDCD7D7), width: 0.5),
    ),
    border: new OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFFDCD7D7), width: 0.5),
      borderRadius: const BorderRadius.all(
        const Radius.circular(5.0),
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      borderSide: BorderSide(color: Color(0xFFF65054)),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      borderSide: BorderSide(color: Color(0xFFF65054)),
    ),
    filled: false,
    hintStyle: new TextStyle(color: Colors.black54, fontSize: 14),
    hintText: hintext,
    // fillColor: Color(0xFFF7F7F7),
    contentPadding: EdgeInsets.symmetric(vertical: 17, horizontal: 15),
  );
}

InputDecoration getPassInputDecoration()
{
  return InputDecoration(
    // suffixIcon: InkWell(
    //   child:Icon(pass_showing?Icons.remove_red_eye_outlined:Icons.remove_red_eye_rounded) ,
    //   onTap: (){print('gg');
    //   passwordShowingToggle();
    //   },
    // ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
      borderSide:
      BorderSide(color: Color(0xFFDCD7D7), width: 0.5),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
      borderSide:
      BorderSide(color: Color(0xFFDCD7D7), width: 0.5),
    ),
    border: new OutlineInputBorder(
      borderSide:
      BorderSide(color: Color(0xFFDCD7D7), width: 0.5),
      borderRadius: const BorderRadius.all(
        const Radius.circular(5.0),
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      borderSide: BorderSide(color: Color(0xFFF65054)),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10.0)),
      borderSide: BorderSide(color: Color(0xFFF65054)),
    ),
    filled: false,
    hintStyle:
    new TextStyle(color: Colors.black54, fontSize: 14),
    hintText: "* * * * *",
    // fillColor: Color(0xFFF7F7F7),
    contentPadding:
    EdgeInsets.symmetric(vertical: 17, horizontal: 15),
  );
}

class socialSVGForSingIn_SingUp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: 70,
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.elliptical(9999.0, 9999.0)),
                          color: const Color(0xff007ab9),
                        ),
                      ),
                    ]),

              ),
            ],
          ),
        )

    ]


    );
  }

  String _svg_dttcl7 =
      '<svg viewBox="48.5 755.5 119.0 1.0" ><path transform="translate(48.5, 755.5)" d="M 0 0 L 119 0" fill="none" stroke="#000000" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
  String _svg_gmt7y9 =
      '<svg viewBox="224.0 755.5 119.0 1.0" ><path transform="translate(224.0, 755.5)" d="M 0 0 L 119 0" fill="none" stroke="#000000" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
  String _svg_ljd0 =
      '<svg viewBox="1.4 0.0 20.9 10.9" ><path transform="translate(0.15, 0.0)" d="M 5.744513034820557 10.92455387115479 C 6.787891864776611 7.762939929962158 9.759045600891113 5.492290019989014 13.27828788757324 5.492290019989014 C 15.17007637023926 5.492290019989014 16.87878799438477 6.163569927215576 18.22134971618652 7.262027740478516 L 22.12697601318359 3.356399536132812 C 19.74698448181152 1.281534314155579 16.69571304321289 0 13.27828788757324 0 C 7.986442089080811 0 3.430330991744995 3.018855094909668 1.239990234375 7.440045833587646 L 5.744513034820557 10.92455387115479 Z" fill="#ea4335" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
  String _svg_ssjldp =
      '<svg viewBox="1.4 16.0 20.8 10.9" ><path transform="translate(0.15, 1.7)" d="M 17.79935264587402 18.45746040344238 C 16.58007049560547 19.24477386474609 15.03072738647461 19.66388511657715 13.27858734130859 19.66388511657715 C 9.772812843322754 19.66388511657715 6.810939311981201 17.41057968139648 5.756875991821289 14.26787567138672 L 1.237462639808655 17.69935989379883 C 3.425083160400391 22.12828636169434 7.981072902679443 25.15617561340332 13.27858734130859 25.15617561340332 C 16.55984306335449 25.15617561340332 19.69529151916504 23.98970222473145 22.04347991943359 21.7993049621582 L 17.79935264587402 18.45746040344238 Z" fill="#34a853" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
  String _svg_tp366z =
      '<svg viewBox="13.4 11.0 12.8 12.5" ><path transform="translate(1.43, 1.17)" d="M 20.764892578125 22.32792663574219 C 23.22063064575195 20.03720474243164 24.81534385681152 16.62661552429199 24.81534385681152 12.25919914245605 C 24.81534385681152 11.46586799621582 24.69329261779785 10.61151123046875 24.51021575927734 9.818181991577148 L 12 9.818181991577148 L 12 15.00534439086914 L 19.20100212097168 15.00534439086914 C 18.84568023681641 16.74964332580566 17.89193534851074 18.1006908416748 16.52076530456543 18.98608207702637 L 20.764892578125 22.32792663574219 Z" fill="#4a90e2" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
  String _svg_e0gdnz =
      '<svg viewBox="0.0 7.4 5.9 12.0" ><path transform="translate(0.0, 0.79)" d="M 5.903886318206787 15.17287540435791 C 5.636878490447998 14.37679004669189 5.492290019989014 13.52363395690918 5.492290019989014 12.63557624816895 C 5.492290019989014 11.76098537445068 5.632526874542236 10.92024517059326 5.891823768615723 10.13453197479248 L 1.387300848960876 6.650023937225342 C 0.4884536564350128 8.451746940612793 0 10.4823169708252 0 12.63557624816895 C 0 14.78316593170166 0.4976206123828888 16.80889129638672 1.384472966194153 18.6043586730957 L 5.903886318206787 15.17287540435791 Z" fill="#fbbc05" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
  String _svg_j8lvd1 =
      '<svg viewBox="0.0 0.0 19.2 18.4" ><path transform="translate(-27.07, -23.97)" d="M 46.27360534667969 35.22006607055664 L 46.27360534667969 42.32160949707031 L 42.15631866455078 42.32160949707031 L 42.15631866455078 35.69600296020508 C 42.15631866455078 34.03238296508789 41.56186676025391 32.89628219604492 40.07112121582031 32.89628219604492 C 38.93347930908203 32.89628219604492 38.25765991210938 33.66115570068359 37.95920562744141 34.40176773071289 C 37.85081481933594 34.66645050048828 37.82286834716797 35.03399276733398 37.82286834716797 35.40522003173828 L 37.82286834716797 42.3213005065918 L 33.70527648925781 42.3213005065918 C 33.70527648925781 42.3213005065918 33.76054382324219 31.09971046447754 33.70527648925781 29.9381275177002 L 37.82317352294922 29.9381275177002 L 37.82317352294922 31.69293975830078 C 37.81488800048828 31.70676040649414 37.80321502685547 31.72027015686035 37.79584503173828 31.73347282409668 L 37.82317352294922 31.73347282409668 L 37.82317352294922 31.69293975830078 C 38.37034606933594 30.85099983215332 39.34616088867188 29.64734840393066 41.53392028808594 29.64734840393066 C 44.24275207519531 29.64734840393066 46.27360534667969 31.41720771789551 46.27360534667969 35.22006607055664 L 46.27360534667969 35.22006607055664 Z M 29.39792251586914 23.9689998626709 C 27.98946762084961 23.9689998626709 27.06800079345703 24.89353942871094 27.06800079345703 26.10824394226074 C 27.06800079345703 27.29715728759766 27.96275329589844 28.24841117858887 29.34388160705566 28.24841117858887 L 29.37059783935547 28.24841117858887 C 30.80668830871582 28.24841117858887 31.69959831237793 27.29715728759766 31.69959831237793 26.10824394226074 C 31.67227172851562 24.89353942871094 30.80668640136719 23.9689998626709 29.39792251586914 23.9689998626709 L 29.39792251586914 23.9689998626709 Z M 27.31272125244141 42.32160949707031 L 31.42877960205078 42.32160949707031 L 31.42877960205078 29.9381275177002 L 27.31272125244141 29.9381275177002 L 27.31272125244141 42.32160949707031 Z" fill="#f1f2f2" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';


}

Widget linkdnIcon()
{
  return Container(
    width: 30,
    height: 40,
    child: SizedBox(
      width: 51.8,
      child: Pinned.fromPins(
        Pin(size: 51.8, middle: 0.0),
        Pin(start: 0.0, end: 0.0),
        child: Stack(
          children: <Widget>[

            Pinned.fromPins(
              Pin(size: 34.5, middle: 0.5034),
              Pin(size: 34.5, middle: 0.5),
              child:
              // Adobe XD layer: 'linkedin-svgrepo-com' (group)
              Stack(
                children: <Widget>[
                  Pinned.fromPins(
                    Pin(start: 0.0, end: 0.0),
                    Pin(start: 0.0, end: 0.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.elliptical(9999.0, 9999.0)),
                        color: const Color(0xff007ab9),
                      ),
                    ),
                  ),
                  Pinned.fromPins(
                    Pin(size: 19.2, middle: 0.5452),
                    Pin(size: 18.4, middle: 0.4572),
                    child: Stack(
                      children: <Widget>[
                        Pinned.fromPins(
                          Pin(start: 0.0, end: 0.0),
                          Pin(start: 0.0, end: 0.0),
                          child: SvgPicture.string(
                            linkdnSvg,
                            allowDrawingOutsideViewBox: true,
                            fit: BoxFit.fill,
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
    ),
  );
}

class listwidget extends StatelessWidget {
  const listwidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 17,right: 17),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          height: 75,
          //  width: 318,
          width: MediaQuery.of(context).size.width * 75,
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(22),
          // ),
          child: Stack(
            children: [
              Positioned(
                  top: 0,
                  left: 0,
                  bottom: 0,
                  child: Container(
                    height: 75,
                    width: 72,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        image:
                        AssetImage('assets/images/Rectangle 9.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )),
              Positioned(
                top: 10,
                left: 80,
                child: Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width * .63,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dengue Cases On Rise : Here’s What You Can Do To Protect Yourself',
                          style: FormaDJRDisplayBold.copyWith(
                            color: ColorResources.BLACK,
                          ),
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Row(
                            children: [
                              Text('ANIMAL HEALTH',style: HelveticaBold.copyWith(
                                color: ColorResources.Orange,
                              ),),
                              Spacer(),
                              //  Icon(Icons.share),
                              SvgPicture.asset('assets/images/icons svg/Icon-feather-share.svg',
                                color: Colors.black,
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              // Icon(Icons.bookmark),
                              SvgPicture.asset('assets/images/icons svg/Icon ionic-ios-bookmark.svg',
                                height: 15,
                                width: 14,
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
      ),
    );
  }
}


class CardView extends StatelessWidget {
  const CardView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
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
                bottom: 0,
                child: Container(
                  height: 68,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(6),
                      topLeft: Radius.circular(6),
                    ),
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/Rectangle 9.png'),
                      fit: BoxFit.cover,
                    ),
                  ),

                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 8,
                        ),
                        child: Row(
                          children: [
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 8.0),
                              child: Container(
                                height: 14,
                                width: 14,
                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(30),
                                  color: ColorResources
                                      .OrangeLight,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Image.asset(
                                    'assets/images/Path 707@2x.png',
                                    fit: BoxFit.cover,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(top: 26.0),
                      //   child: Container(
                      //     height: 30,
                      //     width: 30,
                      //     decoration: BoxDecoration(
                      //       borderRadius:
                      //       BorderRadius.circular(30),
                      //       color: ColorResources
                      //           .OrangeLight,
                      //     ),
                      //     child: Padding(
                      //       padding:
                      //       const EdgeInsets.all(8.0),
                      //       child: SvgPicture.asset(
                      //         'assets/images/icons svg/reload.svg',
                      //         color: Colors.white,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                )),

            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                'Animal Health',
                textAlign: TextAlign.center,
                style: Helveticaregular.copyWith(
                  color: ColorResources.BLACK,
                  fontSize: 10,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}




String removeAllHtmlTags(String htmlText) {
  RegExp exp = RegExp(
      r"<[^>]*>",
      multiLine: true,
      caseSensitive: true
  );

  return htmlText.replaceAll(exp, '');
}


void onShare(BuildContext context,String title,String t) async {
  final box = context.findRenderObject() as RenderBox?;
  await Share.share(t,
      subject: title,
      sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size);
}
void openInAppWeb(BuildContext context,String _url,{String appTitle="Pharmashort"})
{
  Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => PostWebView(
        title: appTitle,
        selectedUrl: _url,
      )
  ));
}



void openInReadPost(BuildContext context,List<PostModal> posts,int read_index) async
{
  await Provider.of<Posts>(context, listen: false)
      .setpostItem(posts)
      .then((_) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) =>
            PostRead(
              read_index: read_index,
            )
    ));
  });
}

void openInReadPost2(BuildContext context,int read_index) async
{

    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) =>
            PostRead(
              read_index: read_index,
            )
    ));
}

void launchUrl(String _url) async {
  await canLaunch(_url) ? await launch(_url) : Fluttertoast.showToast(msg: "Something went wrong");
  // await FlutterWebBrowser.openWebPage(url: _url, customTabsOptions: const CustomTabsOptions(
  //  // colorScheme: orange,
  //   toolbarColor: Colors.deepPurple,
  //   secondaryToolbarColor: Colors.green,
  //   navigationBarColor: Colors.amber,
  //   //shareState: true,
  //   instantAppsEnabled: true,
  //   showTitle: true,
  //   urlBarHidingEnabled: true,
  // ),);
}

void addBookmark(int? post_id) async
{
  var url = BASE_URL + 'user/add-to-bookmark';
  var uri = Uri.parse(url);

//var request = http.MultipartRequest('POST', uri);
  var token=await SharedPreferenceHelper().getAuthToken();
  Map<String,String> userHeader = {"Content-type": "application/json", "Accept": "application/json","Authorization": "Bearer $token"};

  if(post_id !=null )
    {
      var request = http.MultipartRequest('POST', uri);

      request.headers.addAll(userHeader);
      request.fields['post_id'] = post_id.toString();

      final response = await request.send();
      if (response.statusCode == 200) {
        // If the server did return a 201 CREATED response,
        // then parse the JSON.\\
        Fluttertoast.showToast(msg: "Bookmarked Successfully");
      } else {
        // If the server did not return a 201 CREATED response,
        // then throw an exception.
        Fluttertoast.showToast(msg: "Exception occur");
      }




    }
}

void removeBookmark(int? post_id) async
{
  var url = BASE_URL + 'user/remove-from-bookmark';
  var uri = Uri.parse(url);
  var token=await SharedPreferenceHelper().getAuthToken();
  Map<String,String> userHeader = {"Content-type": "application/json", "Accept": "application/json","Authorization": "Bearer $token"};

  if(post_id !=null )
  {
    var request = http.MultipartRequest('POST', uri);

    request.headers.addAll(userHeader);
    request.fields['post_id'] = post_id.toString();

    final response = await request.send();
    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.\\
      Fluttertoast.showToast(msg: "Bookmarked Removed Successfully");
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      Fluttertoast.showToast(msg: "Exception occur");
    }




  }
}