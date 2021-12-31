import 'package:app_design/app/modules/intro/loginPage/views/background_view.dart';
import 'package:app_design/app/routes/app_pages.dart';
import 'package:app_design/app/utils/colorsConst.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_page_controller.dart';

class LoginPageView extends GetView<LoginPageController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: BackgroundView(SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "LOGIN",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            textFieldContainer(
              child: TextField(
                controller: controller.noIdC,
                cursorColor: Colors.white,
                style: TextStyle(color: Colors.white),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                decoration: inputCustom("No ID", Icons.person),
              ),
            ),
            textFieldContainer(
              child: TextField(
                  controller: controller.passwordC,
                  obscureText: true,
                  cursorColor: Colors.white,
                  style: TextStyle(color: Colors.white),
                  textInputAction: TextInputAction.done,
                  decoration: inputCustom("Password", Icons.lock)),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              width: size.width * 0.5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(29),
                child: ElevatedButton(
                  onPressed: () {
                    controller.signIn(
                      controller.noIdC.text,
                      controller.passwordC.text,
                    );
                  },
                  child: const Text(
                    "LOGIN",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: kPrimaryColor.withOpacity(0.9),
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 35),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("dont have an account?"),
                TextButton(
                  onPressed: () {
                    Get.toNamed(Routes.REGISTER_PAGE);
                  },
                  child: Text("Sign Up"),
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}

InputDecoration inputCustom(String hint, IconData icons) => InputDecoration(
    hintText: hint,
    hintStyle: TextStyle(color: Colors.white),
    border: InputBorder.none,
    icon: Icon(
      icons,
      color: Colors.white,
    ));

class textFieldContainer extends StatelessWidget {
  final Widget child;

  const textFieldContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 5,
      ),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: child,
    );
  }
}
