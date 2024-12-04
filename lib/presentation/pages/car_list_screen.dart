// ignore_for_file: must_be_immutable

import 'package:car_rental/presentation/widgets/car_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/car_bloc.dart';

class CarListScreen extends StatelessWidget {
  CarListScreen({super.key});
  List<String> carImage = [
    'assets/carimages/2.png',
    'assets/carimages/1.png',
    'assets/carimages/3.png',
    'assets/carimages/6.png',
    'assets/carimages/8.png',
    'assets/carimages/7.png',
    'assets/carimages/5.png',
    'assets/carimages/4.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text("Choose Your Car"),
      ),
      body: BlocBuilder<CarBloc, CarState>(
        builder: (context, state) {
          if (state is CarLoading) {
            print("car loading ");

            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CarsLoaded) {
            print("car loaded ${state.car}");
            return ListView.builder(
              itemCount: state.car.length,
              itemBuilder: (context, index) {
                return CarCard(
                  car: state.car[index],
                  carImage: carImage[index],
                );
              },
            );
          } else if (state is CarsError) {
            print("car error ${state.message} ");

            return const Center(
              child: Text(
                "Error ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          } else {
            print("car anythig else");

            return const Center(
              child: Text(
                "Anything else ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
