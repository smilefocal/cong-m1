import 'package:congraph/home/modules/task_module.dart';
import 'package:congraph/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FloatingButtonModule extends StatelessWidget {
  const FloatingButtonModule({Key? key}) : super(key: key);

  void _showMaterialDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Add new Task'),
            backgroundColor: AppColors.color4,
            elevation: 3.0,
            content: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Task Name',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'No. of Months',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ListTile(
                  title: const Text('Disable Delete?'),
                  subtitle: const Text(
                      'Hooray! Task will not be deleted until period is over!'),
                  trailing: Switch(value: false, onChanged: (val) {}),
                ),
                const SizedBox(
                  height: 20,
                ),
                ListTile(
                  title: const Text('Congraphs'),
                  subtitle: const Text(
                      'A special congraph art will be created for you when you complete this task!'),
                  trailing: Switch(value: true, onChanged: (val) {}),
                ),
              ],
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    mini: true,
                    backgroundColor: AppColors.color1,
                    tooltip: 'Cancel',
                    onPressed: () {},
                    child: const FaIcon(
                      Icons.cancel,
                      color: AppColors.color3,
                    ),
                  ),
                  const ContainerChain(),
                  FloatingActionButton(
                    mini: true,
                    backgroundColor: AppColors.color1,
                    tooltip: 'Add',
                    onPressed: () {},
                    child: const FaIcon(
                      FontAwesomeIcons.checkDouble,
                      color: AppColors.color3,
                    ),
                  ),
                ],
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        _showMaterialDialog(context);
      },
      backgroundColor: AppColors.appBarBackgroundColor,
      tooltip: 'Add new Task',
      child: const Icon(
        Icons.add,
        color: AppColors.color4,
      ),
    );
  }
}
