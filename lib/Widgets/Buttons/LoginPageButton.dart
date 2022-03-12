import 'package:blood/Routes/MyRoutes.dart';
import 'package:blood/Screens/Home.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPageButton extends StatefulWidget {
  const LoginPageButton({Key? key}) : super(key: key);

  @override
  _LoginPageButtonState createState() => _LoginPageButtonState();
}

class _LoginPageButtonState extends State<LoginPageButton> {
  bool _IsChecked = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              _IsChecked
                  ? "assets/login/remember_me.png"
                  : "assets/login/checked.png",
              height: 20,
              width: 20,
            ).onTap(() {
              setState(() {
                _IsChecked = !_IsChecked;
              });
            }),
            SizedBox(
              width: 10,
            ),
            "Rmember me".text.size(12.0).bold.make(),
            Expanded(child: SizedBox()),
            "Forget Password?".text.size(12.0).bold.make().centered().onTap(() {
              context.showToast(msg: "Forget Password", bgColor: Colors.white);
            })
          ],
        ).pOnly(bottom: 20),
        InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyHome()),
              );
            },
            child: Container(
              height: 40,
              child: "Login".text.scale(1.2).white.make().centered(),
              decoration: BoxDecoration(
                color: Colors.red[900],
              ),
            ).wFull(context)),
      ],
    ).pOnly(right: 25, left: 25, top: 25, bottom: 25);
  }
}
