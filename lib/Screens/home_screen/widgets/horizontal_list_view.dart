import 'package:flutter/material.dart';

class HorizontalListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: ListView(
        scrollDirection: Axis.horizontal,
            children: [
              Category(
              "assets/logos/audi.png"
                ),
              Category(
                "assets/logos/bmw.png"
              ),
              Category(
                "assets/logos/mitsubishi.png"
              ),
              Category(
                "assets/logos/tesla.png"
              ),
            ],
        ),
          // Image(image: AssetImage("assets/images/person.jpg",))
    );
  }
}

class Category extends StatelessWidget {
  final String image_location;
  Category(
    this.image_location,);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(5),
      child: Container(
        width: 100,
        child: Image.asset(image_location,),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade500,
              offset: Offset(0, 2),
              blurRadius: 7
            ),
          ],
        ),
        ),
    );
  }
}
