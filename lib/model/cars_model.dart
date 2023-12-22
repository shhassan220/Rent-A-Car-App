class CarsModel {
  String carName, carModel, carRent, carImg;

  CarsModel(
      {required this.carName,
      required this.carModel,
      required this.carRent,
      required this.carImg});
}

final List <CarsModel> carList = [
  CarsModel(
      carName: "Tesla",
      carModel: "Tesla Model S",
      carRent: "4500",
      carImg: "assets/images/tesla_1.png",
  ),
  CarsModel(
    carName: "Audi",
    carModel: "A4",
    carRent: "4000",
    carImg: "assets/images/audi_a4.png",
  ),
  CarsModel(
    carName: "BMW",
    carModel: "BMW I8 2020",
    carRent: "3500",
    carImg: "assets/images/bmw.png",
  ),
  CarsModel(
    carName: "Mitsubishi",
    carModel: "2015 Lancer",
    carRent: "3000",
    carImg: "assets/images/honda.png",
  ),
  CarsModel(
    carName: "Honda",
    carModel: "Honda HR-V",
    carRent: "2500",
    carImg: "assets/images/honda.png",
  ),
  CarsModel(
    carName: "Toyota",
    carModel: "GR Supra",
    carRent: "2000",
    carImg: "assets/images/toyota.png",
  ),
];