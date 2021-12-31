import 'package:get/get.dart';

import '../modules/home/listUser/bindings/list_user_binding.dart';
import '../modules/home/listUser/views/list_user_view.dart';
import '../modules/home/mainPage/bindings/main_page_binding.dart';
import '../modules/home/mainPage/views/main_page_view.dart';
import '../modules/intro/loginPage/bindings/login_page_binding.dart';
import '../modules/intro/loginPage/views/login_page_view.dart';
import '../modules/intro/registerPage/bindings/register_page_binding.dart';
import '../modules/intro/registerPage/views/register_page_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN_PAGE;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN_PAGE,
      page: () => LoginPageView(),
      binding: LoginPageBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: _Paths.MAIN_PAGE,
      page: () => MainPageView(),
      binding: MainPageBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: _Paths.REGISTER_PAGE,
      page: () => RegisterPageView(),
      binding: RegisterPageBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: _Paths.LIST_USER,
      page: () => ListUserView(),
      binding: ListUserBinding(),
      transition: Transition.rightToLeft,
    ),
  ];
}
