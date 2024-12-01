import 'package:car_rental/data/datasource/firebase_car_datasource.dart';
import 'package:car_rental/data/repository/car_repository_impl.dart';
import 'package:car_rental/domain/repository/car_repository.dart';
import 'package:car_rental/domain/usecase/get_cars.dart';
import 'package:car_rental/presentation/bloc/car_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> initInjection() async {
  _initOthers();
  getIt.registerLazySingleton(
    () => FirebaseFirestore.instance,
  );
}

void _initOthers() {
  getIt.registerFactory<FirebaseCarDatasource>(
    () => FirebaseCarDatasource(
      getIt(),
    ),
  );

  getIt.registerFactory<CarRepository>(
    () => CarRepositoryImpl(
      getIt(),
    ),
  );

  getIt.registerFactory(
    () => GetCars(
      getIt(),
    ),
  );

  getIt.registerLazySingleton(
    () => CarBloc(
      getCars: getIt(),
    ),
  );
}
