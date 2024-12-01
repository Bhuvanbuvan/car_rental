part of 'car_bloc.dart';

@immutable
sealed class CarState {}

final class CarInitial extends CarState {}

final class CarLoading extends CarState {}

final class CarsLoaded extends CarState {
  final List<Car> car;

  CarsLoaded({required this.car});
}

final class CarsError extends CarState {
  final String message;
  CarsError({required this.message});
}
