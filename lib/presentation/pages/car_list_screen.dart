import 'package:car_rental/data/model/car.dart';
import 'package:car_rental/presentation/widgets/car_card.dart';
import 'package:flutter/material.dart';

class CarListScreen extends StatelessWidget {
  final List<Car> cars = [
    Car(
      model: "Fortunre",
      distance: 870,
      fuelCapacity: 50,
      pricePerHour: 45,
    ),
    Car(
      model: "Fortunre",
      distance: 870,
      fuelCapacity: 50,
      pricePerHour: 45,
    ),
    Car(
      model: "Fortunre",
      distance: 870,
      fuelCapacity: 50,
      pricePerHour: 45,
    ),
    Car(
      model: "Fortunre",
      distance: 870,
      fuelCapacity: 50,
      pricePerHour: 45,
    ),
    Car(
      model: "Fortunre",
      distance: 870,
      fuelCapacity: 50,
      pricePerHour: 45,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text("Choose Your Car"),
      ),
      body: ListView.builder(
        itemCount: cars.length,
        itemBuilder: (context, index) {
          return CarCard(car: cars[index]);
        },
      ),
    );
  }
}
