import 'package:flutter/material.dart';
import 'package:flutter_structure_with_getx/app/data/repositories/auth_repository.dart';
import 'package:flutter_structure_with_getx/app/modules/login/login_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_structure_with_getx/main.dart';

class MockAuth extends Mock implements BaseAuth {

}

void main() {
  Widget makeTestableWidget({ required Widget child }){
    return MaterialApp(
      home: child,
    );
  }

  testWidgets('non-empty email and password, valid account, call sign in, fails', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    // await tester.pumpWidget(MaterialApp(
    //   home: LoginScreen(),
    // ));

    MockAuth mockAuth = MockAuth();
    LoginScreen loginScreen = LoginScreen();
    await tester.pumpWidget(makeTestableWidget(
      child: loginScreen
    ));

    await tester.tap(find.byKey(Key('signIn')));

    when(mockAuth.signInWithEmailAndPassword("test@test.com", "password"))
        .thenAnswer((_) async {
      await Future.delayed(Duration.zero);
      return "12-33";
    });

    // mockAuth.signInWithEmailAndPassword(email, password)

    // // Verify that our counter starts at 0.
    // expect(find.text('0'), findsOneWidget);
    // expect(find.text('1'), findsNothing);
    //
    // // Tap the '+' icon and trigger a frame.
    // await tester.tap(find.byIcon(Icons.add));
    // await tester.pump();
    //
    // // Verify that our counter has incremented.
    // expect(find.text('0'), findsNothing);
    // expect(find.text('1'), findsOneWidget);
  });
}
