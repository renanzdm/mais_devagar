import 'package:flutter_bloc/flutter_bloc.dart';

import 'button_event.dart';
import 'button_state.dart';

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
