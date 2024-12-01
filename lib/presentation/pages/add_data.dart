import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddData extends StatefulWidget {
  const AddData({super.key});

  @override
  State<AddData> createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  FirebaseFirestore db = FirebaseFirestore.instance;

  void addData() {
    List<Map<String, dynamic>> premiumCars = [
      {
        'model': 'Tesla Model S',
        'distance': 1200.50,
        'fuelCapacity': 100.00, // Electric range in miles
        'pricePerHour': 120.00,
      },
      {
        'model': 'Rolls-Royce Phantom',
        'distance': 900.00,
        'fuelCapacity': 80.00, // Approximate equivalent in range
        'pricePerHour': 500.00,
      },
      {
        'model': 'Porsche 911 Turbo S',
        'distance': 1100.00,
        'fuelCapacity': 70.00,
        'pricePerHour': 200.00,
      },
      {
        'model': 'Lamborghini Huracan EVO',
        'distance': 950.00,
        'fuelCapacity': 85.44,
        'pricePerHour': 300.00,
      },
      {
        'model': 'Ferrari SF90 Stradale',
        'distance': 1000.00,
        'fuelCapacity': 90.24,
        'pricePerHour': 400.00,
      },
      {
        'model': 'Bentley Continental GT',
        'distance': 1050.00,
        'fuelCapacity': 95.24,
        'pricePerHour': 350.00,
      },
      {
        'model': 'Mercedes-Benz S-Class',
        'distance': 1150.00,
        'fuelCapacity': 100.53,
        'pricePerHour': 250.00,
      },
      {
        'model': 'Aston Martin DB11',
        'distance': 970.00,
        'fuelCapacity': 88.11,
        'pricePerHour': 280.00,
      },
    ];

    for (var elevemtn in premiumCars) {
      db.collection('cars').add(elevemtn).then(
            (DocumentReference id) => print(id.id),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text("body"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addData();
        },
        child: const Text("add"),
      ),
    );
  }
}
