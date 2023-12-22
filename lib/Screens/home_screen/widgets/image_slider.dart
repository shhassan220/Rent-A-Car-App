import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MyImageSlider extends StatefulWidget {
  const MyImageSlider({Key? key}) : super(key: key);

  @override
  State<MyImageSlider> createState() => _MyImageSliderState();
}

class _MyImageSliderState extends State<MyImageSlider> {

  final myItems = [
    Image.asset("assets/images/mitsubishi.png"),
    Image.asset("assets/images/tesla_1.png"),
    Image.asset("assets/images/audi.png"),
    Image.asset("assets/images/bmw.png"),
  ];

  int mycurrentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              autoPlay: true,
              height: 120,
              autoPlayCurve: Curves.fastOutSlowIn,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayInterval: Duration(seconds: 2),
              enlargeCenterPage: true,
              aspectRatio: 2,
              onPageChanged: (index, reason){
                setState(() {
                  mycurrentIndex = index;
                });
              }
          ),
          items: myItems,
        ),
        AnimatedSmoothIndicator(
          activeIndex: mycurrentIndex,
          count: myItems.length,
          effect: WormEffect(
            dotHeight: 8,
            dotWidth: 8,
            spacing: 10,
            dotColor: Colors.grey.shade400,
            activeDotColor: Colors.grey.shade900,
            paintStyle: PaintingStyle.fill,
          ),
        ),
      ],
    );
  }
}
