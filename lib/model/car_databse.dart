// import 'dart:math';
//
// import 'package:pny_firebase/model/cars_model.dart';
//
// class carDatabase {
//   List <CarsModel> getCarModel() {
//     List<String> name = [
//       'Tesla Model S',
//       'Audi Model A6',
//       'Mitsubishi Outlander PHEV',
//       'BMW Model i7'
//     ];
//     List<String> carIcon = [
//       'assets/images/tesla_1.png',
//       'assets/images/audi.png',
//       'assets/images/mitsubishi.png',
//       'assets/images/bmw.png',
//     ];
//
//     int r = Random().nextInt(4);
//     List <CarsModel> carData = [];
//     for(int i = 0; i < 4; i++) {
//       CarsModel c = CarsModel(name[r], Random().nextInt(2008).toString(),
//         Random().nextInt(100).toString(), carIcon[r],
//       );
//       carData.add(c);
//     }
//     return carData;
//   }
// }
