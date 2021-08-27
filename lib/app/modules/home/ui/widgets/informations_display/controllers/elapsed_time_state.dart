import 'package:equatable/equatable.dart';

class ElapsedTimeState extends Equatable {
  final int milliseconds;
  final int finalMilliseconds;

  ElapsedTimeState.initialState()
      : milliseconds = 0,
        finalMilliseconds = 0;

  ElapsedTimeState.watchRunning({required this.milliseconds})
      : finalMilliseconds = 0;

  ElapsedTimeState.stopWatch({this.finalMilliseconds = 0}) : milliseconds = 0;

  @override
  List<Object?> get props => [milliseconds, finalMilliseconds];
}
