import 'package:flutter_bloc/flutter_bloc.dart';

import 'button_state.dart';

class ButtonCubit extends Cubit<ButtonState> {
  ButtonCubit(ButtonState initialState) : super(ButtonState.initialState());

  Future<void> changeButton({required int indexClicked}) async {
    emit(ButtonState.changeButton(index: indexClicked));
  }
}
