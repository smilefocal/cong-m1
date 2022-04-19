import 'package:flutter_bloc/flutter_bloc.dart';

class GoogleCubit extends Cubit<bool> {
  GoogleCubit() : super(false);
  googleBtnClicked() => emit(true);
  resetGoogleBtn() => emit(false);
}

class TwitterCubit extends Cubit<bool> {
  TwitterCubit() : super(false);
  twitterBtnClicked() => emit(true);
  resetTwitterBtn() => emit(false);
}

class ButtonClickedNetworkConnection extends Cubit<bool> {
  ButtonClickedNetworkConnection() : super(false);

  networkDown() => emit(true);
  networkUp() => emit(false);
}
