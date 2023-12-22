import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pny_firebase/Screens/home_screen/home_screen.dart';
import 'package:pny_firebase/auth/signup_screen.dart';

import '../Screens/DynamicScreen/dynamic.dart';
import '../Screens/ForgotPasswordScreen/forgot_password_screen.dart';
import '../Screens/posts/history_screen.dart';
import '../utils/utils.dart';
import '../widgets/round_button.dart';
import 'login_with_phone_number.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isShowPassword = true;
  bool loading = false;
  final _formField = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passordController = TextEditingController();

  final _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passordController.dispose();
  }

  void login() {
    setState(() {
      loading = true;
    });
    _auth
        .signInWithEmailAndPassword(
            email: emailController.text.toString(),
            password: passordController.text.toString())
        .then((value) {
      Utils().toastMessages(value.user!.email.toString());
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => DynamicScreen()));
      setState(() {
        loading = false;
      });
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
      Utils().toastMessages(error.toString());
    });
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          title: Text(
            "Login",
            style: GoogleFonts.montserrat(),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: Column(
          children: [
            SizedBox(height: 60,),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Stack(
                    children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SingleChildScrollView(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment:
                              CrossAxisAlignment.center,
                          children: [
                            Form(
                                key: _formField,
                                child: Column(
                                  children: [
                                    TextFormField(
                                      style: GoogleFonts.montserrat(color: Colors.white),
                                      cursorColor: Colors.white,
                                      keyboardType: TextInputType.emailAddress,
                                      controller: emailController,
                                      decoration: InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Colors.white),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Colors.white),
                                        ),
                                          label: Text(
                                            "Email",
                                            style: GoogleFonts
                                                .montserrat(color: Colors.white),
                                          ),
                                          prefixIcon:
                                              Icon(
                                                Icons.mail,
                                                color: Colors.white,
                                              ),
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Enter Email";
                                        }
                                        return null;
                                      },
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    TextFormField(
                                      style: GoogleFonts.montserrat(color: Colors.white),
                                      keyboardType: TextInputType.text,
                                      controller: passordController,
                                      obscureText: isShowPassword,
                                      decoration: InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Colors.white),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(color: Colors.white),
                                        ),
                                        label: Text(
                                            "Password",
                                          style: GoogleFonts.montserrat(
                                            color: Colors.white,
                                          ),
                                        ),
                                        prefixIcon:
                                            Icon(Icons.key_outlined, color: Colors.white,),
                                        suffixIcon: CupertinoButton(
                                          onPressed: (){
                                            setState(() {
                                              isShowPassword =! isShowPassword;
                                            });
                                          },
                                          padding: EdgeInsets.zero,
                                          child: Icon(
                                              Icons.remove_red_eye, color: Colors.white,),
                                        ),
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Enter Password";
                                        }
                                        return null;
                                      },
                                    ),
                                  ],
                                )),
                            SizedBox(
                              height: 25,
                            ),
                            RoundButton(
                              title: "Login",
                              loading: loading,
                              onTap: () {
                                if (_formField.currentState!
                                    .validate()) {
                                  login();
                                }
                              },
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ForgotPasswordScreen()));
                                },
                                child: Text("Forgot Password?", style: GoogleFonts.montserrat(color: Colors.white),),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.center,
                              children: [
                                Text("Don't have an account?", style: GoogleFonts.montserrat(color: Colors.white ),),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SignupScreen()));
                                  },
                                  child: Text("Sign up"),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 31,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            LoginWithPhoneNumber()));
                              },
                              child: Container(
                                height: 45,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.circular(51),
                                  border: Border.all(
                                    color: Colors.white,
                                  ),
                                ),
                                child: Center(
                                  child:
                                      Text(
                                          "Login with Phone Number",
                                        style: GoogleFonts.montserrat(
                                          color: Colors.white,
                                        ),
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
