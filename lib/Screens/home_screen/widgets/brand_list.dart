import 'package:flutter/material.dart';
import 'package:pny_firebase/Constant/constants.dart';

import '../../../model/car_databse.dart';
import '../../../model/cars_model.dart';
import '../../location/location_map_screen.dart';
import '../home_screen.dart';

class BrandList extends StatefulWidget {
  const BrandList({Key? key}) : super(key: key);

  @override
  State<BrandList> createState() => _BrandListState();
}

class _BrandListState extends State<BrandList> {
  int _brandCategoryIndex = 0;

  var brandList = [
    {
      "name": 'all',
      "icon": "",
    },
    {
      "name": 'tesla',
      "icon": "assets/logos/tesla.png",
    },
    {
      "name": 'audi',
      "icon": "assets/logos/audi.png",
    },
    {
      "name": 'mitsubishi',
      "icon": "assets/logos/mitsubishi.png",
    },
    {
      "name": 'honda',
      "icon": "assets/logos/honda_logo.png",
    },
    {
      "name": 'bmw',
      "icon": "assets/logos/bmw.png",
    },
    {
      "name": 'toyota',
      "icon": "assets/logos/toyota_logo.png",
    },
  ];

  List <String> selectedBrandList = [];
  void setBrandIndex(int currentIndex) {
    setState(() {
      _brandCategoryIndex = currentIndex;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text(
              "Brands",
              style: TextConstants.titleSection,
            ),
          ),
          Container(
            height: 100,
            width: double.infinity,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: brandList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return GestureDetector(
                    onTap: () {

                      setBrandIndex(index);
                      print(brandList[index]["name"]!);
                    },
                    child: BrandItem(
                      imgAsset: brandList[index]["icon"]!,
                      index: 0,
                      isSelected: (_brandCategoryIndex == index) ? true : false,
                    ),
                  );
                } else {
                  return GestureDetector(
                    onTap: () {
                      setBrandIndex(index);
                      print(brandList[index]["name"]!);
                    },
                    child: BrandItem(
                      imgAsset: brandList[index]["icon"]!,
                      index: index,
                      isSelected: (_brandCategoryIndex == index) ? true : false,
                    ),
                  );
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

class BrandItem extends StatefulWidget {
  final String imgAsset;
  final int index;
  final bool isSelected;

  BrandItem({
    required this.imgAsset,
    required this.index,
    required this.isSelected,
  });

  @override
  State<BrandItem> createState() => _BrandItemState();
}

class _BrandItemState extends State<BrandItem> {
  List<CarsModel> data = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: (widget.index == 0)
          ? EdgeInsets.fromLTRB(20, 12, 10, 12)
          : EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      padding: (widget.index == 0)
          ? EdgeInsets.symmetric(horizontal: 25, vertical: 20)
          : EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: (widget.isSelected)
            ? Colors.blue
            : (widget.index == 0)
            ? Colors.black12
            : Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 7, spreadRadius: 0.5),
        ],
      ),
      child: (widget.index == 0)
          ? Center(
        child: Text(
          "All",
          style: TextConstants.titleSection,
        ),
      )
          : Image.asset(
        widget.imgAsset,
        height: 50,
        width: 50,
      ),
    );
  }
}
