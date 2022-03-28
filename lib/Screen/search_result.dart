import 'package:flutter/material.dart';
import 'package:pharmashots/Constants/color_resource.dart';
import 'package:pharmashots/Constants/fonts.dart';
import 'package:pharmashots/Posts/postModal.dart';
import 'package:pharmashots/Posts/postProvider.dart';
import 'package:pharmashots/Screen/bottom_bar_screen.dart';
import 'package:pharmashots/Widget/floatingActionWidget.dart';
import 'package:pharmashots/Widget/post_list_widget.dart';
import 'package:provider/provider.dart';


class SearchResult extends StatefulWidget {
  final List<PostModal> searchList;

  SearchResult(@required this.searchList,{Key? key}) : super(key: key);

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {



  @override
  void initState() {
    Provider
        .of<Posts>(context, listen: false).setpostItem(widget.searchList);
    super.initState();

  }
  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            }
        ),
        backgroundColor: Colors.transparent,
        title: Center(
          child: Text('Search',style:  FormaDJRDisplayBold.copyWith(
              color: ColorResources.BLACK,
              fontSize: 20
          ),),
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child:widget.searchList.length>0?ListView.builder(
            scrollDirection: Axis.vertical,
            itemBuilder: (ctx, index) {
              return   postlistwidget(widget.searchList[index],read_mode: "inAppScreen",read_index: index,);
            },
            itemCount: widget.searchList.length,
          ):Center(child: CircularProgressIndicator(),),

        ),
      ),
      floatingActionButton: FlotingAction(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(pageName: "Search Result",),
    );
  }
}




