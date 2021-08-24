import 'package:equatable/equatable.dart';

abstract class ElapsedTimeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ElapsedTimeEventGetTime extends ElapsedTimeEvent {}

class ElapsedTimeEventStart extends ElapsedTimeEvent {}

class ElapsedTimeEventStop extends ElapsedTimeEvent {}
