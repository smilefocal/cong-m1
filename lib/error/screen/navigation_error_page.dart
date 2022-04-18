import 'package:congraph/styles/app_colors.dart';
import 'package:flutter/material.dart';

class NavigationErrorPage extends StatelessWidget {
  const NavigationErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.color4,
      body: Center(
        child: SizedBox(
          child: SelectableText('Path error encountered!',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
              )),
        ),
      ),
    );
  }
}
