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
              children: const [
                AddNewTaskTextField(),
                _PageSpacing(),
                AddNumberOfMonthsTextField(),
                _PageSpacing(),
                DisableDeleteSwitch(),
                _PageSpacing(),
                DisableCongraphSwitch(),
              ],
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CancelInputBtn(),
                  //This is the horizontal yellow container chain.
                  ContainerChain(),
                  AddTaskBtn(),
                ],
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: 'newTask',
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

///--------------------------------TextFields
//Add new task name textField
class AddNewTaskTextField extends StatelessWidget {
  const AddNewTaskTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Task Name',
      ),
    );
  }
}

//Add number of months textField
class AddNumberOfMonthsTextField extends StatelessWidget {
  const AddNumberOfMonthsTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'No. of Months',
      ),
    );
  }
}

///--------------------------------Switches
//Disable delete switch
class DisableDeleteSwitch extends StatelessWidget {
  const DisableDeleteSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Disable Delete?'),
      subtitle:
          const Text('Hooray! Task will not be deleted until period is over!'),
      trailing: Switch(value: false, onChanged: (val) {}),
    );
  }
}

//Disable congraph switch
class DisableCongraphSwitch extends StatelessWidget {
  const DisableCongraphSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Congraphs'),
      subtitle: const Text(
          'A special congraph art will be created for you when you complete this task!'),
      trailing: Switch(value: true, onChanged: (val) {}),
    );
  }
}

///--------------------------------Buttons
//Cancel the task button.
class CancelInputBtn extends StatelessWidget {
  const CancelInputBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: 'cancelTask',
      mini: true,
      backgroundColor: AppColors.color1,
      tooltip: 'Cancel',
      onPressed: () {},
      child: const FaIcon(
        Icons.cancel,
        color: AppColors.color3,
      ),
    );
  }
}

//Add the task button.
class AddTaskBtn extends StatelessWidget {
  const AddTaskBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: 'addTask',
      mini: true,
      backgroundColor: AppColors.color1,
      tooltip: 'Add',
      onPressed: () {},
      child: const FaIcon(
        FontAwesomeIcons.checkDouble,
        color: AppColors.color3,
      ),
    );
  }
}

///--------------------------------Page Spacing
class _PageSpacing extends StatelessWidget {
  const _PageSpacing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 20,
    );
  }
}
