import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sensores/button.dart';

class Camera extends StatefulWidget {
  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {

    File? image;

    Future pickImage() async {
      try {
        final image = await ImagePicker().pickImage(source: ImageSource.camera);
        if(image == null) return;
        final imageTemp = File(image.path);
        setState(() => this.image = imageTemp);
      } on PlatformException catch(e) {
        print('Failed to pick image: $e');
      }
    }

        Future pickImageFromGallery() async {
      try {
        final image = await ImagePicker().pickImage(source: ImageSource.gallery);
        if(image == null) return;
        final imageTemp = File(image.path);
        setState(() => this.image = imageTemp);
      } on PlatformException catch(e) {
        print('Failed to pick image: $e');
      }
    }
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Image Picker Plugin"),
      ),
      body: Center(
        child: Column(
          children: [       
            SensorButton(
              text: "Pick Image from Camera", 
              icon: Icons.camera, 
              onPressed: () {
                  pickImage();
                }
            ),

            SensorButton(
              text: "Pick Image from Gallery", 
              icon: Icons.image, 
              onPressed: () {
                  pickImageFromGallery();
                }
            )
          ],
        ),
      )
    );
  }
}