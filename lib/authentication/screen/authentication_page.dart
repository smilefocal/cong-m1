import 'package:congraph/authentication/modules/authentication_buttons_module.dart';
import 'package:congraph/authentication/modules/paint_clock_module.dart';
import 'package:flutter/material.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        PaintClockModule(),
        AuthenticationButtonsModule(),
      ],
    );
  }
}
