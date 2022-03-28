import 'package:flutter/material.dart';
import 'package:pharmashots/Posts/postModal.dart';
import 'package:pharmashots/Widget/post_list_widget.dart';

import 'category_tab_postlist_widget.dart';

class CategoryTabWidget extends StatefulWidget {
  final List<PostModal>? postList;
  const CategoryTabWidget({@required this.postList, Key? key}) : super(key: key);

  @override
  _CategoryTabWidgetState createState() => _CategoryTabWidgetState();
}

class _CategoryTabWidgetState extends State<CategoryTabWidget>{

  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
          margin: EdgeInsets.symmetric(vertical: 20.0),
          height: 253,
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            // children: [
            //   TopNewsCard(),
            //   TopNewsCard(),
            //   TopNewsCard(),
            // ],
            itemBuilder: (ctx, index) {
              return categoryTabpostlistwidget(widget.postList![index],read_mode: "inAppScreen",read_index: index,allpost: widget.postList,
              );
            },
            itemCount: widget.postList!.length,
          ),
        )
      ;
  }
}