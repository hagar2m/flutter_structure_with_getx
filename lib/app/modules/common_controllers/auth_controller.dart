import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
class AuthController extends GetxController {
  static AuthController to = Get.find();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  signIn() {
    debugPrint("Sign in - email: ${emailController.text} - pass: ${passwordController.text}");
  }

}