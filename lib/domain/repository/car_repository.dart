import 'package:car_rental/data/model/car.dart';

abstract interface class CarRepository {
  Future<List<Car>> fetchCard();
}
