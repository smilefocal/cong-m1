import 'package:congraph/styles/app_colors.dart';
import 'package:flutter/material.dart';

class FloatingButtonModule extends StatelessWidget {
  const FloatingButtonModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: AppColors.appBarBackgroundColor,
      tooltip: 'Add new Task',
      child: const Icon(
        Icons.add,
        color: AppColors.color4,
      ),
    );
  }
}
