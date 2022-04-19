import 'package:congraph/route_generator.dart';
import 'package:congraph/styles/app_button_styles.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDCv67Y8lXqHWRqZeqA1oXJ2CXuB6FhhPc",
      authDomain: "congraphs.firebaseapp.com",
      projectId: "congraphs",
      storageBucket: "congraphs.appspot.com",
      messagingSenderId: "755408610565",
      appId: "1:755408610565:web:bed7122a6a735095db036c",
      measurementId: "G-9Z813VED41",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      theme: ThemeData(
        elevatedButtonTheme: AppButtonStyles().elevatedButtonTheme,
        textButtonTheme: AppButtonStyles().textButtonTheme,
        fontFamily: 'Ubuntu',
      ),
    );
  }
}
