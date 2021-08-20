import 'package:equatable/equatable.dart';

class ButtonEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ButtonEventChangeButton extends ButtonEvent {
  final int index;
  ButtonEventChangeButton({
    required this.index,
  });
  @override
  List<Object?> get props => [];
}
