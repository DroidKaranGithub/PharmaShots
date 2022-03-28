import 'package:flutter/material.dart';
import 'package:pharmashots/Constants/ColorButton.dart';
import 'package:pharmashots/Constants/LoaderClass.dart';
import 'package:pharmashots/Constants/color_resource.dart';
import 'package:pharmashots/Constants/fonts.dart';
import 'package:pharmashots/Posts/postProvider.dart';
import 'package:pharmashots/Screen/animal_health_screen.dart';
import 'package:pharmashots/Screen/home_screen.dart';
import 'package:pharmashots/Screen/profile_page.dart';
import 'package:pharmashots/Screen/search_screen_2.dart';
import 'package:provider/provider.dart';

import 'interests_screen.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  bool value1 = false;
  late OverlayEntry loader;


  onChangeMethod(bool newValue1) {
    // setState(() {
    //   value1 = newValue1;
    // });
    Overlay.of(context)!.insert(loader);
    Provider.of<Posts>(context, listen: false).saveNotifation(newValue1).then((value) {
      Loader.hideLoader(loader);
      Navigator.push(context,
          MaterialPageRoute(builder: (context) {
            return HomePage();
          }));

    });
  }

  @override
  Widget build(BuildContext context) {
    loader = Loader.overlayLoader(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: InkWell(
          onTap: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (context) {
                  return HomePage();
                }));
          },
          child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Image(image: AssetImage('assets/images/Path 707@2x.png',
          ),height: 13,
            width: 13,)),
        )
      ),
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
                 height: 40,
                  ),
                  Container(
                    height: 121,
                    width: 121,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorResources.OrangeLight,
                    ),
                    child:
                    Center(
                      child: Image.asset('assets/images/Rectangle 153.png',height: 121,
                        width: 121, fit: BoxFit.cover,),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Center(
                    child: Text(
                      'Stay up - to - date with Customise notifications',
                      style: FormaDJRDisplayBold.copyWith(
                          color: ColorResources.BLACK,
                          fontSize: 28
                      ),
                      textHeightBehavior:
                      TextHeightBehavior(applyHeightToFirstAscent: false),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  Padding(padding: EdgeInsets.all(16),
                    child:Center(
                      child:Text(
                        'Choose the topic’s you would like to Receive notification on',
                        style: Helveticaregular.copyWith(
                            color: ColorResources.Gray,
                            fontSize: 14
                        ),
                        textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                        textAlign: TextAlign.center,
                      ) ,
                    ) ,),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(padding: EdgeInsets.all(12),
                      child: Center(
                        child:InkWell
                          (
                          onTap: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                                  return HomePage();
                                }));
                          },
                          child: Container(
                            height: 50,
                            width: 231,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: ColorResources.OrangeLight,
                            ),
                            child:

                            // Row(
                            //   children: [
                            //   Text('   ALLOW NOTIFICATION',
                            //     style: HelveticaBold.copyWith(
                            //         color: ColorResources.WHITE,
                            //         fontSize: 14
                            //     ),),
                            //     Spacer(),
                            //     CustomSwitch(value1, onChangeMethod),
                            //   ],
                            // )

                            Center(child: Text('ALLOW NOTIFICATION',
                              style: HelveticaBold.copyWith(
                                  color: ColorResources.WHITE,
                                  fontSize: 14
                              ),)),

                          ),
                        )

                        ,
                      )),

                  Padding(padding: EdgeInsets.only(top: 12,bottom: 30),
                    child:Center(
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                return HomePage();
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
            //SizedBox(height: 80,),

          ],
        ),
      ),
    );
  }
}
