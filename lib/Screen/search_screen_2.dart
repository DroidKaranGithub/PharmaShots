import 'package:flutter/material.dart';
import 'package:pharmashots/Constants/color_resource.dart';
import 'package:pharmashots/Constants/components.dart';
import 'package:pharmashots/Constants/fonts.dart';
import 'package:pharmashots/Screen/animal_health_screen.dart';
import 'package:pharmashots/Widget/floatingActionWidget.dart';

import 'bottom_bar_screen.dart';
import 'interests_screen.dart';

class SearchScreen2 extends StatelessWidget {
  const SearchScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.WHITE,
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image(image: AssetImage('assets/images/Path 707@2x.png',
            ),height: 13,
              width: 13,),
          )
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 12.0,left: 22,
            right: 22),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 75,
                  decoration: BoxDecoration(
                    // color: Color(0xfff5f8fd),
                      border:
                      Border.all(color: ColorResources.HINT_TEXT_COLOR),
                      borderRadius: BorderRadius.circular(25)
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.search, color: Colors.black,),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Search Article",
                              border: InputBorder.none,

                            ),
                          ),
                        ),
                      ),


                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Recent Search',style: FormaDJRDisplayBold.copyWith(
                      color: ColorResources.BLACK, fontSize: 18,
                    fontWeight: FontWeight.bold,),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Wrap(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 21,
                            width: 72,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: ColorResources.BLACK10
                            ),
                            child: Center(child: Text('Covid 19',
                              style:Helveticaregular.copyWith(
                                  color: ColorResources.BLACK,
                                  fontSize: 11
                              ),)),

                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Container(
                      height: 21,
                      width: 94,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: ColorResources.BLACK10
                      ),
                      child: Center(child: Text('Mental Health',
                        style:Helveticaregular.copyWith(
                            color: ColorResources.BLACK,
                            fontSize: 11
                        ),)),

                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Container(
                      height: 21,
                      width: 84,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: ColorResources.BLACK10
                      ),
                      child: Center(child: Text('Stress Free',
                        style:Helveticaregular.copyWith(
                            color: ColorResources.BLACK,
                            fontSize: 11
                        ),)),

                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Container(
                      height: 21,
                      width: 94,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: ColorResources.BLACK10
                      ),
                      child: Center(child: Text('Animal Health',
                        style:Helveticaregular.copyWith(
                            color: ColorResources.BLACK,
                            fontSize: 11
                        ),)),

                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Container(
                      height: 21,
                      width: 62,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: ColorResources.BLACK10
                      ),
                      child: Center(child: Text('Top 20',
                        style:Helveticaregular.copyWith(
                            color: ColorResources.BLACK,
                            fontSize: 11
                        ),)),

                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Container(
                      height: 21,
                      width: 130,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: ColorResources.BLACK10
                      ),
                      child: Center(child: Text('Omnicron Vaccination',
                        style:Helveticaregular.copyWith(
                            color: ColorResources.BLACK,
                            fontSize: 11
                        ),)),

                    ),


                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: ColorResources.GAINS_BORO,
                        ),
                      )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Following',style: FormaDJRDisplayBold.copyWith(
                      color: ColorResources.BLACK, fontSize: 18,
                    fontWeight: FontWeight.bold,),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text('Follow your favourite topics to discover More stories',
                    textAlign: TextAlign.center,
                    style: FormaDJRDisplayBold.copyWith(
                      color: ColorResources.BLACK, fontSize: 16,
                    fontWeight: FontWeight.bold,),

                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Center(
                  child: Container(
                    height: 127,
                    width: 127,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorResources.OrangeLight,
                    ),
                    child:
                    Center(
                      child: Image.asset('assets/images/Group 2510@2x.png',height: 108,
                        width: 137, fit: BoxFit.fill,),
                    ),
                  ),
                ),
                Padding(padding: EdgeInsets.all(22),
                    child: Center(
                      child:InkWell
                        (
                        onTap: (){

                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                return AnimalHealth();
                              }));
                        },
                        child: Container(
                          height: 50,
                          width: 178,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: ColorResources.OrangeLight,
                          ),
                          child: Center(child: Text('GET STARTED',
                            style: HelveticaBold.copyWith(
                                color: ColorResources.WHITE,
                                fontSize: 14
                            ),)),

                        ),
                      )

                      ,
                    )),

              ],

            ),
          ),
        ),
      ),
      floatingActionButton: FlotingAction(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(),
    );
  }
}
