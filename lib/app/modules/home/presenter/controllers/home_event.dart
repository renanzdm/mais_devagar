import 'package:equatable/equatable.dart';
import 'package:location/location.dart';

class HomeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeEventGetVelocity extends HomeEvent{}

class HomeEventUpdateVelocityUser extends HomeEvent{
final LocationData location;

  HomeEventUpdateVelocityUser({required this.location});

  @override
  List<Object?> get props => [location];
}

class HomeEventError extends HomeEvent{
  final String error;

  HomeEventError({required this.error});

  @override
  List<Object?> get props => [error];
}