
import 'package:equatable/equatable.dart';
import 'package:location/location.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeStateInitial extends HomeState {}

class HomeStateLoading extends HomeState {}

class HomeStateSuccess extends HomeState {
  final LocationData position;
  HomeStateSuccess({required this.position});
  
  @override
  List<Object?> get props => [position];
}

class HomeStateError extends HomeState {
  final String error;
  HomeStateError({
    required this.error,
  });

  @override
  List<Object?> get props => [error];
  
}
