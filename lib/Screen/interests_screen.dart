import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pharmashots/ApiRepository/shared_pref_helper.dart';
import 'package:pharmashots/Category/categoryModal.dart';
import 'package:pharmashots/Constants/LoaderClass.dart';
import 'package:pharmashots/Constants/color_resource.dart';
import 'package:pharmashots/Constants/components.dart';
import 'package:pharmashots/Constants/fonts.dart';
import 'package:pharmashots/Posts/postProvider.dart';
import 'package:pharmashots/Screen/animal_health_screen.dart';
import 'package:pharmashots/Screen/search_screen_2.dart';
import 'package:pharmashots/Widget/intrestCardWidget.dart';
import 'package:pharmashots/Widget/intrestSelectCardWidget.dart';
import 'package:provider/provider.dart';

import 'get_notification.dart';

class InterestPage extends StatefulWidget {
  const InterestPage({Key? key}) : super(key: key);

  @override
  State<InterestPage> createState() => _InterestPageState();
}

class _InterestPageState extends State<InterestPage> {
  bool is_loaded=false;
  bool is_load_intrest=true;
  List<String> recentsearch=[];
  List<IntrestModal> followings=[];
  List<IntrestModal> follows=[];
  List<IntrestModal> allintrest=[];
  late OverlayEntry loader;


  fetchAllIntrest() async{
    var s=await SharedPreferenceHelper().getAuthToken();
    print(s);
   await Provider.of<Posts>(context, listen: false).fetchIntrest().then((value) {
      setState(() {
        Provider.of<Posts>(context, listen: false).getFollowings();
        Provider.of<Posts>(context, listen: false).getFollows();
        allintrest=Provider.of<Posts>(context, listen: false).intrestlist;

        followings= Provider.of<Posts>(context, listen: false).followinglist;
        follows= Provider.of<Posts>(context, listen: false).followlist;
        is_load_intrest=false;

      });
    });
    // final dailyNewsData=Provider.of<Posts>(context, listen: false).dailynewsposts;
    // final dailynewsCount = dailyNewsData.length;

  }


  @override
  void initState() {
    getAuthStr();
    fetchAllIntrest();
    super.initState();

  }

  void getAuthStr() async{
    String? s="";
    s= await SharedPreferenceHelper().getAuthToken();
    print("--------");
    print(s);

  }

  @override
  Widget build(BuildContext context) {
    loader = Loader.overlayLoader(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * 1,
        width: MediaQuery.of(context).size.width * 1,
        child: Stack(
          children: [
            SingleChildScrollView(
              child:Padding(
        padding: const EdgeInsets.only(top: 12.0, left: 22,
            right: 22),
          child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 12,
                  ),
                  Center(
                    child: Text(
                      'Select your Interests',
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
                        'We will use this to personalise your feed to Recommended things you like',
                        style: Helveticaregular.copyWith(
                            color: ColorResources.Gray,
                            fontSize: 14
                        ),
                        textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                        textAlign: TextAlign.center,
                      ) ,
                    ) ,),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'Selected',
                      textAlign: TextAlign.left,
                      style: FormaDJRDisplayBold.copyWith(
                        color: ColorResources.BLACK,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Center(
                                child: is_load_intrest?CircularProgressIndicator():null,
                              )
                            ],
                          ),

                        ],
                      )
                  ),
                  if(followings.length>0)
                    GridView.count(
                      shrinkWrap: true,
                      primary: false,
                      padding: const EdgeInsets.all(0.0),
                      crossAxisSpacing: 10.0,
                      crossAxisCount: 3,
                      children: [

                        for (var i = 0; i < followings.length; i++)
                          intrestSelectCardWidget(followings[i],i,unfollow,"following"),
                      ],
                    ),
                  SizedBox(
                    height: 35,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: ColorResources.GAINS_BORO,
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Category (Select Any 3 Interests)',
                      style: FormaDJRDisplayBold.copyWith(
                        color: ColorResources.BLACK,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Center(
                                child: is_load_intrest?CircularProgressIndicator():null,
                              )
                            ],
                          ),

                        ],
                      )
                  ),
                  GridView.count(
                    shrinkWrap: true,
                    primary: false,
                    padding: const EdgeInsets.all(0.0),
                    crossAxisSpacing: 10.0,
                    crossAxisCount: 3,
                    children: [
                      for (var i = 0; i < follows.length; i++)
                        intrestSelectCardWidget(follows[i],i,follow,"follow"),
                    ],
                  ),

                  // Padding(
                  //   padding: const EdgeInsets.all(12.0),
                  //   child: GridView.count(
                  //     shrinkWrap: true,
                  //     primary: false,
                  //     padding: const EdgeInsets.all(0.0),
                  //     crossAxisSpacing: 10.0,
                  //     crossAxisCount: 3,
                  //     children: [
                  //       for (var i = 0; i < 9; i++)
                  //         CardView(),
                  //     ],
                  //   ),
                  // ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(padding: EdgeInsets.all(12),
                      child: Center(
                        child:InkWell
                          (
                          onTap: (){

                            saveInterest();


                          },
                          child: Container(
                            height: 50,
                            width: 178,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: ColorResources.OrangeLight,
                            ),
                            child: Center(child: Text('SAVE',
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
    return NotificationPage();
    }));
    },
                    child:Text(
                        'Skip',
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
        )))
            ,

    ]
    ),

    ),
    );
  }

  unfollow(int index)
  {
    //Provider.of<Posts>(context, listen: false).doUnFollows(index);
    setState(() {
      follows.add(followings[index]);
      //follows.removeWhere((element) => element.id==index);
      followings.removeAt(index);
      // follows=Provider.of<Posts>(context, listen: false).followlist;
      // followings=Provider.of<Posts>(context, listen: false).followinglist;

      print(followings.length);
    });
  }
  follow(int index) async
  {
    print(index);
    // followings.removeAt(index);
    if(followings.length < 3) {
      setState(() {
        followings.add(follows[index]);
        //follows.removeWhere((element) => element.id==index);
        follows.removeAt(index);
      });
    }else{
      Fluttertoast.showToast(msg: "You can follows maximum 3 interest ");
    }





  }
  saveInterest() async{
    if(followings.isNotEmpty)
      {
        if(followings.length < 4)
          {
            Overlay.of(context)!.insert(loader);
            await Provider.of<Posts>(context, listen: false).saveIntrest(followings).then((value) {
              Loader.hideLoader(loader);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                    return NotificationPage();
                  }));

            });
          }else{
          Loader.hideLoader(loader);
          Fluttertoast.showToast(msg: "You can  follows maximum 3 interest ");
        }
      }else{
      Loader.hideLoader(loader);
      Fluttertoast.showToast(msg: "You did not select any interest");
    }
  }
}
