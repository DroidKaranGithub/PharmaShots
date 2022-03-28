import 'package:flutter/material.dart';
import 'package:pharmashots/Posts/postModal.dart';


class CategoryModal {
  String? Id;
  String? title;
  int? is_interest;
  String? image;
  List<PostModal>? postlist;


  CategoryModal({
    @required this.Id,
    @required this.title,
    @required this.image,
    @required this.is_interest,
    @required this.postlist,

  });

  factory CategoryModal.fromJson(Map<String, dynamic> json) =>
      CategoryModal(
        Id: json['id'].toString(),
        title: json['category_name'],
        image: json['image'],
        is_interest: json['is_intrested'],
        postlist:List<PostModal>.from(json['posts'].map((x) => PostModal.fromJson(x))),
      );

  Map<String, dynamic> toJson() =>{
    'Id': Id,
    'title': title,
    'image':image,
    'slug': is_interest,
    'postlist':postlist,
  };
}

class IntrestModal {
  String? id;
  String? category_name;
  String? image;
  int? is_intrest;

  IntrestModal({
    @required this.id,
    @required this.category_name,
    @required this.image,
    @required this.is_intrest,

  });

  factory IntrestModal.fromJson(Map<String, dynamic> json) =>
      IntrestModal(
        id: json['id'].toString(),
        category_name: json['category_name'],
        image: json['image'],
        is_intrest: json['is_intrested'],

      );

  Map<String, dynamic> toJson() =>{
    'id': id,
    'category_name': category_name,
    'image':image,
    'is_intrest': is_intrest,

  };
}

class PostCategoryModal{
  String? id;
  String? category_name;


  PostCategoryModal({
    @required this.id,
    @required this.category_name,


  });

  factory PostCategoryModal.fromJson(Map<String, dynamic> json) =>
      PostCategoryModal(
        id: json['id'].toString(),
        category_name: json['category_name'],


      );
  factory PostCategoryModal.toBlank() =>
      PostCategoryModal(
        id: "",
        category_name:"",


      );
  Map<String, dynamic> toJson() =>{
    'id': id,
    'category_name': category_name,


  };

}