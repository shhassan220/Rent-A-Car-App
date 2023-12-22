import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pny_firebase/Constant/constants.dart';
import 'package:pny_firebase/Screens/home_screen/widgets/CarItem.dart';
import '../../model/cars_model.dart';
import 'widgets/brand_list.dart';
import 'widgets/image_slider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final bool isSelected = true;
  final int index = 0;
  final auth = FirebaseAuth.instance;
  int _selectedPageIndex = 0;
  final searchFilterController = TextEditingController();
  List <CarsModel> cars = carList;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.grey.shade100,
          title: Row(
            children: [
              RichText(
                text: TextSpan(
                  style: GoogleFonts.montserrat(
                    fontSize: 24,
                    color: Colors.black87,
                  ),
                  children: [
                    TextSpan(
                      text: 'Choose ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: 'a Car',
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15,),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 7,
                            spreadRadius: 0.5),
                      ],
                    ),
                    child: TextField(
                      controller: searchFilterController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search, color: Colors.black87,),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                      ),
                      cursorColor: Colors.black87,
                      // onChanged: searchCars,
                    ),
                ),
            ),
          ],
        ),
        body: Column(
          children: [
            MyImageSlider(),

            // HorizontalListView(),

            // Brand List Horizontal
            BrandList(),

            // Available Cars Section
            // AvailableCars(),

            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 23),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Available cars",
                          style: TextConstants.titleSection,
                        ),
                        IconButton(
                          onPressed: () {
                            print("filter cars");
                          },
                          icon: Icon(Icons.sort),
                        )
                      ],
                    ),
                    Expanded(
                      child: CarItem(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  // void searchCars (String query){
  //   final suggestion = carList.where((carsModel) {
  //     final carTitle = carsModel.carName.toLowerCase();
  //     final input = query.toLowerCase();
  //     return carTitle.contains(input);
  //   }).toList();
  //
  //   setState(() {
  //     cars = suggestion;
  //   });
  // }
}