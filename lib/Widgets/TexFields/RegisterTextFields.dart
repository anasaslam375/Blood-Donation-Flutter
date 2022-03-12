import 'package:blood/Material/Materials.dart';
import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class RegisterTextFields extends StatefulWidget {
  const RegisterTextFields({Key? key}) : super(key: key);

  @override
  _RegisterTextFieldsState createState() => _RegisterTextFieldsState();
}

class _RegisterTextFieldsState extends State<RegisterTextFields> {
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final DropdownEditingController<String>? _cityCon = DropdownEditingController();
  final DropdownEditingController<String>? _bloodCon = DropdownEditingController();
  String _status = "";
  bool _PhoneNo = true;
  String _phn = "";
  bool _Password = true;
  String _passwd = "";
  String _passwd2 = "";
  bool _Password2 = true;
  bool _IsCheckedDoner = true;
  bool _IsCheckedDonate = true;

List<String>  
options= [
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
];

  var _color = 0xffff1f1f1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: _name,
          decoration: InputDecoration(
            fillColor: Color(_color),
            filled: true,
            hintText: "Name",
            prefixIcon: Image.asset(
              "assets/signup/name_profile.png",
              height: 7,
              width: 7,
            ).pOnly(left: 10, right: 10, top: 10, bottom: 10),
          ),
        ),
        TextFormField(
          keyboardType: TextInputType.phone,
          controller: _phone,
          onChanged: (value) {
            setState(() {
              if (value == "03023759375") {
                _PhoneNo = false;
              } else {
                _PhoneNo = true;
              }
            });
          },
          decoration: InputDecoration(
            fillColor: Color(_color),
            filled: true,
            hintText: "Cell Number",
            suffixIcon: _phn.isNotEmpty && _phn.length >= 11
                ? Icon(_PhoneNo ? Icons.done : Icons.cancel)
                : null,
            prefixIcon: Image.asset(
              "assets/signup/phone.png",
              height: 7,
              width: 7,
            ).pOnly(left: 10, right: 10, top: 10, bottom: 10),
          ),
        ),
        TextFormField(
          onChanged: (value) {
            setState(() {
              _passwd = value;
            });
          },
          obscureText: _Password,
          decoration: InputDecoration(
            fillColor: Color(_color),
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
                child: _passwd.length >= 6
                    ? Icon(_Password ? Icons.visibility : Icons.visibility_off,
                        color: Colors.red[900])
                    : Icon(_passwd.isNotEmpty ? Icons.cancel : null)),
          ),
        ),
        TextFormField(
          onChanged: (value) {
            setState(() {
              _passwd2 = value;
              if (_passwd == value) {
                _Password2 = true;
              } else {
                _Password2 = false;
              }
            });
          },
          controller: _password,
          obscureText: _Password,
          decoration: InputDecoration(
            fillColor: Color(_color),
            filled: true,
            hintText: "Confirm Password",
            prefixIcon: Image.asset(
              "assets/signup/confirm_password.png",
              height: 6,
              width: 6,
            ).pOnly(left: 10, right: 10, top: 10, bottom: 10),
            suffixIcon: _passwd2.isNotEmpty
                ? Icon(_passwd2 == _passwd ? Icons.done : Icons.cancel)
                : null,
          ),
        ),
        // TextFormField(
        //   controller: _city,
        //   decoration: InputDecoration(
        //     fillColor: Color(_color),
        //     filled: true,
        //     hintText: "Select City",
        //     prefixIcon: Image.asset(
        //       "assets/signup/area.png",
        //       height: 7,
        //       width: 7,
        //     ).pOnly(left: 10, right: 10, top: 10, bottom: 10),
        //     suffix: GestureDetector(
        //       child: Image.asset(
        //         "assets/signup/list.png",
        //         height: 11,
        //         width: 11,
        //       ).pOnly(right: 25).onTap(() {}),
        //     ),
        //   ),
        // ),
        // TextFormField(
        //   controller: _blood,
        //   textAlignVertical: TextAlignVertical.center,
        //   decoration: InputDecoration(
        //       border: OutlineInputBorder(
        //         borderSide: BorderSide.none,
        //       ),
        //       fillColor: Color(_color),
        //       filled: true,
        //       hintText: "Blood Group",
        //       prefixIcon: Image.asset(
        //         "assets/signup/blood_group.png",
        //         height: 10,
        //         width: 10,
        //       ).pOnly(left: 10, right: 10, top: 10, bottom: 10),
        //       suffix:  SingleChildScrollView(
        //         child: PopupMenuButton<String>(
        //             icon: Icon(Icons.download),
        //             itemBuilder: (context) => options
        //                 .map((item) => PopupMenuItem<String>(
        //                       value: item,
        //                       child: Text(
        //                         item,
        //                       ),
        //                     ))
        //                 .toList(),
        //             onSelected: (value) {
        //               context.showToast(msg: value);
        //             })).pOnly(right: 25)),
        // ),

        TextDropdownFormField(
          controller: _cityCon,
         
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
            fillColor: Color(_color),
            filled: true,
            hintText: "Select City",
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
          controller: _bloodCon,
         
          options: [
            "A+", "A-", "B+", "B-", "AB+", "AB-", "O+", "O-"],
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            fillColor: Color(_color),
            filled: true,
            hintText: "Blood Group",
            prefixIcon: Image.asset(
              "assets/signup/blood_group.png",
              height: 10,
              width: 10,
            ).pOnly(left: 10, right: 10, top: 10, bottom: 10),
            suffixIcon: Icon(Icons.arrow_drop_down),
          ),
          dropdownHeight: 120,
        ),
       
       
        Column(
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

                    !_IsCheckedDoner ? _status = "Donner" : null;
                    print(_status);
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
                    !_IsCheckedDonate ? _status = "Receiver" : null;
                    print(_status);
                  });
                }),
                SizedBox(
                  width: 10,
                ),
                "Available to Donate?".text.size(12.0).bold.make(),
              ],
            ).pOnly(top: 25, bottom: 25),
            Container(
              height: 40,
              child: "Register".text.scale(1.2).white.make().centered(),
              decoration: BoxDecoration(
                color: Colors.red[900],
              ),
            ).wFull(context).onTap(
              () {
                if (_password.toString().isNotEmpty &&
                    _name.toString().isNotEmpty &&
                    _phone.toString().isNotEmpty &&
                    _cityCon.toString().isNotEmpty &&
                    _bloodCon.toString().isNotEmpty &&
                    _status.toString().isNotEmpty) {
                  SignUp(context, _name.text, _phone.text, _password.text,
                      _cityCon!.value.toString(), _bloodCon!.value.toString(), _status);
                  
                }
              },
            ),
          ],
        ).pOnly(right: 25, left: 25)
      ],
    );
  }
}
