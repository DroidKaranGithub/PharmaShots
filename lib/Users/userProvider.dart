import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:pharmashots/ApiRepository/shared_pref_helper.dart';
import 'package:pharmashots/Constants/Constant.dart';
import 'package:pharmashots/Constants/LoaderClass.dart';
import 'package:pharmashots/Posts/postModal.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'userModal.dart';

class Users extends ChangeNotifier{

  String? _token;
  String? _userId;
  String? firstName;
  String? lastName;
  String? email;
  String? role;
  String? facebook;
  String? twitter;
  String? linkedIn;
  String? biography;
  String? image;
  UserModal? _user;
  late OverlayEntry loader;
  List<PostModalList>? bookmerkpost;

  Users();

  String? get userId {
    if (_userId != null) {
      return _userId;
    }
    return null;
  }
  String? get token {
    if (_token != null) {
      return _token;
    }
    return null;
  }

  UserModal? get user {
    return _user;
  }
  Map<String, String> get headers => {
    "Content-Type": "application/json",
    "Accept": "application/json",
    "Authorization": "Bearer $_token",
  };

  getToken() async
  {
    var s= await SharedPreferenceHelper().getAuthToken();
    _token=s;
    return s;
  }
 
  Future<void> getLoginUser() async{
    final prefs = await SharedPreferences.getInstance();
    final extractedUserData = json
        .decode(prefs.getString('userData').toString()) as Map<String, dynamic>;
    _userId = extractedUserData['user_id'].toString();
    final loadedUser = UserModal(
        userId: extractedUserData['user_id'].toString(),
        firstName: extractedUserData['firstName'].toString(),
        lastName: extractedUserData['lastName'].toString(),
        email: extractedUserData['email'].toString(),
        token: "",
        image: extractedUserData['image'].toString(),
        about: extractedUserData['about'].toString(),
        gender: "",
        dob:"",
        phone: extractedUserData['phone'].toString()
    );
    _user = loadedUser;
    notifyListeners();

  }
  Future<void> login(String email, String password) async {
    var url = BASE_URL + 'login';
    var uri = Uri.parse(url);
    try {
      var request = http.MultipartRequest('POST', uri);
      request.fields['email'] = email;
      request.fields['password'] = password;
      final response = await request.send();
      if (response.statusCode == 200) {
        response.stream.transform(utf8.decoder).listen((value)  async{
          final responseData = json.decode(value);
          print(responseData['data']['token']);

          _token = responseData['data']['token'];
          _userId = responseData['data']['id'].toString();
          final loadedUser = UserModal(
            userId: responseData['data']['id'].toString(),
            firstName: responseData['data']['first_name'],
            lastName: responseData['data']['last_name'],
            email: responseData['data']['email'],
            token: responseData['data']['token'],
            image: responseData['data']['image'],
            about: responseData['data']['about'],
            gender: responseData['data']['gender'],
            dob:responseData['data']['dob'],
            phone: responseData['data']['phone']
          );
        //  UserModal.fromJson(responseData['data']);
          _user = loadedUser;
          // print(_user.firstName);
          notifyListeners();
          await SharedPreferenceHelper().setAuthToken(token!);
          await SharedPreferenceHelper().setUserImage(responseData['data']['image'].toString());
          final prefs = await SharedPreferences.getInstance();
          final userData = json.encode({
            'user_id': _userId,
            'firstName': responseData['data']['first_name'].toString(),
            'lastName': responseData['data']['last_name'].toString(),
            'email': responseData['data']['email'].toString(),
            'about': responseData['data']['about'].toString(),
            'phone': responseData['data']['phone'].toString(),
             'image': responseData['data']['image'].toString(),
          });
          prefs.setString('userData', userData);
          notifyListeners();
        });
      }else{
        if(response.statusCode==422) {
          Fluttertoast.showToast(msg: "Email  not found");
          throw HttpException('Email Not Exist');
        }
        else if(response.statusCode==401) {
          Fluttertoast.showToast(msg: "Invalid Password");
          throw HttpException('Invalid Password');
        }else{
          Fluttertoast.showToast(msg: "Something went wrong");
          throw HttpException('Invalid Password');
        }
      }
    } catch (error) {
      throw (error);
    }

    // return _authenticate(email, password, 'verifyPassword');
  }

