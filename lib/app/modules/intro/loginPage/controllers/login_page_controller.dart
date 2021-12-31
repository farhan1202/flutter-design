import 'package:app_design/app/data/providers/authProvider.dart';
import 'package:app_design/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginPageController extends GetxController {
  //TODO: Implement LoginPageController

  late TextEditingController noIdC;
  late TextEditingController passwordC;

  Future<void> signIn(String noId, String password) async {
    if (noId != '' && password != '') {
      AuthController().signIn(noId, password).then(
        (value) {
          final data = value.body;
          if (data['STATUS'] == '200') {
            final user = data['DATA'];
            final box = GetStorage();
            box.write("isLogin", true);
            box.write("userID", user['nobp']);
            box.write("userName", user['nama']);
            Get.offAllNamed(Routes.MAIN_PAGE);
          } else {
            messageDialog(data['MESSAGE']);
          }
        },
      );
    } else {
      messageDialog("Harap isi field");
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    noIdC = TextEditingController();
    passwordC = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    noIdC.dispose();
    passwordC.dispose();
    super.onClose();
  }

  void messageDialog(String s) {
    Get.defaultDialog(title: "Perhatian", middleText: s);
  }
}
