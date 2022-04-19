import 'package:congraph/authentication/cubit/button_clicked_cubit.dart';
import 'package:congraph/authentication/screen/authentication_page.dart';
import 'package:congraph/error/screen/navigation_error_page.dart';
import 'package:congraph/home/screen/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///
class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(providers: [
            BlocProvider<GoogleCubit>(
              create: (BuildContext context) => GoogleCubit(),
            ),
            BlocProvider<TwitterCubit>(
              create: (BuildContext context) => TwitterCubit(),
            ),
          ], child: const AuthenticationPage()),
        );
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomePage());
      default:
        return MaterialPageRoute(builder: (_) => const NavigationErrorPage());
    }
  }
}
