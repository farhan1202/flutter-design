import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../controllers/image_picker_controller.dart';

class ImagePickerView extends GetView<ImagePickerController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ImagePickerView'),
        centerTitle: true,
      ),
      body: Center(
          child: Padding(
        padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(
                () => controller.selectImagePath.value == ''
                    ? Text(
                        'Select image from camera/galley',
                        style: TextStyle(fontSize: 20),
                      )
                    : Image.file(
                        File(controller.selectImagePath.value),
                        width: double.infinity,
                        height: 300,
                      ),
              ),
              Obx(
                () => controller.name.value == ''
                    ? SizedBox()
                    : Text(
                        controller.name.value,
                        style: TextStyle(fontSize: 20),
                      ),
              ),
              SizedBox(
                height: 10,
              ),
              RaisedButton(
                onPressed: () {
                  controller.getImage(ImageSource.camera);
                },
                child: Text("Camera"),
              ),
              RaisedButton(
                onPressed: () {
                  controller.getImage(ImageSource.gallery);
                },
                child: Text("Gallery"),
              ),
              ElevatedButton(
                  onPressed: () => controller.upload(), child: Text("UPLOAD"))
            ],
          ),
        ),
      )),
    );
  }
}
