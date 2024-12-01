import 'package:car_rental/data/model/car.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseCarDatasource {
  final FirebaseFirestore firestore;

  FirebaseCarDatasource(this.firestore);
  Future<List<Car>> getCars() async {
    var snapshot = await firestore.collection('cars').get();
    return snapshot.docs.map((doc) => Car.fromMap(doc.data())).toList();
  }
}
