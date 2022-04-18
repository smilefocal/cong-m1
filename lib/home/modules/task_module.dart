import 'package:congraph/styles/app_button_styles.dart';
import 'package:congraph/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TaskModule extends StatelessWidget {
  const TaskModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: const [
            SelectableText(
              'Harry Potter book 1',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: AppColors.color1,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            FaIcon(
              FontAwesomeIcons.check,
              color: AppColors.color1,
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Chip(
                backgroundColor: AppColors.color2,
                label: Text(
                  '1',
                  style: TextStyle(
                    fontSize: 30,
                    color: AppColors.color4,
                  ),
                ),
              ),
              ContainerChain(),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const DividerSection(),
            FloatingActionButton(
              onPressed: () {},
              backgroundColor: AppButtonStyles.iconTheme,
              foregroundColor: AppColors.color2,
              mini: true,
              tooltip: 'Mark today',
              child: const Icon(
                FontAwesomeIcons.calendarPlus,
              ),
            ),
            const DividerSection(),
            FloatingActionButton(
              onPressed: () {},
              backgroundColor: AppButtonStyles.iconTheme,
              foregroundColor: AppColors.color2,
              mini: true,
              tooltip: 'Delete task',
              child: const Icon(
                Icons.delete_sweep_rounded,
              ),
            ),
            const DividerSection(),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class DividerSection extends StatelessWidget {
  const DividerSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 20,
      child: const Divider(
        color: AppColors.color2,
      ),
    );
  }
}

class ContainerChain extends StatelessWidget {
  const ContainerChain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      width: 100,
      color: AppColors.color3,
    );
  }
}
