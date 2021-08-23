import 'package:equatable/equatable.dart';
import 'package:location/location.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeStateInitial extends HomeState {}

class HomeStateLoading extends HomeState {}

class HomeStateSuccessGetSpeed extends HomeState {
  final LocationData position;
  final double distance;
  HomeStateSuccessGetSpeed({required this.position, required this.distance});

  @override
  List<Object?> get props => [position, distance];
}

class HomeStateGetInitLatAndLong extends HomeState {
  // final double initLatitude;
  // final double initLongitude;

  // HomeStateGetInitLatAndLong(
  //     {required this.initLatitude, required this.initLongitude});
  @override
  List<Object?> get props => [];
}

class HomeStateError extends HomeState {
  final String error;
  HomeStateError({
    required this.error,
  });

  @override
  List<Object?> get props => [error];
}
