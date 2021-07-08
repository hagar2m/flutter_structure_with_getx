import 'package:flutter_structure_with_getx/app/data/services/api_services/auth_services.dart';
import 'package:flutter_structure_with_getx/app/modules/login/login_controller.dart';
import 'package:get/get.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() {
      return LoginController(auth: AuthServices());
    });
  }
}
