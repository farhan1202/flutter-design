import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:app_design/app/data/providers/authProvider.dart';

class RegisterPageController extends GetxController {
  //TODO: Implement RegisterPageController

  late TextEditingController nobpC;
  late TextEditingController nameC;
  late TextEditingController passwordC;
  late TextEditingController rePasswordC;

  Future<void> signUpAccount(
      String noId, String name, String pass, String rePass) async {
    if (noId != '' && name != '' && pass != '' && rePass != '') {
      if (pass == rePass) {
        AuthController().signUp(noId, name, pass).then(
          (value) {
            var data = value.body;
            if (data['STATUS'] == '200') {
              Get.defaultDialog(
                title: "Registratoin",
                middleText: data['MESSAGE'],
                textConfirm: "OK",
                onConfirm: () {
                  Get.back();
                  Get.back();
                },
              );
            } else {
              messageDialog(data['MESSAGE']);
            }
          },
        );
      } else {
        messageDialog("confirmasi password salah");
      }
    } else {
      messageDialog("Harap isi semua field");
    }
  }

  void messageDialog(msg) {
    Get.defaultDialog(title: "Perhatian", middleText: msg);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    nobpC = TextEditingController();
    nameC = TextEditingController();
    passwordC = TextEditingController();
    rePasswordC = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    nobpC.dispose();
    nameC.dispose();
    passwordC.dispose();
    rePasswordC.dispose();
    super.onClose();
  }
}
