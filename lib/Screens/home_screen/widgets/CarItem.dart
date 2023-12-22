import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pny_firebase/model/car_databse.dart';
import 'package:pny_firebase/model/cars_model.dart';

import '../../DetailCars/detail_cars_screen.dart';


class CarItem extends StatefulWidget {
  @override
  State<CarItem> createState() => _CarItemState();
}

class _CarItemState extends State<CarItem> {
  List <String> selectedBrandList = [];

  @override
  Widget build(BuildContext context) {
    final filterCars = carList.where((CarsModel) {
      return selectedBrandList.isEmpty ||
          selectedBrandList.contains(CarsModel.carName);
    }).toList();
    return ListView.builder(
        physics: BouncingScrollPhysics(),
    itemCount: carList.length,
    itemBuilder: (context, index) {
      final carsModel = filterCars[index];
      // CarsModel temp = data[index];
      return Container(
        height: 200,
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              top: 30,
                right: 0,
                left: 0,
                child: Container(
                  padding: EdgeInsets.only(
                      left: 20,
                    top: 20,
                  ),
                  margin: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 0.5,
                        blurRadius: 15,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 15),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                                carsModel.carName,
                              style: GoogleFonts.montserrat(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              carsModel.carModel,
                              style: GoogleFonts.montserrat(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.black38,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RichText(
                              text: TextSpan(
                                style: GoogleFonts.montserrat(
                                  fontSize: 16,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w500,
                                ),
                                children: [
                                  TextSpan(
                                    text: carsModel.carRent,
                                    // ("\$100"),
                                  ),
                                  TextSpan(
                                    text: '/day',
                                    style: TextStyle(
                                      color: Colors.black38,
                                    ),
                                  ),
                                ],
                              ),
                          ),
                          Container(
                            height: 50,
                            width: 130,
                            child: ElevatedButton(
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => DetailCarsScreen(

                                  )));
                                },
                                child: Text(
                                  "Details",
                                  style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18,
                                  ),
                                ),
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
            ),
            Positioned(
              top: 25,
                left: 10,
                child: Image.asset(
                    carsModel.carImg,
                  height: 120,
                  width: 140,
                ),
            ),
          ],
        ),
      );
    }
    );
  }
}
