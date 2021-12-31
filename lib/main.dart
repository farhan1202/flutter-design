import 'package:app_design/app/utils/colorsConst.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  GetStorage().writeIfNull('isLogin', false);
  runApp(const MyApp());
}

bool isLogin = false;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    isLogin = GetStorage().read('isLogin');
    return GetMaterialApp(
      debugShowMaterialGrid: false,
      title: "Application",
      initialRoute: (isLogin == true) ? Routes.MAIN_PAGE : AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        appBarTheme: const AppBarTheme(
          color: kPrimaryColor,
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
    );
  }
}
