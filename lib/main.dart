//@dart=2.9

import 'package:blood/Material/MyImagePicker.dart';
import 'package:blood/Material/MYAuthentication.dart';
import 'package:blood/Material/SplashScreen.dart';
import 'package:blood/Material/test.dart';
import 'package:blood/Routes/MyRoutes.dart';
import 'package:blood/Screens/ForgetPassword.dart';
import 'package:blood/Screens/Home.dart';
import 'package:blood/Screens/Home_View/AllStatement.dart';
import 'package:blood/Screens/Home_View/AvailBoodList.dart';
import 'package:blood/Screens/Home_View/BloodList.dart';
import 'package:blood/Screens/Home_View/DonerList.dart';
import 'package:blood/Screens/Home_View/ReceiversList.dart';
import 'package:blood/Screens/LoginPage.dart';
import 'package:blood/Screens/MyAccount.dart';
import 'package:blood/Screens/RegisterPage.dart';
import 'package:blood/Screens/SearchPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp();
   runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    try {
      return FutureBuilder(
        future: Init.instance.initialize(),
        builder: (context, AsyncSnapshot snapshot) {
          // Show splash screen while waiting for app resources to load:
          if (snapshot.connectionState == ConnectionState.waiting) {
            return MaterialApp(
                debugShowCheckedModeBanner: false, home: MySplash());
          } else { 
            
            // Loading is done, return the app:
            return MaterialApp(
                title: "Blood Donation",
                debugShowCheckedModeBanner: false,
                //theme: ThemeData(fontFamily: 'Facit'),
                home: Myauth(),
                // initialRoute: MyRoutes.RouteAuth,
                routes: {
                  // "/": (context) => Myauth(),
                  MyRoutes.RouteAuth: (context) => Myauth(),
                  MyRoutes.RouteRegister: (context) => RegisterPage(),
                  MyRoutes.RouteHome: (context) => MyHome(),
                  MyRoutes.RouteProfile: (context) => MyAccount(),
                  MyRoutes.RouteSearch: (context) => SearchPage(),
                  MyRoutes.RouteDoner: (context) => DonerList(),
                  MyRoutes.RouteAvail: (context) => AvailBloodList(),
                  MyRoutes.RouteBlood: (context) => BloodList(),
                  MyRoutes.RouteStatement: (context) => AllStatement(),
                  MyRoutes.RouteReceiver: (context) => ReceiversList(),
                  MyRoutes.RouteLogin: (context) => LoginPage(),
                  MyRoutes.RouteForget: (context) => ForgetPassword(),
                });
          }
        },
      );
    } catch (e) {
      return Container(
        child: Text(e.toString()),
      );
    }
  }
}
