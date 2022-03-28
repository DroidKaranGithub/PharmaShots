import 'package:flutter/material.dart';

class UserModal {
  String? userId;
  String? firstName;
  String? lastName;
  String? email;
  String? token;
  String? about;
  String? gender;
  String? phone;
  String? dob;
  String? image;

  UserModal({
    @required this.userId,
    @required this.firstName,
    @required this.lastName,
    @required this.email,
    @required this.token,
    this.about,
    this.gender,
    this.phone,
    this.dob,
    this.image,
  });

  factory UserModal.fromJson(Map<String, dynamic> json) =>
      UserModal(
        userId: json['id'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        email: json['email'],
        token: json['token'],
        about: json['about'],
        phone: json['phone'] ,
        dob: json['dob'],
        gender: json['gender'],
        image: json['image'],
      );

  Map<String, dynamic> toJson() =>{
    'userId': userId,
    'firstName': firstName,
    'lastName': lastName,
    'email': email,
    'token': token,
    'about': about,
    'phone': phone,
    'dob': dob,
    'gender': gender,
    'image': image,
  };
}
