import 'package:flutter/material.dart';
import '../common_controllers/auth_controller.dart';
import '../../data/app_validator.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final AuthController authController = AuthController.to;

  bool validateAndSave() {
    final FormState form = formKey.currentState!;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Future<void> validateAndSubmit() async {
    if (validateAndSave()) {
      authController.signIn();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter login demo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
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
            ]
          ),
        ),
      ),
    );
  }


  Widget _buildSubmitButton() {
    return ElevatedButton(
      key: Key('signIn'),
      child: Text('Login', style: TextStyle(fontSize: 20.0)),
      onPressed: validateAndSubmit,
    );
  }
}
