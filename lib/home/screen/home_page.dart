import 'package:congraph/styles/app_button_styles.dart';
import 'package:congraph/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            CircleAvatar(
              backgroundColor: AppColors.appBarBackgroundColor,
            ),
            SizedBox(
              width: 5,
            ),
            SelectableText(
              'Good morning, Daniel',
              style: TextStyle(color: AppColors.color3),
            ),
          ],
        ),
        backgroundColor: AppColors.appBarBackgroundColor,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const FaIcon(
              FontAwesomeIcons.userPlus,
              color: AppButtonStyles.iconTheme,
            ),
            tooltip: 'Add friend',
          ),
          const SizedBox(
            width: 10,
          ),
          IconButton(
            onPressed: () {},
            icon: const FaIcon(
              FontAwesomeIcons.chartLine,
              color: AppButtonStyles.iconTheme,
            ),
            tooltip: 'Generate Chart',
          ),
          const SizedBox(
            width: 10,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
              color: AppButtonStyles.iconTheme,
            ),
            tooltip: 'App Settings',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.appBarBackgroundColor,
        tooltip: 'Add new Task',
        child: const Icon(
          Icons.add,
          color: AppColors.color4,
        ),
      ),
    );
  }
}
