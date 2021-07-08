import 'package:flutter/material.dart';
import 'package:flutter_structure_with_getx/app/modules/login/login_screen.dart';
import 'package:get/get.dart';
import 'app/routes/app_routes.dart';
import 'app/routes/app_screens.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      showSemanticsDebugger: false,
      getPages: AppScreens.screens,
      // initialBinding: LoginBinding(),
      initialRoute: AppRoutes.LOGIN,
      home: LoginScreen(),
    );
  }
}
