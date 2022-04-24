import 'package:congraph/authentication/screen/authentication_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('authentication buttons module', (widgetTester) async {
    //find the widgets in the file
    final googleAuthenticationBtn = find.byKey(const ValueKey('googleAuthBtn'));

    //actual test
    await widgetTester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: AuthenticationPage(),
      ),
    ));
    await widgetTester.enterText(googleAuthenticationBtn, 'google_auth');
    await widgetTester.tap(googleAuthenticationBtn);
    await widgetTester.pump();

    expect('google_auth', findsOneWidget);
  }, skip: true);
}
