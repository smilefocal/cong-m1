import 'package:flutter_bloc/flutter_bloc.dart';

class TimerCubit extends Cubit<int> {
  TimerCubit() : super(5);

  void decrementTimer() => emit(state - 1);
  void resetTimer() => emit(5);
}
