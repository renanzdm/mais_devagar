import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mais_devagar/app/modules/home/ui/widgets/controller/button_controller/button_event.dart';
import 'package:mais_devagar/app/modules/home/ui/widgets/controller/button_controller/button_state.dart';

class ButtonBloc extends Bloc<ButtonEventChangeButton, ButtonState> {
  ButtonBloc(ButtonState initialState) : super(ButtonStateInital());

  @override
  Stream<ButtonState> mapEventToState(ButtonEventChangeButton event) async* {
    ButtonState state = ButtonStateInital();
    switch (event.runtimeType) {
      case ButtonEventChangeButton:
        state = _updateButtonClicked(indexSelected: event.index);
        break;
      default:
    }
    yield state;
  }

  ButtonState _updateButtonClicked({required int indexSelected}) {
    return ButtonStateUpdated(index: indexSelected);
  }
}
