import 'package:blood/Routes/MyRoutes.dart';
import 'package:blood/Widgets/Buttons/SearchPageButtom.dart';
import 'package:blood/Widgets/MyDrawer.dart';
import 'package:blood/Widgets/TexFields/SearchPageTextFields.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    var _color = 0xfffeceded;
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 50,
              child: "Search".text.scale(1.5).bold.make().centered(),
            ).wFull(context).pOnly(top: 20, bottom: 20),
            Container(child: SearchPageTextFields()).wFull(context),
            Container(
              child: SearchPageButton(),
            ),
          ],
        ),
      ),
    );
  }
}
