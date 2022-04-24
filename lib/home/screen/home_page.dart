import 'package:congraph/home/modules/floating_button_module.dart';
import 'package:congraph/home/modules/search_filter_module.dart';
import 'package:congraph/home/modules/task_module.dart';
import 'package:congraph/styles/app_button_styles.dart';
import 'package:congraph/styles/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.color4,
      appBar: AppBar(
        title: Row(
          children: [
            SelectableText(
              'Good morning, ${user.displayName}',
              style: const TextStyle(color: AppColors.color3),
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
      floatingActionButton: BlocProvider(
        create: (context) => FloatingButtonModuleCubit(),
        child: const FloatingButtonModule(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          children: const [
            SearchFilterModule(),
            SizedBox(
              height: 10,
            ),
            TaskModule(),
            SizedBox(
              height: 10,
            ),
            TaskModule(),
          ],
        ),
      ),
    );
  }
}
