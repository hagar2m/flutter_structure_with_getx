import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_controller.dart';
import '../../data/app_validator.dart';

class LoginScreen extends StatelessWidget {
  final LoginController authController = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter login demo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: authController.formKey,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextFormField(
                  key: Key('email'),
                  controller: authController.emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: AppValidator().email,
                ),
                TextFormField(
                  key: Key('password'),
                  controller: authController.passwordController,
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  validator: AppValidator().password,
                ),

                /// SubmitButton ///
                _buildSubmitButton(),
              ]),
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return ElevatedButton(
      key: Key('signIn'),
      child: Text('Login', style: TextStyle(fontSize: 20.0)),
      onPressed: authController.signIn,
    );
  }
}
