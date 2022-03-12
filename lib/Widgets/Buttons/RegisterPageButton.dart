
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class RegisterPageButton extends StatefulWidget {
  const RegisterPageButton({Key? key}) : super(key: key);

  @override
  _RegisterPageButtonState createState() => _RegisterPageButtonState();
}

class _RegisterPageButtonState extends State<RegisterPageButton> {
  bool _IsCheckedDoner = true;
  bool _IsCheckedDonate = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              _IsCheckedDoner
                  ? "assets/login/remember_me.png"
                  : "assets/login/checked.png",
              height: 20,
              width: 20,
            ).onTap(() {
              setState(() {
                _IsCheckedDoner = !_IsCheckedDoner;
                _IsCheckedDonate = !_IsCheckedDoner;
              });
            }),
            SizedBox(
              width: 10,
            ),
            "Are You a Doner?".text.size(12.0).bold.make(),
            Expanded(child: SizedBox()),
            Image.asset(
              _IsCheckedDonate
                  ? "assets/login/remember_me.png"
                  : "assets/login/checked.png",
              height: 20,
              width: 20,
            ).onTap(() {
              setState(() {
                _IsCheckedDonate = !_IsCheckedDonate;
                _IsCheckedDoner = !_IsCheckedDonate;
              });
            }),
            SizedBox(
              width: 10,
            ),
            "Available to Donate?".text.size(12.0).bold.make(),
          ],
        ).pOnly(top: 25, bottom: 25),
        InkWell(
            onTap: () {
              context.showToast(msg: "Register", bgColor: Colors.white);
            },
            child: Container(
              height: 40,
              child: "Register".text.scale(1.2).white.make().centered(),
              decoration: BoxDecoration(
                color: Colors.red[900],
              ),
            ).wFull(context)),
      ],
    ).pOnly(right: 25, left: 25);
  }
}
