import 'package:car_rental/presentation/pages/car_detials_page.dart';
import 'package:flutter/material.dart';

import '../../data/model/car.dart';

class CarCard extends StatelessWidget {
  final String carImage;
  final Car car;

  const CarCard({super.key, required this.car, required this.carImage});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CarDetialsPage(
              car: car,
              carImageUrl: carImage,
            ),
          ),
        );
      },
      child: Container(
        decoration: const BoxDecoration(
            color: Color(0xffF3F3F3),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 12,
                color: Colors.black12,
                spreadRadius: 5,
              )
            ]),
        margin: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        child: Column(
          children: [
            Image.asset(
              carImage,
              height: 170,
              width: 400,
              fit: BoxFit.cover,
            ),
            Text(
              car.model,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/gps.png'),
                        Text('${car.distance.toStringAsFixed(0)}km')
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset('assets/pump.png'),
                        Text('${car.fuelCapacity.toStringAsFixed(0)}L')
                      ],
                    )
                  ],
                ),
                Text(
                  "\$${car.pricePerHour.toStringAsFixed(2)}/h",
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
