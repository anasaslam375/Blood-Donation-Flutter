
import 'dart:io';

import 'package:blood/Widgets/Buttons/MyProfileButton.dart';
import 'package:blood/Widgets/TexFields/ProfilePageTextFields.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velocity_x/velocity_x.dart';

class MyAccountPage extends StatefulWidget {
  const MyAccountPage({Key? key}) : super(key: key);

  @override
  _MyAccountPageState createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {

 XFile? _imageFileList;

  set _imageFile(XFile? value) {
    _imageFileList = value == null ? null : value;
  }
  
  final ImagePicker _picker = ImagePicker();

  void _onImageButtonPressed(ImageSource source,) async {
    try {
      final pickedFile = await _picker.pickImage(source: source);
      setState(() {
        _imageFile = pickedFile;
      });
    } catch (e) {}
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _onImageButtonPressed(ImageSource.camera);
                      Navigator.of(context).pop();
                    },
                  ),
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _onImageButtonPressed(ImageSource.gallery);
                        Navigator.of(context).pop();
                      }),
                ],
              ),
            ),
          );
        });
  }

  Widget? _previewImages() {
    if (_imageFileList != null) {
      return Semantics(
        label: 'image_picker_example_picked_image',
        child: CircleAvatar(
          child: Image.file(
            File(_imageFileList!.path),
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
      );
    } else {
      return Image.asset("assets/profile/profile_picture.png");
    }
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 100,
            child: GestureDetector(onTap:(){
              _showPicker(context);
            },

              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: _previewImages(),
              ),
            ),
          ).pOnly(top: 30, bottom: 30).wFull(
                context,
              ),
          ProfilePageTextFields(),
         // MyProfilePageButton()
        ],
      ),
    );
  }
}
