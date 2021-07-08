import 'package:flutter_structure_with_getx/app/modules/login/login_binding.dart';
import 'package:flutter_structure_with_getx/app/modules/login/login_screen.dart';
import 'package:get/get.dart';
import '../modules/home/home_screen.dart';
import 'app_routes.dart';
// import 'package:flutter_structure_with_getx/app/routes/app_routes.dart';

class AppScreens {
  static final screens = [
    GetPage(
      name: AppRoutes.INITIAL,
      page: () => HomeScreen(),
    ),
    GetPage(
        name: AppRoutes.LOGIN,
        page: () => LoginScreen(),
        binding: LoginBinding()),
  ];
}
