import 'package:blood/Routes/MyRoutes.dart';
import 'package:blood/Screens/Home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


// ignore: non_constant_identifier_names
Future<void> SignIn(BuildContext context, String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    await _auth.signInWithEmailAndPassword(email: email+"@gamil.com", password: password);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MyHome()),
    );
  } catch (e) {
    context.showToast(msg: e.toString());
    return null;
  }
}



// ignore: non_constant_identifier_names
Future<void> SignUp(BuildContext context,String name, String email, String password, String city,
    String blood, String MyStatus) async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  print("object");
  try {
    await _auth.createUserWithEmailAndPassword(
        email: email+"@gamil.com", password: password);

    // ignore: unnecessary_null_comparison
    if (_auth.currentUser != null) {
      await _fireStore.collection("Users").doc(_auth.currentUser?.uid).set({
        "Name": name,
        "Phone": email,
        "Password": password,
        "City": city,
        "BloodType": blood,
        "Status" : MyStatus,
        "Availability": "Avail"
      });
      context.showToast(msg: "Success..");
      print("Successful");
    } else {}
  } catch (e) {
    print("object");
    print(e.toString());
    return null;
  }
}

// ignore: non_constant_identifier_names
Future SignOut(BuildContext context) async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  try {
    await _auth.signOut();
    Navigator.pushNamed(context, MyRoutes.RouteLogin);
  } catch (e) {}
}


