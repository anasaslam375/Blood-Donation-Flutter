
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MySplash  extends StatelessWidget {
  const MySplash({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
        body: Container(
              child: Image.asset("assets/splash.jpg",fit: BoxFit.fill,).whFull(context)
              ).whFull(context),
    
      
    );
  }
}


class Init {
  Init._();
  static final instance = Init._();

  Future initialize() async {
    await Future.delayed(const Duration(seconds: 3));
  }
}
