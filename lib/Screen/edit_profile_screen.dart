import 'package:adobe_xd/pinned.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pharmashots/ApiRepository/shared_pref_helper.dart';
import 'package:pharmashots/Constants/LoaderClass.dart';
import 'package:pharmashots/Constants/color_resource.dart';
import 'package:pharmashots/Constants/components.dart';
import 'package:pharmashots/Users/userModal.dart';
import 'package:pharmashots/Users/userProvider.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import '../routs.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool showPassword = false;
  late OverlayEntry loader;

  bool isPicChange=false;
  File? personalProfilefile;
  String personalProfilepath = "";
  var imagePicker = ImagePicker();
  final phonenoController = TextEditingController();
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final aboutController = TextEditingController();


  Map<String, String> _authData = {
    'phone': '',
    'about': '',
    'firstname':'',
    'lastname':'',
    'email':'',
    'id':'',
  };

  void initState() {
    // Call your async method here
    //_isAlreadyLogin();
    getUserValue();
    super.initState();
  }
  void getUserValue() async{
    UserModal? user;
    user=Provider.of<Users>(context, listen: false).user;
    print('-----------');
    print(user!.email);
    firstnameController.text=user.firstName.toString();
    lastnameController.text=user.lastName.toString();
    phonenoController.text=user.phone==null?"":user.phone.toString();
    aboutController.text=user.about==null?"":user.about.toString();
    _authData['email']=user.email.toString();
    _authData['id']=user.userId.toString();
_authData['firstname']=firstnameController.text;
  }

  Future<void> updateProfile(String fname,String lname,String phone,String about) async
  {
    try {
      // SignUp user

      await Provider.of<Users>(context, listen: false).updateProfile(fname,lname,
        _authData['email'].toString(),
        phone,
        about,
        _authData['id'].toString(),
        personalProfilepath
      );
      print("profile update");
      Navigator.pushNamed(context, MyRoutes.ProfilePageRout,);
      // CommonFunctions.showSuccessToast('Login Successful');
    } on Exception {
      var errorMsg = 'Auth failed';
      // CommonFunctions.showErrorDialog(errorMsg, context);
    } catch (error) {
      print(error);
      const errorMsg = 'Could not authenticate!';
      // CommonFunctions.showErrorDialog(errorMsg, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    loader = Loader.overlayLoader(context);
    return Consumer<Users>(
        builder: (ctx, user, _) => Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pushNamed(context, MyRoutes.ProfilePageRout);
          },
        ),
        actions: [
          // IconButton(
          //   icon: Icon(
          //     Icons.settings,
          //     color: ColorResources.Black,
          //   ),
          //   onPressed: () {},
          // ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: InkWell(
                onTap: (){ Navigator.pushNamed(context, MyRoutes.ProfilePageRout);},
                child:Image(image: AssetImage('assets/images/Path 707@2x.png',
                ),height: 13,
                  width: 13,)),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Text(
                "Edit Profile",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration:isPicChange? BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: FileImage(File(user.image.toString())),
                          )):(user.user!.image =="" || user.user!.image ==null || user.user!.image =="null")?BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image:NetworkImage("https://www.w3schools.com/w3images/avatar2.png"),
                          )):BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                fit: BoxFit.cover,
                image:NetworkImage(user.user!.image.toString()),
      )),
                    ),
                    // Text("user img"),
                    //Text(user.user!.image.toString()),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                            onTap: (){
                              getProfileImage();

                            },
                            child:Container(
                          height: 41,
                          width: 41,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorResources.WHITE,
                          ),
                          child:
                          Center(
                            child:Icon(Icons.camera_alt_outlined,size: 22,)
                            // Image.asset('assets/images/Path 68@2x.png',height: 20,
                            //   width: 20, fit: BoxFit.cover,),
                          ),
                        ))),
                  ],
                ),
              ),

              SizedBox(
                height: 35,
              ),
             // buildTextField("Full Name", "admin", false),
              Padding(
                padding: const EdgeInsets.only(bottom: 35.0),
                child:
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'First Name',
                            style: TextStyle(
                              fontFamily: 'Forma DJR Display',
                              fontSize: 16,
                              color: const Color(0xff000000),
                            ),
                            //textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      //  height: 48.0,
                      child:
                      TextFormField(
                        style: TextStyle(fontSize: 14),
                        decoration: getInputDecoration(
                          'First Name',
                          Icons.title,
                        ),
                        controller: firstnameController,
                        //  keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty || value.length < 3) {
                            return 'Required a valid name !';
                          }
                        },
                        onSaved: (value) {
                          firstnameController.text = value.toString();
                          _authData['firstname'] = value.toString();
                        },
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Last Name',
                            style: TextStyle(
                              fontFamily: 'Forma DJR Display',
                              fontSize: 16,
                              color: const Color(0xff000000),
                            ),
                            //textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      //  height: 48.0,
                      child:
                      TextFormField(
                        style: TextStyle(fontSize: 14),
                        decoration: getInputDecoration(
                          'Last Name',
                          Icons.title,
                        ),
                        controller: lastnameController,
                        //  keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty || value.length < 3) {
                            return 'Required a valid name !';
                          }
                        },
                        onSaved: (value) {
                          lastnameController.text = value.toString();
                          _authData['lastname'] = value!;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Phone',
                            style: TextStyle(
                              fontFamily: 'Forma DJR Display',
                              fontSize: 16,
                              color: const Color(0xff000000),
                            ),
                            //textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      //  height: 48.0,
                      child:TextFormField(
                        style: TextStyle(fontSize: 14),
                        decoration: getInputDecoration(
                          '',
                          Icons.title,
                        ),
                        controller: phonenoController,
                        keyboardType: TextInputType.number,

                        onSaved: (value) {
                          phonenoController.text = value.toString();
                          _authData['phone'] = value!;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'About',
                            style: TextStyle(
                              fontFamily: 'Forma DJR Display',
                              fontSize: 16,
                              color: const Color(0xff000000),
                            ),
                            //textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      //  height: 48.0,
                      child:TextFormField(
                        style: TextStyle(fontSize: 14),
                        decoration: getInputDecoration(
                          'About',
                          Icons.title,
                        ),
                        controller: aboutController,
                        keyboardType: TextInputType.multiline,
                        maxLines: 3,

                        onSaved: (value) {
                          aboutController .text = value.toString();
                          _authData['about'] = value!;
                        },
                      ),
                    ),
                  ],
                ),
              ),


              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlineButton(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {
                      Navigator.pushNamed(context, MyRoutes.ProfilePageRout);
                    },
                    child: Text("CANCEL",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.black)),
                  ),
                  RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Overlay.of(context)!.insert(loader);

                       updateProfile(firstnameController.text.toString(),lastnameController.text.toString(),phonenoController.text.toString(),aboutController.text.toString());
                        Loader.hideLoader(loader);
                      };

                    },
                    color: ColorResources.OrangeLight,
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "SAVE",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return
      Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child:
      Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'First Name',
                  style: TextStyle(
                    fontFamily: 'Forma DJR Display',
                    fontSize: 16,
                    color: const Color(0xff000000),
                  ),
                  //textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          SizedBox(
            //  height: 48.0,
            child:
            TextFormField(
              style: TextStyle(fontSize: 14),
              decoration: getInputDecoration(
                'First Name',
                Icons.title,
              ),
             controller: firstnameController,
              //  keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value!.isEmpty || value.length < 3) {
                  return 'Required a valid name !';
                }
              },
              onSaved: (value) {
                firstnameController.text = value.toString();
                _authData['firstname'] = value!;
              },
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Last Name',
                  style: TextStyle(
                    fontFamily: 'Forma DJR Display',
                    fontSize: 16,
                    color: const Color(0xff000000),
                  ),
                  //textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          SizedBox(
            //  height: 48.0,
            child:
            TextFormField(
              style: TextStyle(fontSize: 14),
              decoration: getInputDecoration(
                'Last Name',
                Icons.title,
              ),
              controller: lastnameController,
              //  keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value!.isEmpty || value.length < 3) {
                  return 'Required a valid name !';
                }
              },
              onSaved: (value) {
                lastnameController.text = value.toString();
                _authData['lastname'] = value!;
              },
            ),
          ),
          SizedBox(
            height: 8,
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Phone',
                  style: TextStyle(
                    fontFamily: 'Forma DJR Display',
                    fontSize: 16,
                    color: const Color(0xff000000),
                  ),
                  //textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          SizedBox(
            //  height: 48.0,
            child:TextFormField(
              style: TextStyle(fontSize: 14),
              decoration: getInputDecoration(
                '9909008908',
                Icons.title,
              ),
              controller: phonenoController,
              keyboardType: TextInputType.number,

              onSaved: (value) {
                phonenoController.text = value.toString();
                _authData['phone'] = value!;
              },
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'About',
                  style: TextStyle(
                    fontFamily: 'Forma DJR Display',
                    fontSize: 16,
                    color: const Color(0xff000000),
                  ),
                  //textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
          SizedBox(
            //  height: 48.0,
            child:TextFormField(
              style: TextStyle(fontSize: 14),
              decoration: getInputDecoration(
                'About',
                Icons.title,
              ),
              controller: aboutController,
              keyboardType: TextInputType.multiline,
              maxLines: 3,

              onSaved: (value) {
                aboutController .text = value.toString();
                _authData['about'] = value!;
              },
            ),
          ),
        ],
      ),
    );
  }

  Future getProfileImage() async {
    PickedFile? image = await imagePicker.getImage(source: ImageSource.gallery);

    if (image == null) {
      Fluttertoast.showToast(msg: "Profile Image Not Selected");
    } else {
      Provider.of<Users>(context, listen: false).setProfileImage(image.path.toString());
      setState(() {
        isPicChange=true;
        //shopImages.add(File(image.path));
        personalProfilefile = File(image.path);
        personalProfilepath = image.path;
        print(personalProfilepath);
        Fluttertoast.showToast(msg: "Profile Image Selected");
      });
    }
  }
}



