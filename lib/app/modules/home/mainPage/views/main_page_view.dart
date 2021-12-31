import 'package:app_design/app/routes/app_pages.dart';
import 'package:app_design/app/utils/colorsConst.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../controllers/main_page_controller.dart';

class MainPageView extends GetView<MainPageController> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final box = GetStorage();
    return Scaffold(
        appBar: AppBar(
          title: Text('MainPageView'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: kPrimaryLightColor,
            ),
            width: double.infinity,
            height: size.height,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  height: size.height * 0.15,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 45,
                        backgroundImage: NetworkImage(
                          "https://www.personality-database.com/profile_images/224901.png",
                        ),
                        backgroundColor: Colors.grey.withOpacity(0.5),
                      ),
                      SizedBox(
                        width: size.width * 0.05,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Num ID",
                            style: titleStyle(),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            box.read("userID"),
                            style: subTitleStyle(),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Name :",
                            style: titleStyle(),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            box.read("userName"),
                            style: subTitleStyle(),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  height: size.height * 0.85,
                  width: double.infinity,
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.025,
                      ),
                      Text(
                        "Main Menu",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.025,
                      ),
                      GestureDetector(
                        onTap: () => Get.toNamed(Routes.LIST_USER),
                        child: cardTemplate(
                          textTitle: "ListUser",
                          textSubtitle: "Memberikan Informasi User",
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.015,
                      ),
                      cardTemplate(
                        textTitle: "Add User",
                        textSubtitle: "Menambahkan daftar user",
                      ),
                      SizedBox(
                        height: size.height * 0.015,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.defaultDialog(
                            title: "Log Out",
                            middleText: "Anda Yakin",
                            textConfirm: "Yes",
                            textCancel: "No",
                            onConfirm: () {
                              GetStorage().erase();
                              Get.offAllNamed(Routes.LOGIN_PAGE);
                            },
                          );
                        },
                        child: cardTemplate(
                          textTitle: "LogOut",
                          textSubtitle: "Untuk Logout",
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

TextStyle titleStyle() => TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
    );
TextStyle subTitleStyle() => TextStyle(
      fontSize: 15,
    );

class cardTemplate extends StatelessWidget {
  final String textTitle;
  final String textSubtitle;
  // final String url;
  const cardTemplate({
    Key? key,
    required this.textTitle,
    required this.textSubtitle,
    // required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 4,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(13),
                child: Container(
                  width: 75,
                  height: 75,
                  color: kPrimaryColor,
                  // decoration: BoxDecoration(
                  //     image: DecorationImage(
                  //   image: NetworkImage(url),
                  // )),
                )),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  textTitle,
                  style: titleStyle(),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  textSubtitle,
                  style: subTitleStyle(),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
