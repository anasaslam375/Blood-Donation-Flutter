import 'dart:io';

import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class TaskManager extends StatefulWidget {
  const TaskManager({Key? key}) : super(key: key);

  @override
  _TaskManagerState createState() => _TaskManagerState();
}

class _TaskManagerState extends State<TaskManager> {
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
        child: Image.file(
          File(_imageFileList!.path),
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showPicker(context);
      },
      child: CircleAvatar(
        radius: 55,
        backgroundColor: Color(0xffFDCF09),
        child: _imageFileList != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: _previewImages())
            : Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(50)),
                width: 100,
                height: 100,
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.grey[800],
                ),
              ),
      ),
    );
  }
}
