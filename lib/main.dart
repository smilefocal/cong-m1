import 'package:congraph/home/screen/home_page.dart';
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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        elevatedButtonTheme: AppButtonStyles().elevatedButtonTheme,
        textButtonTheme: AppButtonStyles().textButtonTheme,
        fontFamily: 'Ubuntu',
      ),
      home: const HomePage(),
    );
  }
}
