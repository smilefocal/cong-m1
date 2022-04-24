import 'package:flutter_bloc/flutter_bloc.dart';

class CongraphsSwitchCubit extends Cubit<bool> {
  CongraphsSwitchCubit() : super(true);

  generateCongraph() => emit(true);
  disableCongraph() => emit(false);
}
