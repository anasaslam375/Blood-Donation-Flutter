
import 'package:blood/Routes/MyRoutes.dart';
import 'package:blood/Screens/LoginPage.dart';
import 'package:blood/Widgets/Buttons/RegisterPageButton.dart';
import 'package:blood/Widgets/TexFields/RegisterTextFields.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffd5d5d5),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                    height: 120,
                    //  color: Colors.red[900],
                    child: Image.asset("assets/login/splash_logo.png"))
                .p24()
                .wFull(context),
            RegisterTextFields(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                "Already have an Account ? ".text.bold.make(),
                "Sign In".text.red900.bold.make().onTap(() {
                  Navigator.pushNamed(context, MyRoutes.RouteLogin);
                })
              ],
            ).pOnly(top: 20, bottom: 20)
          ],
        ),
      ),
    );
  }
}
