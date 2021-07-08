import 'package:flutter/material.dart';
import 'package:flutter_structure_with_getx/app/modules/common_controllers/auth_controller.dart';
import 'package:flutter_structure_with_getx/app/modules/home/home_screen.dart';
import 'package:flutter_structure_with_getx/app/modules/login/login_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';

class MockAuth extends Mock implements AuthController {}

void main() {
  testWidgets(
      'non-empty email and password, valid account, call sign in, fails',
      (WidgetTester tester) async {
    MockAuth mockAuth = MockAuth();

    await tester.pumpWidget(GetMaterialApp(
      home: LoginScreen(),
    ));

    Finder emailField = find.byKey(Key('email'));
    await tester.enterText(emailField, 'email@test.com');

    Finder passwordField = find.byKey(Key('password'));
    await tester.enterText(passwordField, 'password');

    await tester.tap(find.byKey(Key('signIn')));

    when(mockAuth.signIn(mail: "email@test.com", pass: "password"))
        .thenAnswer((_) async {
      await Future.delayed(Duration.zero);
    });

    await tester.pumpAndSettle();

    expect(find.byType(HomeScreen), findsOneWidget);
  });
}