  Future<void> register(String firstname,String lastname,String email, String password) async {
    var url = BASE_URL + 'registers';
    var uri = Uri.parse(url);
    try {
      var request = http.MultipartRequest('POST', uri);
      request.fields['email'] = email;
      request.fields['gender'] = '1';
      request.fields['first_name'] = firstname;
      request.fields['last_name'] = lastname;
      request.fields['password'] = password;
      request.fields['password_confirmation'] = password;
      final response = await request.send();
      print(response.statusCode);
      if (response.statusCode == 200) {
        response.stream.transform(utf8.decoder).listen((value)  async{
          final responseData = json.decode(value);
          _token = responseData['data']['token'];
          _userId = responseData['data']['id'].toString();
          final loadedUser = UserModal(
              userId: responseData['data']['id'].toString(),
              firstName: responseData['data']['first_name'],
              lastName: responseData['data']['last_name'],
              email: responseData['data']['email'],
              token: responseData['data']['token'],
              image: responseData['data']['image'],
              about: responseData['data']['about'],
              gender: responseData['data']['gender'],
              dob:responseData['data']['dob'],
              phone: responseData['data']['phone']
          );
          //  UserModal.fromJson(responseData['data']);
          _user = loadedUser;
          // print(_user.firstName);
          notifyListeners();
          await SharedPreferenceHelper().setAuthToken(token!);
          await SharedPreferenceHelper().setUserImage(responseData['data']['image'].toString());
          final prefs = await SharedPreferences.getInstance();
          final userData = json.encode({
            'user_id': _userId,
            'firstName': responseData['data']['first_name'].toString(),
            'lastName': responseData['data']['last_name'].toString(),
            'email': responseData['data']['email'].toString(),
            'about': responseData['data']['about'].toString(),
            'phone': responseData['data']['phone'].toString(),
            'image': responseData['data']['image'].toString(),
          });
          prefs.setString('userData', userData);
          notifyListeners();

          Fluttertoast.showToast(msg: "Register Successfully");
          notifyListeners();
          print(value);
        });
      }else{
        if(response.statusCode==422) {
          Fluttertoast.showToast(msg: "Email  Exist");
          throw HttpException('Email Exist');
        }
        if(response.statusCode==421) {
          Fluttertoast.showToast(msg: "Something went wrong");
          throw HttpException('something went wrong');
        }
      }
    } catch (error) {
      throw (error);
    }
  }

  void setProfileImage(String path)
  {
    image=path;
  }

