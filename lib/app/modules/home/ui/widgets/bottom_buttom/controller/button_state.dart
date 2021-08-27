import 'package:equatable/equatable.dart';

class ButtonState extends Equatable {
  final int index;

  ButtonState.initialState() : index = 0;

  ButtonState.changeButton({required this.index});

  @override
  List<Object?> get props => [index];
}
