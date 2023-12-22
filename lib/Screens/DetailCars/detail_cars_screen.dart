import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pny_firebase/Constant/constants.dart';
import 'package:pny_firebase/Screens/DetailCars/widgets/location.dart';
import 'package:pny_firebase/Screens/DetailCars/widgets/price_and_book_now.dart';
import 'package:pny_firebase/model/cars_model.dart';

import 'widgets/specifications.dart';
import 'widgets/top_menu_and _showcase.dart';

class DetailCarsScreen extends StatefulWidget {
  @override
  State<DetailCarsScreen> createState() => _DetailCarsScreenState();
}

class _DetailCarsScreenState extends State<DetailCarsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.black87,
        title: IconButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            icon: Icon(
                Icons.arrow_back_ios_outlined,
              color: Colors.white60,
              size: 30,
            ),
        ),
        actions: [
          IconButton(
            onPressed: (){},
              icon: Icon(
                Icons.more_horiz_outlined,
                color: Colors.white60,
                size: 30,
              ),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopMenuAndShowCase(),
            SizedBox(
              height: 25,
            ),
            Specifications(),
            Location(),
            SizedBox(height: 65,),
          ],
        ),
      ),
      bottomSheet: PriceAndBookNow(),
    );
  }
}

