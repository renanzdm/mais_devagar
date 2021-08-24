import 'package:equatable/equatable.dart';

class ElapsedTimeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ElapsedTimeStateInitial extends ElapsedTimeState {}

class ElapsedTimeStateWatchRunning extends ElapsedTimeState {
  final int milliseconds;

  ElapsedTimeStateWatchRunning(this.milliseconds);
  @override
  List<Object?> get props => [milliseconds];
}

class ElapsedTimeStateWatchStopped extends ElapsedTimeState {
  final int finalMilliseconds;

  ElapsedTimeStateWatchStopped({this.finalMilliseconds = 0});

  @override
  List<Object?> get props => [finalMilliseconds];
}
