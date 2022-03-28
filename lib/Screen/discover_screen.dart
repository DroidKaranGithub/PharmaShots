import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pharmashots/Constants/LoaderClass.dart';
import 'package:pharmashots/Constants/color_resource.dart';
import 'package:pharmashots/Constants/components.dart';
import 'package:pharmashots/Constants/fonts.dart';
import 'package:pharmashots/Posts/postProvider.dart';
import 'package:pharmashots/Screen/animal_health_screen.dart';
import 'package:pharmashots/Screen/image_screen.dart';
import 'package:pharmashots/Screen/interests_screen.dart';
import 'package:pharmashots/Screen/search_screen.dart';
import 'package:pharmashots/Screen/search_screen_2.dart';
import 'package:pharmashots/Widget/categoy_tab_widget.dart';
import 'package:pharmashots/Widget/daily_news_card.dart';
import 'package:pharmashots/Widget/floatingActionWidget.dart';
import 'package:pharmashots/Widget/loadingWidget.dart';
import 'package:pharmashots/Widget/quick_read_card.dart';
import 'package:provider/provider.dart';

import 'bottom_bar_screen.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({Key? key}) : super(key: key);

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage>
    with TickerProviderStateMixin {
  bool is_cat_loading = true;

  late TabController _categoryTabcontroller;

  @override
  void initState() {
    fetchCat();
    super.initState();
  }

  @override
  void dispose() {
    // _categoryTabcontroller.dispose();
    super.dispose();
  }

  fetchCat() async {
    int count = Provider.of<Posts>(context, listen: false).categoriespostCount;
    print("count $count");
    if (count == 0) {
      await Provider.of<Posts>(context, listen: false)
          .fetchCategoryPosts()
          .then((_){
                print("hllo");
                setState(() {
                  is_cat_loading = false;
                });
              });
    } else {
      setState(() {
        is_cat_loading = false;
      });

    }
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<Posts>(context, listen: false).dailyNewsPosts();
    final dailyNewsData =
        Provider.of<Posts>(context, listen: false).dailynewsposts;
    final dailynewsCount = dailyNewsData.length;
    final allCategoryData =
        Provider.of<Posts>(context, listen: false).categoriesposts;
    allCategoryData.sort((a, b) => b.is_interest!.compareTo(a.is_interest!));
    print("----");

    final allcategoryCount = allCategoryData.length;


    _categoryTabcontroller =
        TabController(length: allcategoryCount, vsync: this);
    print(dailynewsCount);
    return Scaffold(
      body: SafeArea(
        child:
            is_cat_loading?displayloading(context):
            Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 8),
                  child: Text(
                    'Discover',
                    style: FormaDJRDisplayBold.copyWith(
                      color: ColorResources.BLACK,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 8),
                  child: Text(
                    'Discover your news with easy play.',
                    style: FormaDJRDisplayBold.copyWith(
                      color: ColorResources.Gray,
                      fontSize: 18,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16.0, top: 8, right: 16.0),
                  child: Card(
                    child: Container(
                      height: 56,
                      width: MediaQuery.of(context).size.width * 75,

                      //  padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 8.0,
                              ),
                              child: TextField(
                                readOnly: true,
                                onTap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              SearchScreen()));
                                },
                                decoration: InputDecoration(
                                  hintText: "Search Article",
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            SearchScreen()));
                              },
                              child: Container(
                                height: 56,
                                width: 50,
                                decoration: BoxDecoration(
                                    color: ColorResources.OrangeLight,
                                    borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(6),
                                      bottomRight: Radius.circular(6),
                                    )),
                                child: Icon(
                                  Icons.search,
                                  color: Colors.white,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 8),
                  child: Text(
                    'Quick Read',
                    style: FormaDJRDisplayBold.copyWith(
                      color: ColorResources.BLACK,
                      fontSize: 28,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                  ),
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 20.0),
                    height: 106,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        SizedBox(
                          width: 8,
                        ),
                        QuickReadCard(title: "Top 20", catId: 24,catIcon: Image.asset("assets/images/Top_20.png"),),
                        SizedBox(
                          width: 8,
                        ),
                        QuickReadCard(
                          title: "Insights+",
                          catId: 27,
                          catIcon: Image.asset("assets/images/insight_plus.png"),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        QuickReadCard(
                          title: "Events",
                          catId: 22,
                          catIcon: Image.asset("assets/images/Events.png"),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        QuickReadCard(
                          title: "View Point",
                          catId: 21,
                          catIcon: Image.asset("assets/images/Viewpoints.png"),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        QuickReadCard(
                          title: "Exclusive",
                          catId: 29,
                          catIcon: Image.asset("assets/images/Exclusive.png"),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        QuickReadCard(
                          title: "Spotlight",
                          catId: 31,
                          catIcon: Image.asset("assets/images/Spotlight.png"),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        QuickReadCard(
                          title: "Saved News",
                          catId: 100,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 8),
                  child: Text(
                    'Daily News',
                    style: FormaDJRDisplayBold.copyWith(
                      color: ColorResources.BLACK,
                      fontSize: 28,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                  ),
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 20.0),
                    height: 225,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      // children: [
                      //   TopNewsCard(),
                      //   TopNewsCard(),
                      //   TopNewsCard(),
                      // ],
                      itemBuilder: (ctx, index) {
                        return TopNewsCard(
                          posts:dailyNewsData,
                          id: int.parse(dailyNewsData[index].Id!),
                          title: dailyNewsData[index].title!,
                          image_url: dailyNewsData[index].image_url!,
                          slug: dailyNewsData[index].slug!,
                          catlist: dailyNewsData[index].catlist!,
                          is_bookmark: dailyNewsData[index].is_bookmarked,
                          read_index: index,
                        );
                      },
                      itemCount: dailynewsCount,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                  ),
                  child: Container(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          // SizedBox(height: 20.0),
                          Text(
                            'Choose your topic',
                            style: FormaDJRDisplayBold.copyWith(
                              color: ColorResources.BLACK,
                              fontSize: 28,
                            ),
                          ),
                          DefaultTabController(
                              length: allcategoryCount,

                              // length of tabs
                              initialIndex: 0,
                              child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Container(
                                      child: TabBar(
                                        controller: _categoryTabcontroller,
                                        isScrollable: true,
                                        labelColor: ColorResources.OrangeLight,
                                        unselectedLabelColor: Colors.black,
                                        tabs: [
                                          for (var i = 0;
                                              i < allcategoryCount;
                                              i++)
                                            Tab(
                                                text: allCategoryData[i]
                                                    .title!.toString()
                                                    .trim()),
                                        ],
                                      ),
                                    ),
                                  ])),
                        ]),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.48,
                  margin: EdgeInsets.only(left: 0, right: 16.0),
                  child: TabBarView(
                    controller: _categoryTabcontroller,
                    children: [
                      for (var i = 0; i < allcategoryCount; i++)
                        CategoryTabWidget(
                            postList: allCategoryData[i].postlist),
                    ],
                  ),
                ),
                //       CategoryTabWidget(),
                // Padding(
                //   padding: const EdgeInsets.only(left: 16.0, top: 8),
                //   child: Text(
                //     'Magazine',
                //     style: FormaDJRDisplayBold.copyWith(
                //       color: ColorResources.BLACK,
                //       fontSize: 28,
                //     ),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                  ),
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 20.0),
                    height: 0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Container(
                            height: 222,
                            width: 153,
                            child: Column(
                              children: [
                                Image.asset('assets/images/images@2x.png'),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  'Malaysia Favourite Health',
                                  style: FormaDJRDisplayBold.copyWith(
                                    color: ColorResources.BLACK,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Container(
                            height: 222,
                            width: 153,
                            child: Column(
                              children: [
                                Image.asset('assets/images/images@2x.png'),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  'Malaysia Favourite Health',
                                  style: FormaDJRDisplayBold.copyWith(
                                    color: ColorResources.BLACK,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Card(
                        //   shape: RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.circular(15.0),
                        //   ),
                        //   child: Container(
                        //     height: 222,
                        //     width: 153,
                        //     child: Column(
                        //       children: [
                        //         Image.asset('assets/images/images@2x.png'),
                        //         SizedBox(
                        //           height: 8,
                        //         ),
                        //         Text(
                        //           'Malaysia Favourite Health',
                        //           style: FormaDJRDisplayBold.copyWith(
                        //             color: ColorResources.BLACK,
                        //             fontSize: 12,
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        // Card(
                        //   shape: RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.circular(15.0),
                        //   ),
                        //   child: Container(
                        //     height: 222,
                        //     width: 153,
                        //     child: Column(
                        //       children: [
                        //         Image.asset('assets/images/images@2x.png'),
                        //         SizedBox(
                        //           height: 8,
                        //         ),
                        //         Text(
                        //           'Malaysia Favourite Health',
                        //           style: FormaDJRDisplayBold.copyWith(
                        //             color: ColorResources.BLACK,
                        //             fontSize: 12,
                        //           ),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FlotingAction(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(
        pageName: "Explore",
      ),
    );
  }
}
