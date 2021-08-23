import 'package:equatable/equatable.dart';

class ButtonState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ButtonStateInital extends ButtonState {
  @override
  List<Object?> get props => [];
}

class ButtonStateUpdated extends ButtonState {
  final int index;
  ButtonStateUpdated({
    required this.index,
  });

  @override
  List<Object?> get props => [index];
}
