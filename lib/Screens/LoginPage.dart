import 'package:blood/Routes/MyRoutes.dart';
import 'package:blood/Screens/RegisterPage.dart';
import 'package:blood/Widgets/Buttons/LoginPageButton.dart';
import 'package:blood/Widgets/TexFields/LoginPageTextFields.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfffd5d5d5),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                // color: Colors.red,
                child: Image.asset("assets/login/splash_logo.png")
                    .p24()
                    .pOnly(top: 20),
                height: 300,
                width: 300,
              ),
              Container(
                child: Column(
                  children: [
                    LoginPageTextFields().wFull(context),
                    // LoginPageButton(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        "Don't have an Account ? ".text.bold.make(),
                        "Sign Up".text.red900.scale(1.2).bold.make().onTap(() {
                         Navigator.pushNamed(context, MyRoutes.RouteRegister);
                        })
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
