import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../posts/car_book_screen.dart';

class PriceAndBookNow extends StatelessWidget {
  const PriceAndBookNow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(left: 30),
            child: RichText(
              text: TextSpan(
                  style: GoogleFonts.montserrat(
                    fontSize: 20,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    TextSpan(
                      text: '\$100',
                    ),
                    TextSpan(
                      text: '/day',
                      style: TextStyle(
                        color: Colors.black38,
                      ),
                    ),
                  ]
              ),
            ),
          ),
          Container(
            height: 60,
            width: 170,
            child: ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => CarBookScreen()));
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(55),
                  ),
                ),
              ),
              child: Text(
                "Book Now",
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w400,
                    fontSize: 18
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
