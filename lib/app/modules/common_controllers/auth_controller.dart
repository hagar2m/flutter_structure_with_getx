import 'package:flutter/cupertino.dart';
import 'package:flutter_structure_with_getx/app/data/repositories/auth_repository.dart';
import 'package:flutter_structure_with_getx/app/modules/home/home_screen.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController to = Get.find();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Auth authRepo = Auth();
  String userId = '';

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  signIn() async {
    debugPrint("Sign in - email: ${emailController.text} - pass: ${passwordController.text}");
    userId = await authRepo.signInWithEmailAndPassword(emailController.text, passwordController.text);
    Get.to(HomeScreen());
  }
}
