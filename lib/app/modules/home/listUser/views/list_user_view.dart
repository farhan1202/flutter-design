import 'package:app_design/app/utils/colorsConst.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/list_user_controller.dart';

class ListUserView extends GetView<ListUserController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text('List Candidate'),
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: controller.getAllCandidate(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: Text("Loading"));
            }
            if (controller.candidate.length == 0) {
              return Center(child: Text("Data Tidak Ada"));
            }
            return ListView.builder(
              itemCount: controller.candidate.length,
              itemBuilder: (context, index) => cardTemplate(
                textTitle: "${controller.candidate[index].nama}",
                textSubtitle:
                    "ID : ${controller.candidate[index].nobpCandidate}",
              ),
            );
          },
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
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
            ),
          ],
        ),
      ),
    );
  }
}
