import 'package:congraph/authentication/screen/authentication_page.dart';
import 'package:congraph/styles/app_button_styles.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        elevatedButtonTheme: AppButtonStyles().elevatedButtonTheme,
        textButtonTheme: AppButtonStyles().textButtonTheme,
      ),
      home: const AuthenticationPage(),
    );
  }
}
