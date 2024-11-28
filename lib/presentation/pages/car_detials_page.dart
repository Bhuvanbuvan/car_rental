import 'package:car_rental/data/model/car.dart';
import 'package:car_rental/presentation/pages/map_detials.dart';
import 'package:car_rental/presentation/widgets/car_card.dart';
import 'package:car_rental/presentation/widgets/more_car.dart';
import 'package:flutter/material.dart';

class CarDetialsPage extends StatefulWidget {
  final Car car;
  const CarDetialsPage({super.key, required this.car});

  @override
  State<CarDetialsPage> createState() => _CarDetialsPageState();
}

class _CarDetialsPageState extends State<CarDetialsPage>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(seconds: 9),
      vsync: this,
    );

    _animation = Tween<double>(
      begin: 1.0,
      end: 1.5,
    ).animate(_animationController!)
      ..addListener(() => {setState(() {})});
    _animationController!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController!.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _animationController!.forward();
      }
    });
    _animationController!.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.info_outline),
            Text(" Information"),
          ],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            CarCard(
              car: Car(
                model: widget.car.model,
                distance: widget.car.distance,
                fuelCapacity: widget.car.fuelCapacity,
                pricePerHour: widget.car.pricePerHour,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Color(0xFFF3F3F3),
                          borderRadius: BorderRadius.circular(
                            20,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10,
                              spreadRadius: 5,
                            ),
                          ]),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage('assets/user.png'),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Jhon Jocob",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "\$4000.23",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MapDetials(
                              car: widget.car,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: 170,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 10,
                                spreadRadius: 5,
                              ),
                            ]),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Transform.scale(
                            scale: _animation!.value,
                            alignment: Alignment.center,
                            child: Image.asset(
                              'assets/maps.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(
                20,
              ),
              child: Column(
                children: [
                  MoreCar(
                    car: Car(
                      model: widget.car.model + " -1",
                      distance: widget.car.distance + 100,
                      fuelCapacity: widget.car.fuelCapacity + 100,
                      pricePerHour: widget.car.pricePerHour + 10,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  MoreCar(
                    car: Car(
                      model: widget.car.model + " -2",
                      distance: widget.car.distance + 200,
                      fuelCapacity: widget.car.fuelCapacity + 200,
                      pricePerHour: widget.car.pricePerHour + 20,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  MoreCar(
                    car: Car(
                      model: widget.car.model + " -3",
                      distance: widget.car.distance + 300,
                      fuelCapacity: widget.car.fuelCapacity + 300,
                      pricePerHour: widget.car.pricePerHour + 30,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  MoreCar(
                    car: Car(
                      model: widget.car.model + " -4",
                      distance: widget.car.distance + 400,
                      fuelCapacity: widget.car.fuelCapacity + 400,
                      pricePerHour: widget.car.pricePerHour + 40,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
