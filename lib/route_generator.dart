import 'package:congraph/authentication/cubit/button_clicked_cubit.dart';
import 'package:congraph/authentication/screen/authentication_page.dart';
import 'package:congraph/error/screen/navigation_error_page.dart';
import 'package:congraph/home/cubit/floating_button_module_cubit.dart';
import 'package:congraph/home/screen/home_page.dart';
import 'package:congraph/styles/app_colors.dart';
import 'package:congraph/styles/app_text_styles.dart';
import 'package:congraph/timer/cubits/timer_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///
class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<GoogleCubit>(
                create: (BuildContext context) => GoogleCubit(),
              ),
              BlocProvider<TwitterCubit>(
                create: (BuildContext context) => TwitterCubit(),
              ),
              BlocProvider<TimerCubit>(
                create: (BuildContext context) => TimerCubit(),
              ),
            ],
            child: const AuthenticationPage(),
          ),
        );
      case '/home':
        if (args is User) {
          return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
              providers: [
                BlocProvider<FloatingButtonModuleCubit>(
                  create: (BuildContext context) => FloatingButtonModuleCubit(),
                ),
              ],
              child: HomePage(user: args),
            ),
          );
        }
        return _errorRoute();
      default:
        return MaterialPageRoute(
          builder: (_) => const NavigationErrorPage(),
        );
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return const Scaffold(
        backgroundColor: AppColors.color4,
        body: Center(
          child: Text(
            'Error in System!',
            style: AppTextStyles.errorTextStyle,
          ),
        ),
      );
    });
  }
}
