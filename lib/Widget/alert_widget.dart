import 'package:flutter/material.dart';
import 'package:pharmashots/Constants/color_resource.dart';
import 'package:pharmashots/Constants/components.dart';
import 'package:pharmashots/Constants/fonts.dart';
import 'package:pharmashots/Screen/home.dart';
import 'package:pharmashots/Screen/home_screen.dart';

class AlertWidget extends StatefulWidget {
  const AlertWidget({Key? key}) : super(key: key);

  @override
  _AlertWidgetState createState() => _AlertWidgetState();
}

class _AlertWidgetState extends State<AlertWidget> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * .48,
        width: MediaQuery.of(context).size.width * .90,
        decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(35),
              boxShadow: [
                BoxShadow(color: Colors.black,offset: Offset(0,10),
                    blurRadius: 10
                ),
              ]
          ),
         child: Column(
           children: [
           Padding(
             padding: const EdgeInsets.only(top: 16.0),
             child: Container(
             height: 90,
             width: 90,
             decoration: BoxDecoration(
               shape: BoxShape.circle,
               color: ColorResources.OrangeLight,
             ),
             child:
             Center(
               child: Image.asset('assets/images/Group 1057@2x.png',height: 90,
                 width: 90, fit: BoxFit.contain,),
             ),
         ),
           ),
             SizedBox(
               height: 16,
             ),
             Text('Rate this app',
               style: FormaDJRDisplayBold.copyWith(
                   color: ColorResources.BLACK,
                   fontSize: 28,

               ),textAlign: TextAlign.center,),

             SizedBox(
               height: 4,
             ),
             Padding(
               padding: const EdgeInsets.all(16.0),
               child: Text('If you enjoy using this app, would you mind taking a moment to rate it? It won’t take more than a minute. Thank you for your support!',
                 style: FormaDJRDisplayBold.copyWith(
                   color: ColorResources.BLACK,
                   fontSize: 14,

                 ),textAlign: TextAlign.center,),
             ),
    SizedBox(
      height: 30,
    ),
    InkWell
    (
    onTap: (){
      launchUrl("https://play.google.com/store/apps/details?id=com.pharmashots");
    },
    child: Container(
    height: 34,
    width: 127,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(25),
    color: ColorResources.OrangeLight,
    ),
    child:Center(
      child: Text('Rate Us',
      style: HelveticaBold.copyWith(
      color: ColorResources.WHITE,
      fontSize: 14,
      ),textAlign: TextAlign.center,),
    )
    ),
    )
             ,
             Padding(padding: EdgeInsets.only(top: 12,bottom: 30),
               child:Center(
                 child: InkWell(
                     onTap: (){
                       Navigator.push(context,
                           MaterialPageRoute(builder: (context) {
                             return HomeState();
                           }));
                     },
                     child:Text(
                       'May be later',
                       style: Helveticaregular.copyWith(
                           color: ColorResources.Orange,
                           fontSize: 16
                       ),
                       textHeightBehavior:
                       TextHeightBehavior(applyHeightToFirstAscent: false),
                       textAlign: TextAlign.center,
                     )),
               ) ,),
           ],
         ),
        ),
      ],
    );
  }
}
