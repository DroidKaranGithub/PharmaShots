import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pharmashots/ApiRepository/shared_pref_helper.dart';
import 'package:pharmashots/Constants/Constant.dart';
import 'package:pharmashots/Constants/color_resource.dart';
import 'package:pharmashots/Constants/components.dart';
import 'package:pharmashots/Constants/fonts.dart';
import 'package:pharmashots/Posts/postModal.dart';
import 'package:pharmashots/Posts/postProvider.dart';
import 'package:pharmashots/Screen/bottom_bar_screen.dart';
import 'package:pharmashots/Widget/floatingActionWidget.dart';
import 'package:pharmashots/Widget/loadingWidget.dart';
import 'package:pharmashots/Widget/post_list_widget.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<PostModal> bookmarkpost=[];
  bool is_load=true;

  void fetchBookmark() async{
    await Provider.of<Posts>(context, listen: false)
        .fetchBookmarkPosts()
        .then((_) {
      setState(() {
        bookmarkpost = Provider
            .of<Posts>(context, listen: false)
            .bookmarkposts;
        Provider
            .of<Posts>(context, listen: false).setpostItem(bookmarkpost);
        is_load=false;

      });
    }

    );
  }


  @override
  void initState() {
    fetchBookmark();
    super.initState();

  }

   removeBookmark(String post_id) async
  {

    var url = BASE_URL + 'user/remove-from-bookmark';
    var uri = Uri.parse(url);
    var token=await SharedPreferenceHelper().getAuthToken();
    Map<String,String> userHeader = {"Content-type": "application/json", "Accept": "application/json","Authorization": "Bearer $token"};

    if(post_id !=null )
    {
      var request = http.MultipartRequest('POST', uri);

      request.headers.addAll(userHeader);
      request.fields['post_id'] = post_id.toString();

      final response = await request.send();
      if (response.statusCode == 200) {
        // If the server did return a 201 CREATED response,
        // then parse the JSON.\\
        Fluttertoast.showToast(msg: "Bookmarked Removed Successfully");
        fetchBookmark();
      } else {
        // If the server did not return a 201 CREATED response,
        // then throw an exception.
        Fluttertoast.showToast(msg: "Exception occur");
      }




    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title:Text('Saved',style:  FormaDJRDisplayBold.copyWith(
              color: ColorResources.BLACK,
              fontSize: 20
          ),
        ),
      ),
      backgroundColor: Colors.white,
        body: SafeArea(
      child: Container(
        child:is_load?displayloading(context):bookmarkpost.length>0?ListView.builder(
          scrollDirection: Axis.vertical,
          itemBuilder: (ctx, index) {
            return postlistwidget(bookmarkpost[index],read_index: index,read_mode: "inAppScreen",show_category: "yes",);

              // Slidable(
              //       endActionPane: ActionPane(
              //
              //         motion: const ScrollMotion(),
              //       //  dismissible: DismissiblePane(onDismissed: () {}),
              //         children:  [
              //           SlidableAction(
              //             onPressed: null,
              //             // onPressed:removeBookmark(bookmarkpost[index].Id.toString()),
              //            // backgroundColor: Colors.white,
              //             foregroundColor: Colors.red,
              //             icon: Icons.delete_sharp,
              //           ),
              //         ],
              //       ),
              //     child: postlistwidget(bookmarkpost[index],read_index: index,read_mode: "inAppScreen",show_category: "yes",),
              //   );

            //   postlistwidget(
            //    bookmarkpost[index]
            // );
          },
          itemCount: bookmarkpost.length,
        ):Center(child:Text("No Post"),),
        // Column(
        //   children: [
        //    for (var i = 0; i < 10; i++)
        //     Slidable(
        //         endActionPane: ActionPane(
        //           motion: const ScrollMotion(),
        //         //  dismissible: DismissiblePane(onDismissed: () {}),
        //           children: const [
        //             SlidableAction(
        //               onPressed: null,
        //              // backgroundColor: Colors.white,
        //               foregroundColor: Colors.red,
        //               icon: Icons.delete_sharp,
        //             ),
        //           ],
        //         ),
        //       child: listwidget(),
        //     )
        //   ],
        // ),
      ),
    ),
      floatingActionButton: FlotingAction(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomBar(pageName: "Bookmark",),
        );
  }
}




