

import 'package:blood/Themes/MyThemes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController _phone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(MyTheme.BackgroundColor),
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Color(MyTheme.ApparrBackgroundColor),
        title: Container(
            height: 60,
            child: Image.asset(
              "assets/profile/header].png",
              fit: BoxFit.fitHeight,
            )).centered(),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Image.asset("assets/signup/logo.png"),
                height: 170,
              ).wFull(context).p20().pOnly(bottom: 30),
              Text("Forget Password",textScaleFactor: 1.3,style: TextStyle(fontWeight: FontWeight.bold),).pOnly(bottom: 10),
              TextFormField(
                keyboardType: TextInputType.phone,
                validator: (input) {
                  if (input!.isEmpty) {
                    return "Enter Phone";
                  }
                },
                controller: _phone,
                decoration: InputDecoration(
                  fillColor: Color(MyTheme.TextBackgroundColor),
                  filled: true,
                  hintText: "Phone",
                  prefixIcon: Image.asset(
                    "assets/signup/phone.png",
                    height: 7,
                    width: 7,
                  ).pOnly(left: 10, right: 10, top: 10, bottom: 10),
                ),
              ),
              Container(
                height: 40,
                child: "Login".text.scale(1.2).white.make().centered(),
                decoration: BoxDecoration(
                  color: Colors.red[900],
                ),
              )
                  .wFull(context)
                  .pOnly(right: 25, left: 25, top: 25, bottom: 25)
                  .onTap(() {
                context.showToast(msg: _phone.text,textColor: Color(MyTheme.TextBackgroundColor),);
              }),
              Container(
                height: 200,
                color: Color(MyTheme.BackgroundColor),
              ).wFull(context)
            ],
          ),
        ),
      ),
    );
  }
}
