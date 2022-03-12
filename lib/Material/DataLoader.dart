import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Loader {
  late final String name;
  late final String phone;
  late final String password;
  late final String city;
  late final String bloodtype;
  late final String status;
  late final String avail;
  
  var MyFireStore =FirebaseFirestore.instance.collection('Users').doc(FirebaseAuth.instance.currentUser!.uid).get();
  
  CheckData(AsyncSnapshot snapshot)
  {
    var output = snapshot.data!.data();
             if(snapshot.hasError)
             {
              name = output!['Name'];
              phone = output['Phone'];
              password = output['Password'];
              city = output['City'];
              bloodtype = output['BloodType'];
              status = output['Status'];
              avail = output['Availbility'];
             }
  }
}