import 'package:blood/Routes/MyRoutes.dart';
import 'package:blood/Widgets/MyDrawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MyHome extends StatelessWidget {

  static late String name;
  static late String phone;
  static late String password;
  static late String city;
  static late String bloodtype;
  static late String status;
  static late String avail;

  var _auth = FirebaseAuth.instance;
  var _color = 0xfffeceded;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfffd5d5d5),
        appBar: AppBar(
          elevation: 1,
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Color(_color),
          title: Container(
              height: 60,
              child: Image.asset(
                "assets/profile/header].png",
                fit: BoxFit.fitHeight,
              )).centered(),
          actions: [
            Image.asset(
              "assets/profile/search.png",
              height: 20,
              width: 20,
            ).pOnly(right: 20).onTap(() {
              Navigator.pushNamed(context, MyRoutes.RouteSearch);
            })
          ],
        ),
        drawer: MyDrawer(),
        body: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            stream: FirebaseFirestore.instance
                .collection('Users')
                .doc(_auth.currentUser!.uid).snapshots(),
            builder: (context, snapshot) {
              try {
                var output = snapshot.data!.data();
                if (snapshot.hasError) {
                  name = output!['Name'];
                  phone = output['Phone'];
                  password = output['Password'];
                  city = output['City'];
                  bloodtype = output['BloodType'];
                  status = output['Status'];
                  avail = output['Availbility'];
                }
              } catch (e) {
                //context.showToast(msg: "");
              }
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      child: Image.asset("assets/signup/logo.png"),
                      height: 170,
                    ).wFull(context).p20().pOnly(bottom: 30),
                    Row(
                      children: [
                        Container(
                          height: 100,
                          child: Container(
                            child: "Doner's List"
                                .text
                                .white
                                .scale(1.3)
                                .make()
                                .centered(),
                            decoration: BoxDecoration(
                                color: Colors.red[900],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(60))),
                          ).p16().onTap(() {
                            Navigator.pushNamed(context, MyRoutes.RouteDoner);
                          }),
                        ).wHalf(context),
                        Container(
                          height: 100,
                          child: Container(
                            child: "Receiver's List"
                                .text
                                .white
                                .scale(1.3)
                                .make()
                                .centered(),
                            decoration: BoxDecoration(
                                color: Colors.red[900],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(60))),
                          ).p16().onTap(() {
                            Navigator.pushNamed(
                                context, MyRoutes.RouteReceiver);
                          }),
                        ).wHalf(context),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: 100,
                          child: Container(
                            child: "Blood List"
                                .text
                                .white
                                .scale(1.3)
                                .make()
                                .centered(),
                            decoration: BoxDecoration(
                                color: Colors.red[900],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(60))),
                          ).p16().onTap(() {
                            Navigator.pushNamed(context, MyRoutes.RouteBlood);
                          }),
                        ).wHalf(context),
                        Container(
                          height: 100,
                          child: Container(
                            child: "Statemant"
                                .text
                                .white
                                .scale(1.3)
                                .make()
                                .centered(),
                            decoration: BoxDecoration(
                                color: Colors.red[900],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(60))),
                          ).p16().onTap(() {
                            Navigator.pushNamed(
                                context, MyRoutes.RouteStatement);
                          }),
                        ).wHalf(context),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 100,
                          child: Container(
                            child: "Blood Avail"
                                .text
                                .white
                                .scale(1.3)
                                .make()
                                .centered(),
                            decoration: BoxDecoration(
                                color: Colors.red[900],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(60))),
                          ).p16().onTap(() {
                            Navigator.pushNamed(context, MyRoutes.RouteAvail);
                          }),
                        ).wHalf(context),
                      ],
                    )
                  ],
                ),
              );
            }));
  }
}
