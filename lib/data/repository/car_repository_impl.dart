import 'package:car_rental/data/datasource/firebase_car_datasource.dart';
import 'package:car_rental/data/model/car.dart';
import 'package:car_rental/domain/repository/car_repository.dart';

class CarRepositoryImpl implements CarRepository {
  final FirebaseCarDatasource datasource;

  CarRepositoryImpl({required this.datasource});
  @override
  Future<List<Car>> fetchCard() {
    return datasource.getCars();
  }
}
