import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:car_rental/data/model/car.dart';
import 'package:car_rental/domain/usecase/get_cars.dart';
import 'package:flutter/material.dart';

part 'car_event.dart';
part 'car_state.dart';

class CarBloc extends Bloc<CarEvent, CarState> {
  final GetCars _getCars;
  CarBloc({
    required GetCars getCars,
  })  : _getCars = getCars,
        super(CarInitial()) {
    on<LoadCarEvent>(_loadCarEvent);
  }

  FutureOr<void> _loadCarEvent(
    LoadCarEvent event,
    Emitter<CarState> emit,
  ) async {
    emit(CarLoading());
    try {
      final car = await _getCars.call();
      emit(
        CarsLoaded(car: car),
      );
    } catch (e) {
      emit(
        CarsError(
          message: e.toString(),
        ),
      );
    }
  }
}
