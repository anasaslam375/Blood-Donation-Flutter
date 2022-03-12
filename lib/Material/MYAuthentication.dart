import 'dart:async';

import 'package:blood/Screens/Home.dart';
import 'package:blood/Screens/LoginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Myauth extends StatelessWidget {
  const Myauth({ Key? key }) : super(key: key);
@override



  Widget build(BuildContext context) {

    try {
   final FirebaseAuth _auth =  FirebaseAuth.instance;
    if(_auth.currentUser != null)
    {
      return MyHome();
    }else{
      return LoginPage();
    }
} catch (e) {

  return Container(
    child: Center(
      child: Text(e.toString()),
    ),
  );
}
    
  
  }
}


