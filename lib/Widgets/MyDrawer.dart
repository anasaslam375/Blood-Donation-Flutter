import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:blood/Material/Materials.dart';
import 'package:blood/Routes/MyRoutes.dart';
import 'package:blood/Screens/Home.dart';
import 'package:blood/Widgets/MyAccountPage.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection('Users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .snapshots(),
        builder: (context, snapshot) {
          var output = snapshot.data!.data();
          var value;

          if (snapshot.hasData) {
            value = output!['Name'];
          }

          return Drawer(
            child: Container(
              color: Colors.black,
              child: ListView(
                children: [
                  Container(
                      color: Colors.red[900],
                      child: Column(
                        children: [
                          
                          // UserAccountsDrawerHeader(
                          //     currentAccountPicture: CircleAvatar(
                          //       child: Image.asset("assets/menu/profile.png"),
                          //     ),
                          //     accountName: "Anas Mughal".text.scale(0.98).white.make(),
                          //     accountEmail:
                          //         "Anasmughal7861@gmail.com".text.scale(0.98).white.make()),

                          Container(
                                  height: 120,
                                  color: Colors.black,
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 40,
                                        child: Image.asset(
                                            "assets/menu/profile.png"),
                                      ).pOnly(right: 10),
                                      Text(
                                        value,
                                        textScaleFactor: 1.3,
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ).p12())
                              .p0(),

                          Container(
                            height: 50,
                            child: ListTile(
                              onTap: () {
                                Navigator.popUntil(
                                    context, ModalRoute.withName('/'));
                                Navigator.pushNamed(
                                    context, MyRoutes.RouteHome);
                              },
                              leading: Image.asset(
                                "assets/menu/home.png",
                                height: 30,
                                width: 30,
                                color: Colors.white,
                              ),
                              title: "Home".text.scale(0.98).white.make(),
                            ),
                          ),
                          Divider(
                            thickness: .4,
                            color: Colors.white,
                          ),
                          Container(
                            height: 50,
                            child: ListTile(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, MyRoutes.RouteProfile);
                              },
                              leading: Image.asset(
                                "assets/menu/my_account.png",
                                height: 30,
                                width: 30,
                                color: Colors.white,
                              ),
                              title: "My Account".text.scale(0.98).white.make(),
                            ),
                          ),
                          Divider(
                            thickness: .4,
                            color: Colors.white,
                          ),
                          Container(
                            height: 50,
                            child: ListTile(
                              onTap: () {
                                context.showToast(msg: "Rate Us");
                              },
                              leading: Image.asset(
                                "assets/menu/rate_us.png",
                                height: 30,
                                width: 30,
                                color: Colors.white,
                              ),
                              title: "Rate Us".text.scale(0.98).white.make(),
                            ),
                          ),
                          Divider(
                            thickness: .4,
                            color: Colors.white,
                          ),
                          Container(
                            height: 50,
                            child: ListTile(
                              onTap: () {
                                context.showToast(msg: "Contact Us");
                              },
                              leading: Image.asset(
                                "assets/menu/contact_us.png",
                                height: 30,
                                width: 30,
                                color: Colors.white,
                              ),
                              title: "Contact Us".text.scale(0.98).white.make(),
                            ),
                          ),
                          Divider(
                            thickness: .4,
                            color: Colors.white,
                          ),
                          Container(
                            height: 50,
                            child: ListTile(
                              onTap: () {
                                context.showToast(msg: "More Apps");
                              },
                              leading: Image.asset(
                                "assets/menu/more_apps.png",
                                height: 30,
                                width: 30,
                                color: Colors.white,
                              ),
                              title: "More Apps".text.scale(0.98).white.make(),
                            ),
                          ),
                          Divider(
                            thickness: .4,
                            color: Colors.white,
                          ),
                          Container(
                            height: 50,
                            child: ListTile(
                              onTap: () {
                                Navigator.popUntil(
                                    context, ModalRoute.withName('/'));
                                SignOut(context);
                              },
                              leading: Image.asset(
                                "assets/menu/sign_out.png",
                                height: 30,
                                width: 30,
                                color: Colors.white,
                              ),
                              title: "Sign Out".text.scale(0.98).white.make(),
                            ),
                          ),
                          Divider(
                            thickness: .4,
                            color: Colors.white,
                          ),
                          Container(
                            height: 50,
                            child: ListTile(
                              onTap: () {
                                context.showToast(msg: "Facebook");
                              },
                              leading: Image.asset(
                                "assets/menu/facebook.png",
                                height: 30,
                                width: 30,
                                color: Colors.white,
                              ),
                              title: "Share on Facebok"
                                  .text
                                  .scale(0.98)
                                  .white
                                  .make(),
                            ),
                          ),
                          Divider(
                            thickness: .4,
                            color: Colors.white,
                          ),
                          Container(
                            height: 50,
                            child: ListTile(
                              onTap: () {
                                context.showToast(msg: "Twitter");
                              },
                              leading: Image.asset(
                                "assets/menu/twitter.png",
                                height: 30,
                                width: 30,
                                color: Colors.white,
                              ),
                              title: "Share on Twitter "
                                  .text
                                  .scale(0.98)
                                  .white
                                  .make(),
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            ),
          );
        });
    ;
  }
}
