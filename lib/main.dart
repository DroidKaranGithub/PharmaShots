import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pharmashots/Posts/postProvider.dart';
import 'package:pharmashots/Screen/animal_health_screen.dart';
import 'package:pharmashots/Screen/home_screen.dart';
import 'package:pharmashots/Screen/list_screen.dart';
import 'package:pharmashots/Screen/profile_page.dart';
import 'package:pharmashots/Screen/search_screen.dart';
import 'package:pharmashots/Screen/search_screen_2.dart';
import 'package:pharmashots/Users/userProvider.dart';
import 'package:pharmashots/routs.dart';
import 'package:provider/provider.dart';
import 'Screen/get_notification.dart';
import 'Screen/home.dart';
import 'Screen/image_screen.dart';
import 'Screen/interests_screen.dart';
import 'Screen/login.dart';
import 'Screen/login_Screen.dart';
import 'Widget/getStartedFirst.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Users(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => Posts(),
        ),
        // ChangeNotifierProxyProvider<Auth, Exams>(
        //   create: (ctx) => Exams([], []),
        //   update: (ctx, auth, prevoiusExams) => Exams(
        //     prevoiusExams == null ? [] : prevoiusExams.items,
        //     prevoiusExams == null ? [] : prevoiusExams.topItems,
        //   ),
        // ),
        // ChangeNotifierProxyProvider<Auth, Subjects>(
        //   create: (ctx) => Subjects([], []),
        //   update: (ctx, auth, prevoiusSubjects) => Subjects(
        //     prevoiusSubjects == null ? [] : prevoiusSubjects.items,
        //     prevoiusSubjects == null ? [] : prevoiusSubjects.topItems,
        //   ),
        // ),
        // ChangeNotifierProxyProvider<Auth, Courses>(
        //   create: (ctx) => Courses([], []),
        //   update: (ctx, auth, prevoiusCourses) => Courses(
        //     prevoiusCourses == null ? [] : prevoiusCourses.items,
        //     prevoiusCourses == null ? [] : prevoiusCourses.topItems,
        //   ),
        // ),
        // ChangeNotifierProxyProvider<Auth, MyCourses>(
        //   create: (ctx) => MyCourses([]),
        //   update: (ctx, auth, previousMyCourses) => MyCourses(
        //     previousMyCourses == null ? [] : previousMyCourses.items,
        //   ),
        // ),
        // ChangeNotifierProvider(
        //   create: (ctx) => Languages(),
        // ),
      ],
      child: Consumer<Users>(
          builder: (ctx, auth, _) => MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'PharmaShort',
                theme: ThemeData(
                    primarySwatch: Colors.blue,
                    appBarTheme: AppBarTheme(
                      color: Colors.white,
                      elevation: 0.0,
                    )),
                // home: HomeState(),
                initialRoute: "/",
                routes: {
                  "/": (context) => HomeState(),
                  MyRoutes.ImageScreenRout: (context) => ImageScreen(),
                  MyRoutes.HomePagerouts: (context) => HomePage(),
                  MyRoutes.ListPageRout: (context) => ListPage(),
                  MyRoutes.ProfilePageRout: (context) => ProfilePage(),
                  MyRoutes.SearchScreenRout: (context) => SearchScreen(),
                  MyRoutes.AnimalHealthRout: (context) => AnimalHealth(),
                  MyRoutes.NotificationPageRout: (context) =>
                      NotificationPage(),
                  MyRoutes.InterestPageRout: (context) => InterestPage(),
                  MyRoutes.SearchScreen2Rout: (context) => SearchScreen2(),
                  MyRoutes.Login: (context) => SignInScreen(),
                  MyRoutes.NotificationPageRout: (context) =>
                      NotificationPage(),
                },
              )),
    );
  }
}
