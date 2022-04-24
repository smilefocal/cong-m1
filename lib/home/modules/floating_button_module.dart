import 'package:congraph/home/cubit/switch_control_cubit.dart';
import 'package:congraph/home/modules/task_module.dart';
import 'package:congraph/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../cubit/congraphs_switch_cubit.dart';

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
                const AddNewTaskTextField(),
                const _PageSpacing(),
                const AddNumberOfMonthsTextField(),
                const _PageSpacing(),
                BlocProvider(
                  create: (context) => SwitchControlCubit(),
                  child: const DisableDeleteSwitch(),
                ),
                const _PageSpacing(),
                BlocProvider(
                  create: (context) => CongraphsSwitchCubit(),
                  child: const DisableCongraphSwitch(),
                ),
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
    return BlocBuilder<SwitchControlCubit, bool>(
      builder: (context, state) {
        return ListTile(
          title: const Text('Disable Delete?'),
          subtitle:
              const Text('Task will not be deleted until period is over!'),
          trailing: Switch(
              value: context.read<SwitchControlCubit>().state,
              onChanged: (val) {
                if (val == true) {
                  context.read<SwitchControlCubit>().activateSwitch();
                } else {
                  context.read<SwitchControlCubit>().deactivateSwitch();
                }
              }),
        );
      },
    );
  }
}

//Disable congraph switch
class DisableCongraphSwitch extends StatelessWidget {
  const DisableCongraphSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CongraphsSwitchCubit, bool>(
      builder: (context, state) {
        return ListTile(
          title: const Text('Congraphs'),
          subtitle: const Text(
            'A special congraph art will be created for you when you complete this task!',
          ),
          trailing: Switch(
            value: context.read<CongraphsSwitchCubit>().state,
            onChanged: (val) {
              if (val == true) {
                context.read<CongraphsSwitchCubit>().generateCongraph();
              } else {
                context.read<CongraphsSwitchCubit>().disableCongraph();
              }
            },
          ),
        );
      },
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
