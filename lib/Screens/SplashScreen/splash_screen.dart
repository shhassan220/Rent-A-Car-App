
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../firebase_services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  SplashServices splashScreen = SplashServices();
  @override
  void initState() {
    super.initState();
    splashScreen.isLogin(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
                "assets/images/bmw.png",
              height: 350,
              width: 350,
            ),
              Text(
                "Let's Start A New",
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
              Text(
                "Experience",
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
              SizedBox(height: 10,),
              Text(
                "Choose your favourite car, rent it",
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 13,
                ),
              ),
              Text(
                "and enjoy new experience!",
                style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 13,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
