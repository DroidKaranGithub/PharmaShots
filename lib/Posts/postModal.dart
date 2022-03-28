
import 'package:flutter/material.dart';
import 'package:pharmashots/Category/categoryModal.dart';
import 'package:pharmashots/Constants/Constant.dart';
import 'package:pharmashots/Screen/userAuthCheck.dart';

class PostModal {
  String? Id;
  String? title;
  String? slug;
  String? fulllink;
  String? post_type;
  String? image_url;
  String? vedio_url;
  String? shot_content;
  String? catId;
  String? catName;
  String? postDt;
  List<PostCategoryModal>? catlist;
  int? is_bookmarked;

  PostModal({
    @required this.Id,
    @required this.title,
    @required this.slug,
    @required this.fulllink,
    @required this.post_type,
    @required this.image_url,
    @required this.vedio_url,
    @required this.catId,
    @required this.catName,
    @required this.postDt,
    @required this.shot_content,
    @required this.catlist,
    @required this.is_bookmarked,

  });

  factory PostModal.fromJson(Map<String, dynamic> json) =>
      PostModal(
        Id: json['id'].toString(),
        title: json['title'],
        slug: json['slug'],
        fulllink: json['press_release_link'],
        postDt: json['created'],
        post_type: json['post_type'],
        image_url: json['image']['original_image'] ,
        vedio_url: "",
        catName: "",
        catId: json['category_id'],
        shot_content:json['content'],

          is_bookmarked:json['is_bookmarked'],
        catlist:List<PostCategoryModal>.from(json['categorydetail'].map((x) => PostCategoryModal.fromJson(x)))
      );




  Map<String, dynamic> toJson() =>{
    'Id': Id,
    'title': title,
    'slug': slug,
    'fulllink': fulllink,
    'postType': post_type,
    'postDt': postDt,
    'content': shot_content,
    'catId': catId,
    'image_url': image_url,
    'vedio_url': vedio_url,
    'is_bookmarked':is_bookmarked,
    'catlist':catlist,
  };
}

class PostModalList {
  String? Id;
  String? title;
  String? slug;
  String? image_url;
  String? catId;
  String? catName;
  String? postDt;
  // List<PostCategoryModal>? catlist;
  int? is_bookmarked;

  PostModalList({
    @required this.Id,
    @required this.title,
    @required this.slug,
    @required this.image_url,
    @required this.catId,
    @required this.catName,
    @required this.postDt,
    // @required this.catlist,
    @required this.is_bookmarked,

  });

  factory PostModalList.fromJson(Map<String, dynamic> json) =>
      PostModalList(
        Id: json['id'].toString(),
        title: json['title'],
        slug: json['slug'],
        postDt: json['created'],
        image_url: json['image']['original_image'] ,
        catName: "",
        catId: json['category_id'],

          is_bookmarked:json['is_bookmarked'],
         // catlist: List<PostCategoryModal>.from(json['categorydetail'].map((x) => PostCategoryModal.fromJson(x)))
      );

  Map<String, dynamic> toJson() =>{
    'Id': Id,
    'title': title,
    'postDt': postDt,
    'catId': catId,
    'image_url': image_url,
    'is_bookmarked':is_bookmarked,
   // 'catlist':catlist,
  };
}
