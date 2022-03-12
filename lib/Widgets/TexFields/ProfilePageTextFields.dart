import 'package:blood/Themes/MyThemes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfilePageTextFields extends StatefulWidget {
  const ProfilePageTextFields({Key? key}) : super(key: key);

  @override
  _ProfilePageTextFieldsState createState() => _ProfilePageTextFieldsState();
}

class _ProfilePageTextFieldsState extends State<ProfilePageTextFields> {
 
  bool _avil = true;
  bool _name = true;
  bool _phone = true;
  bool _city = true;
  bool _blood = true;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            stream: FirebaseFirestore.instance
                .collection('Users')
                .doc(FirebaseAuth.instance.currentUser!.uid).snapshots(),
      builder: (context, snapshot) {
         var output = snapshot.data!.data();
        return Column(
          children: [
            Container(
              color: Color(MyTheme.TextBackgroundColor),
              child: Column(
                children: [
                  TextFormField(
                    initialValue: output!['Name'] ,
                    readOnly: _name,
                    decoration: InputDecoration(
                     
                      fillColor: Color(MyTheme.TextBackgroundColor),
                      filled: true,
                      suffix: Image.asset(
                        "assets/profile/edit.png",
                        height: 17,
                        width: 17,
                      ).pOnly(right: 15).onTap(() {
                        setState(() {
                          _name = !_name;
                        });
                      }),
                      hintText: "Name",
                      prefixIcon: Image.asset(
                        "assets/signup/name_profile.png",
                        height: 7,
                        width: 7,
                      ).pOnly(left: 10, right: 10, top: 10, bottom: 10),
                    ),
                  ),
                  TextFormField(
                    initialValue: output['Phone'] ,
                    readOnly: _phone,
                    decoration: InputDecoration(
                      fillColor: Color(MyTheme.TextBackgroundColor),
                      filled: true,
                      suffix: Image.asset(
                        "assets/profile/edit.png",
                        height: 17,
                        width: 17,
                      ).pOnly(right: 15).onTap(() {
                        setState(() {
                          _phone = !_phone;
                        });
                      }),
                      hintText: "Cell Number",
                      prefixIcon: Image.asset(
                        "assets/signup/phone.png",
                        height: 7,
                        width: 7,
                      ).pOnly(left: 10, right: 10, top: 10, bottom: 10),
                    ),
                  ),
                  TextDropdownFormField(
                  
                    options: [
                      "Ahmadpur East",
                      "Ahmed Nager Chatha",
                      "Ali Khan Abad",
                      "Alipur",
                      "Arifwala",
                      "Attock",
                      "Bhera",
                      "Bhalwal",
                      "Bahawalnagar",
                      "Bahawalpur",
                      "Bhakkar",
                      "Burewala",
                      "Chenab Nagar",
                      "Chillianwala",
                      "Choa Saidanshah",
                      "Chakwal",
                      "Chak Jhumra",
                      "Chichawatni",
                      "Chiniot",
                      "Chishtian",
                      "Chunian",
                      "Dajkot",
                      "Daska",
                      "Davispur",
                      "Darya Khan",
                      "Dera Ghazi Khan",
                      "Dhaular",
                      "Dina",
                      "Dinga",
                      "Dhudial Chakwal",
                      "Dipalpur",
                      "Faisalabad",
                      "Fateh Jang",
                      "Ghakhar Mandi",
                      "Gojra",
                      "Gujranwala",
                      "Gujrat",
                      "Gujar Khan",
                      "Harappa",
                      "Hafizabad",
                      "Haroonabad",
                      "Hasilpur",
                      "Haveli Lakha",
                      "Jalalpur Jattan",
                      "Jampur",
                      "Jaranwala",
                      "Jhang",
                      "Jhelum",
                      "Kallar Syedan",
                      "Kalabagh",
                      "Karor Lal Esan",
                      "Kasur",
                      "Kamalia",
                      "Kāmoke",
                      "Khanewal",
                      "Khanpur",
                      "Khanqah Sharif",
                      "Kharian",
                      "Khushab",
                      "Kot Adu",
                      "Jauharabad",
                      "Lahore",
                      "Islamabad",
                      "Lalamusa",
                      "Layyah",
                      "Lawa Chakwal",
                      "Liaquat Pur",
                      "Lodhran",
                      "Malakwal",
                      "Mamoori",
                      "Mailsi",
                      "Mandi Bahauddin",
                      "Mian Channu",
                      "Mianwali",
                      "Miani",
                      "Multan",
                      "Murree",
                      "Muridke",
                      "Mianwali Bangla",
                      "Muzaffargarh",
                      "Narowal",
                      "Nankana Sahib",
                      "Okara",
                      "Renala Khurd",
                      "Pakpattan",
                      "Pattoki",
                      "Pindi Bhattian",
                      "Pind Dadan Khan",
                      "Pir Mahal",
                      "Qaimpur",
                      "Qila Didar Singh",
                      "Raiwind",
                      "Rajanpur",
                      "Rahim Yar Khan",
                      "Rawalpindi",
                      "Sadiqabad",
                      "Sagri",
                      "Sahiwal",
                      "Sambrial",
                      "Samundri",
                      "Sangla Hill",
                      "Sarai Alamgir",
                      "Sargodha",
                      "Shakargarh",
                      "Sheikhupura",
                      "Shujaabad",
                      "Sialkot",
                      "Sohawa",
                      "Soianwala",
                      "Siranwali",
                      "Tandlianwala",
                      "Talagang",
                      "Taxila",
                      "Toba Tek Singh",
                      "Vehari",
                      "Wah Cantonment",
                      "Wazirabad",
                      "Yazman",
                      "Zafarwal",
                    ],
                    decoration: InputDecoration(
                      fillColor: Color(MyTheme.TextBackgroundColor),
                      filled: true,
                      hintText: output['City'],
                      hintStyle: TextStyle(color: Colors.black),
                      prefixIcon: Image.asset(
                        "assets/signup/area.png",
                        height: 7,
                        width: 7,
                      ).pOnly(left: 10, right: 10, top: 10, bottom: 10),
                      suffixIcon: Icon(Icons.arrow_drop_down),
                    ),
                    dropdownHeight: 120,
                  ),
                  TextDropdownFormField(
                    options: ["A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-"],
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      fillColor: Color(MyTheme.TextBackgroundColor),
                      filled: true,
                      hintText: output['BloodType'],
                      hintStyle: TextStyle(color: Colors.black),
                      prefixIcon: Image.asset(
                        "assets/signup/blood_group.png",
                        height: 10,
                        width: 10,
                      ).pOnly(left: 10, right: 10, top: 10, bottom: 10),
                      suffixIcon: Icon(Icons.arrow_drop_down),
                    ),
                    dropdownHeight: 120,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                "Available ".text.scale(1.1).make().pOnly(right: 20),
                Container(
                  child: _avil
                      ? Image.asset(
                          "assets/profile/yes.png",
                          height: 40,
                          width: 60,
                        )
                      : Image.asset(
                          "assets/profile/no.png",
                          height: 40,
                          width: 60,
                        ),
                ).onTap(() {
                  setState(() {
                    _avil = !_avil;
                  });
                }),
              ],
            ).pOnly(top: 25, bottom: 25),
            Container(
              height: 40,
              child: "Save".text.white.scale(1.1).make().centered(),
              decoration: BoxDecoration(
                color: Colors.red[900],
              ),
            ).pOnly(right: 25, left: 25).wFull(context).onTap(() {
              context.showToast(
                  msg: "Saving...",
                  position: VxToastPosition.bottom,
                  bgColor: Color(0xfffeceded));
            })
          ],
        );
      }
    );
  }
}
