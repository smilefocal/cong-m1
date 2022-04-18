import 'package:congraph/authentication/screen/authentication_page.dart';
import 'package:congraph/error/screen/navigation_error_page.dart';
import 'package:congraph/home/screen/home_page.dart';
import 'package:flutter/material.dart';

///
class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const AuthenticationPage(),
        );
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomePage());
      default:
        return MaterialPageRoute(builder: (_) => const NavigationErrorPage());
    }
  }
}