  Future<void> updateProfile(String firstname,String lastname,String email, String phone,String about,String id,String personalProfilepath) async {

    var url = BASE_URL + 'user/update-profile';
    var uri = Uri.parse(url);
    try {
      var request = http.MultipartRequest('POST', uri);
      // print(headers);
      var h=getToken();
      request.headers.addAll(headers);
      request.fields['email'] = email;
      request.fields['gender'] = '1';
      request.fields['first_name'] = firstname;
      request.fields['last_name'] = lastname;
      request.fields['phone'] = phone;
      request.fields['about'] = about;
      request.fields['dob'] = '';
      request.fields['id'] = id;
      if (personalProfilepath.isNotEmpty ) {
        var image = await http.MultipartFile.fromPath(
            "image", (personalProfilepath));
        request.files.add(image);

      }
      
      final response = await request.send();
      print(response.statusCode);
      if (response.statusCode == 200) {

        response.stream.transform(utf8.decoder).listen((value)  async{
          final responseData = json.decode(value);
          print(responseData);
          Fluttertoast.showToast(msg: "Update Successfully");
          final loadedUser = UserModal(
              userId: responseData['data']['id'].toString(),
              firstName: responseData['data']['first_name'],
              lastName: responseData['data']['last_name'],
              email: responseData['data']['email'],
              token: responseData['data']['token'],
              image: responseData['data']['image'],
              about: responseData['data']['about'],
              gender: responseData['data']['gender'],
              dob:responseData['data']['dob'],
              phone: responseData['data']['phone']
          );

          _user = loadedUser;
          final prefs = await SharedPreferences.getInstance();
          final userData = json.encode({
            'user_id': _userId,
            'firstName': responseData['data']['first_name'].toString(),
            'lastName': responseData['data']['last_name'].toString(),
            'email': responseData['data']['email'].toString(),
            'about': responseData['data']['about'].toString(),
            'phone': responseData['data']['phone'].toString(),
            'image': responseData['data']['image'].toString(),
          });
          prefs.setString('userData', userData);
          // print(_user.firstName);
          notifyListeners();


          notifyListeners();
          print(value);
        });
      }else{
        if(response.statusCode==422) {
          Fluttertoast.showToast(msg: "Required Field Missing");
          throw HttpException('Email Exist');
        }
        if(response.statusCode==421) {
          Fluttertoast.showToast(msg: "Something went wrong");
          throw HttpException('something went wrong');
        }
      }

      //
      // print(responseData['validity']);
      // if (responseData['validity'] == 0) {
      //   throw HttpException('Auth Failed');
      // }
      // _token = responseData['token'];
      // _userId = responseData['user_id'];
      //
      // final loadedUser = User(
      //   userId: responseData['user_id'],
      //   firstName: responseData['first_name'],
      //   lastName: responseData['last_name'],
      //   email: responseData['email'],
      //   role: responseData['role'],
      // );

      // _user = loadedUser;
      // // print(_user.firstName);
      // notifyListeners();
      // await SharedPreferenceHelper().setAuthToken(token!);
      // final prefs = await SharedPreferences.getInstance();
      // var link = BASE_URL + '/api/userdata?auth_token=$token';
      // final res = await http.get(Uri.parse(link));
      // final resData = json.decode(res.body);
      // await SharedPreferenceHelper().setUserImage(resData['image'].toString());
      // final userData = json.encode({
      //   'user_id': _userId,
      //   'firstName': responseData['first_name'].toString(),
      //   'lastName': responseData['last_name'].toString(),
      //   'email': responseData['email'].toString(),
      //   'role': responseData['role'].toString(),
      //   'facebook': resData['facebook'].toString(),
      //   'twitter': resData['twitter'].toString(),
      //   'linkedIn': resData['linkedin'].toString(),
      //   'biography': resData['biography'].toString(),
      //   // 'image': resData['image'].toString(),
      //   // 'user': jsonEncode(_user),
      // });
      // // await SharedPreferenceHelper().setUserData(userData);
      // prefs.setString('userData', userData);
      // print(userData);
    } catch (error) {
      throw (error);
    }

    // return _authenticate(email, password, 'verifyPassword');
  }


  Future<void> forgot(String email,) async {
    var url = BASE_URL + 'forgot-password';
    var uri = Uri.parse(url);
    try {
      var request = http.MultipartRequest('POST', uri);
      request.fields['email'] = email;

      final response = await request.send();
      response.stream.transform(utf8.decoder).listen((value)  async{
        final responseData = json.decode(value);
        Fluttertoast.showToast(msg: responseData['message']);
      });

    } catch (error) {
      throw (error);
    }

    // return _authenticate(email, password, 'verifyPassword');
  }



  Future<void> logout() async {
    _token = null;
    // _user = null;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('userData');
    await SharedPreferenceHelper().setAuthToken(_token.toString());
    prefs.clear();
  }


}

