// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class EditPage extends StatefulWidget {
  EditPage({Key? key}) : super(key: key);

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final _formKey = GlobalKey<FormState>();
  var _image;
  final _picker = ImagePicker();

  final TextEditingController bio = TextEditingController();
  final TextEditingController total_trips = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          //************ Image ************//
          GestureDetector(
            onTap: () async {
              final XFile? image =
                  await _picker.pickImage(source: ImageSource.gallery);
              setState(() {
                _image = File(image!.path);
              });
            },
            child: Container(
              width: 150,
              height: 150,
              margin: const EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFDDDDDD),
              ),
              child: _image != null
                  ? CircleAvatar(
                      backgroundImage: new FileImage(_image),
                    )
                  : Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xFFDDDDDD)),
                      width: 200,
                      height: 200,
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.grey[800],
                      ),
                    ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          //************ Bio ************//
          TextField(
            keyboardType: TextInputType.text,
            controller: bio,
            decoration: InputDecoration(
              labelText: "Bio",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 10,
          ),

          TextField(
            keyboardType: TextInputType.number,
            controller: total_trips,
            decoration: InputDecoration(
              labelText: "Total Trips",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                context.push("/Homepage");
              },
              child: Text("Save"))
        ],
      ),
    );
  }
}
