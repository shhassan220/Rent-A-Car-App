import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/utils.dart';
import '../../widgets/round_button.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final emailEditingController = TextEditingController();
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black87,
        centerTitle: true,
        title: Text("Enter Your Email"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              style: GoogleFonts.montserrat(color: Colors.white),
              cursorColor: Colors.white,
              controller: emailEditingController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 2.0,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                prefixIcon: Icon(Icons.mail, color: Colors.white,),
                label: Text(
                  "Email",
                  style: GoogleFonts.montserrat(
                    color: Colors.white
                  ),
                ),
                // focusedBorder: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(20.0),
                //   borderSide: BorderSide(
                //     color: Colors.blue,
                //   ),
                // ),

                  // enabledBorder: UnderlineInputBorder(
                  //   borderSide: BorderSide(color: Colors.white),
                  // ),
                  // focusedBorder: UnderlineInputBorder(
                  //   borderSide: BorderSide(color: Colors.white),
                  // ),
              ),
            ),
            SizedBox(
              height: 41,
            ),
            RoundButton(title: "Reset Password",
                onTap: (){
              auth.sendPasswordResetEmail(email: emailEditingController.text.toString()).then((value){
                Utils().toastMessages("We have sent you email to recover password, Please check your email");
              }).onError((error, stackTrace){
                Utils().toastMessages(error.toString());
              });
                },
            ),
          ],
        ),
      ),
    );
  }
}
