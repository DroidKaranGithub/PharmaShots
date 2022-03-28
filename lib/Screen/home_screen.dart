import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmashots/Posts/postProvider.dart';
import 'package:pharmashots/Screen/bottom_bar_screen.dart';
import 'package:pharmashots/Screen/post_type_article.dart';
import 'package:pharmashots/Widget/floatingActionWidget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var postData = [];
  bool isLoaded=false;
  int page_start=1;

  void initState() {
    _fetchData();
    setState(() {

    });
    super.initState();
  }
  Future<bool> _fetchData() async {
    postData = Provider.of<Posts>(context, listen: false).posts;
    if(postData.isEmpty) {
      Provider.of<Posts>(context, listen: false).fetchUserDiscovered().then((
          _) {
        setState(() {
          postData = Provider
              .of<Posts>(context, listen: false)
              .posts;
          isLoaded = true;
        });
      });
    }else{
      setState(() {
        postData = Provider
            .of<Posts>(context, listen: false)
            .posts;
        isLoaded = true;
      });
    }
    return true;
  }

  Future<Null> refreshList() async {
    try {
      await Provider.of<Posts>(context, listen: false).fetchUserDiscovered();
      setState(() {
        postData = Provider.of<Posts>(context, listen: false).posts;
      });
    } catch (error) {
      print(error);
      const errorMsg = 'Could not refresh!';

    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    // final postData = Provider.of<Posts>(context, listen: false).posts;
    final courseCount = postData.length;
    // if(courseCount==0)
    //   {
    //     refreshList();
    //   }
    PageController controller = PageController(initialPage: 0)..addListener(()=>_onPageViewChange);
    List<Widget> news=[
      for (var i = 0; i < courseCount; i++)
        PostTypeArticle(postData[i])

    ];
    return Scaffold(
      body: SafeArea(
        child:
            PageView.builder(
              scrollDirection: Axis.vertical,
              // children: news,
              onPageChanged: _onPageViewChange,
              pageSnapping: true,
              controller: controller,
              itemBuilder:(context,index){
                return PostTypeArticle(postData[index]);
              },

                itemCount: postData.length,

            )
      ),
      floatingActionButton: FlotingAction(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(pageName: "Home",),
    );
  }

  _onPageViewChange(int page) async{
    final courseCount = Provider.of<Posts>(context, listen: false).posts.length;
    var page_no=page_start+1;
    print(page.toString());
    print(courseCount);
    if((courseCount-page)==2)
      {
        await Provider.of<Posts>(context, listen: false).fetchUserDiscovered(page: page_no);
        print("new post loaded");
        setState(() {
          postData = Provider.of<Posts>(context, listen: false).posts;
          isLoaded=true;
          page_start=page_no+1;
        });


      }
  }

}
