import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final double speed;
  final double distance;
  final String error;

  HomeState.initialState()
      : speed = 0.0,
        distance = 0.0,
        error = '';

  HomeState.loadSuccess({
    required this.speed,
    required this.distance,
  }) : error = '';

  HomeState.error({required this.error})
      : speed = 0.0,
        distance = 0.0;

  @override
  List<Object?> get props => [speed, distance, error];
}
