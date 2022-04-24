import 'package:flutter_bloc/flutter_bloc.dart';

///This controls the behavior of the deletion status.
///i.e whether or not to allow deletion of task.
class SwitchControlCubit extends Cubit<bool> {
  SwitchControlCubit() : super(false);

  void activateSwitch() => emit(true);
  void deactivateSwitch() => emit(false);
}
