import 'package:flutter/material.dart';
import 'package:flutter_structure_with_getx/app/data/services/api_services/auth_services.dart';
import 'package:flutter_structure_with_getx/app/modules/login/login_controller.dart';
import 'package:flutter_structure_with_getx/app/modules/home/home_screen.dart';
import 'package:flutter_structure_with_getx/app/modules/login/login_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';

class MockAuth extends Mock implements BaseAuth {}

class MockController extends Mock implements LoginController {}

void main() {
  testWidgets(
      'non-empty email and password, valid account, call sign in, fails',
      (WidgetTester tester) async {
    MockAuth mockAuth = MockAuth();
    MockController mockController = MockController();

    await tester.pumpWidget(GetMaterialApp(
      home: LoginScreen(),
    ));

    Finder emailField = find.byKey(Key('email'));
    await tester.enterText(emailField, 'email666@test.com');
    expect(find.text('email666@test.com'), findsOneWidget);

    Finder passwordField = find.byKey(Key('password'));
    await tester.enterText(passwordField, 'password');
    expect(find.text('password'), findsOneWidget);

    await tester.tap(find.byKey(Key('signIn')));

    when(mockController.signIn()).thenAnswer((_) async {
      await Future.delayed(Duration.zero);
    });

    await tester.pumpAndSettle();
    expect(find.byType(HomeScreen), findsOneWidget);
  });
}
