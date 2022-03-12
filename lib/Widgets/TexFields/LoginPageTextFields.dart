import 'package:blood/Material/Materials.dart';
import 'package:blood/Routes/MyRoutes.dart';
import 'package:blood/Themes/MyThemes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPageTextFields extends StatefulWidget {
  const LoginPageTextFields({Key? key}) : super(key: key);

  @override
  _LoginPageTextFieldsState createState() => _LoginPageTextFieldsState();
}

class _LoginPageTextFieldsState extends State<LoginPageTextFields> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool _Password = true;
  bool _PhoneVerify = false;
  bool _IsChecked = true;

  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _globalKey,
      child: Column(
        children: [
          TextFormField(
             keyboardType: TextInputType.phone,
            validator: (input){
              if(input!.isEmpty)
              {
                return "Enter Phone";
              }
            },
            controller: _email,
            decoration: InputDecoration(
              fillColor: Color(MyTheme.TextBackgroundColor),
              filled: true,
              hintText: "Phone",
              prefixIcon: Image.asset(
                "assets/signup/phone.png",
                height: 7,
                width: 7,
              ).pOnly(left: 10, right: 10, top: 10, bottom: 10),
              suffixIcon: GestureDetector(
                child: Icon(_PhoneVerify ? Icons.done_rounded : null,
                    color: Colors.red[900]),
              ),
            ),
          ),
          TextFormField(validator: (input){
              if(input!.isEmpty)
              {
                return "Enter Password";
              }else if(input.length < 6)
              {
                return "Password must be atleast 6 letters";
              }
            },
            obscureText: _Password,
            controller: _password,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              fillColor: Color(MyTheme.TextBackgroundColor),
              filled: true,
              hintText: "Password",
              prefixIcon: Image.asset(
                "assets/signup/password.png",
                height: 5,
                width: 5,
              ).pOnly(left: 10, right: 10, top: 10, bottom: 10),
              suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _Password = !_Password;
                    });
                  },
                  child: Icon(
                      _Password ? Icons.visibility : Icons.visibility_off,
                      color: Colors.red[900])),
            ),
          ),
          Column(
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
                  "Forget Password?"
                      .text
                      .size(12.0)
                      .bold
                      .make()
                      .centered()
                      .onTap(() {
                    Navigator.pushNamed(context, MyRoutes.RouteForget);
                  })
                ],
              ).pOnly(bottom: 20),
              InkWell(
                  onTap: () {
                    if (_globalKey.currentState!.validate()) {
                      if (_email.text.isNotEmpty && _password.text.isNotEmpty) {
                        SignIn(context, _email.text, _password.text);
                      }
                    }
                  },
                  child: Container(
                    height: 40,
                    child: "Login".text.scale(1.2).white.make().centered(),
                    decoration: BoxDecoration(
                      color: Colors.red[900],
                    ),
                  ).wFull(context)),
            ],
          ).pOnly(right: 25, left: 25, top: 25, bottom: 25)
        ],
      ),
    );
  }
}
