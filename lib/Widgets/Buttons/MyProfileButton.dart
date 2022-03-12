import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MyProfilePageButton extends StatefulWidget {
  const MyProfilePageButton({Key? key}) : super(key: key);

  @override
  _MyProfilePageButtonState createState() => _MyProfilePageButtonState();
}

class _MyProfilePageButtonState extends State<MyProfilePageButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: "Save".text.white.scale(1.1).make().centered(),
      decoration: BoxDecoration(
        color: Colors.red[900],
      ),
    ).pOnly(right: 25, left: 25).wFull(context).onTap(() {
      context.showToast(
          msg: "Saving...",
          position: VxToastPosition.bottom,
          bgColor: Color(0xfffeceded));
    });
  }
}
