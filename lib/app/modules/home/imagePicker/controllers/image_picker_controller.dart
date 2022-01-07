import 'dart:io';

import 'package:app_design/app/data/providers/authProvider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class ImagePickerController extends GetxController {
  //TODO: Implement ImagePickerController

  var selectImagePath = ''.obs;
  var name = ''.obs;
  var selectImageSize = ''.obs;

  void getImage(ImageSource imageSource) async {
    final pickedFile = await ImagePicker().getImage(source: imageSource);
    if (pickedFile != null) {
      selectImagePath.value = pickedFile.path;
      name.value = basename(pickedFile.path);
      selectImageSize.value =
          ((File(selectImagePath.value)).lengthSync() / 1024 / 1024)
                  .toStringAsFixed(2) +
              " Mb";
    } else {
      Get.snackbar('Error', 'No image selected',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  void upload() {
    var myFile = File(selectImagePath.value);
    uploadImage(myFile);
  }

  void uploadImage(File file) {
    // Get.dialog(
    //   Center(
    //     child: CircularProgressIndicator(),
    //   ),
    //   barrierDismissible: false,
    // );
    AuthController().uploadImage(file).then((value) {
      if (value.body['STATUS'] == '200') {
        Get.snackbar('Success', value.body['MESSAGE'],
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white);
      } else {
        Get.snackbar('Error', 'File upload failed1',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.blue,
            colorText: Colors.white);
      }
    }, onError: (e) {
      Get.back();
      Get.snackbar('Error', 'File upload failed2',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    });
  }
}
