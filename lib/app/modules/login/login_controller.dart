import 'package:flutter/cupertino.dart';
import 'package:flutter_structure_with_getx/app/data/services/api_services/auth_services.dart';
import 'package:flutter_structure_with_getx/app/modules/home/home_screen.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  static LoginController to = Get.find();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // AuthRepository authRepo = AuthRepository();
  late BaseAuth authRepo;
  String userId = '';

  LoginController({required BaseAuth auth}) {
    authRepo = auth;
  }

  // setAuthRepo({BaseAuth? baseAuth}) {
  //   authRepo = baseAuth == null ? AuthServices() : baseAuth;
  // }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  bool validateAndSave() {
    final FormState form = formKey.currentState!;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  signIn() async {
    if (validateAndSave()) {
      debugPrint(
          "Sign in - email: ${emailController.text} - pass: ${passwordController.text}");
      userId = await authRepo.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      Get.to(HomeScreen());
    }
  }
}
