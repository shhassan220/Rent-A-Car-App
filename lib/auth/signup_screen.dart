import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/utils.dart';
import '../widgets/round_button.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  bool isShowPassword = true;
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  bool loading = false;
  File? _image;
  final picker = ImagePicker();
  final _formField = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passordController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;
  // final auth = FirebaseAuth.instance;
  // DatabaseReference databaseRef = FirebaseDatabase.instance.ref('Post');
  final carBookController = TextEditingController();

  final databaseRef = FirebaseDatabase.instance.ref("Car");
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passordController.dispose();
  }

  void signUp() {
    setState(() {
      loading = true;
    });
    _auth
        .createUserWithEmailAndPassword(
            email: emailController.text.toString(),
            password: passordController.text.toString())
        .then((value) {
      setState(() {
        loading = false;
      });
    }).onError((error, stackTrace) {
      Utils().toastMessages(error.toString());
      setState(() {
        loading = false;
      });
    });
  }

  Future getGalleryImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No Picked Image');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(
          "Create An Account",
          style: GoogleFonts.montserrat(),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 60,
          ),
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                getGalleryImage();
                              },
                              child: Stack(
                                children: [
                                  Center(
                                    child: CircleAvatar(
                                      radius: 50.0,
                                      backgroundColor: Colors.white,
                                      child: (_image != null)
                                          ? Container(
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                    image: FileImage(
                                                        _image!.absolute),
                                                    fit: BoxFit.fill),
                                              ),
                                            )
                                          : Center(
                                              child: Icon(
                                              Icons.image,
                                              size: 45,
                                            )),
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                        ),
                                        label: Text(
                                          "Email",
                                          style: GoogleFonts.montserrat(
                                              color: Colors.white),
                                        ),
                                        prefixIcon: Icon(
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
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                        ),
                                        label: Text(
                                          "Password",
                                          style: GoogleFonts.montserrat(
                                            color: Colors.white,
                                          ),
                                        ),
                                        prefixIcon: Icon(
                                          Icons.key_outlined,
                                          color: Colors.white,
                                        ),
                                        suffixIcon: CupertinoButton(
                                          onPressed: (){
                                            setState(() {
                                              isShowPassword =! isShowPassword;
                                            });
                                          },
                                          padding: EdgeInsets.zero,
                                          child: Icon(
                                            Icons.remove_red_eye,
                                            color: Colors.white,
                                          ),
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
                              title: "Sign Up",
                              loading: loading,
                              onTap: () {
                                if (_formField.currentState!.validate()) {
                                  signUp();
                                }
                                setState(() {
                                  loading = true;
                                });
                                firebase_storage.Reference ref = firebase_storage
                                    .FirebaseStorage.instance
                                    .ref('/hassan/' +
                                        DateTime.now()
                                            .millisecondsSinceEpoch
                                            .toString());
                                firebase_storage.UploadTask uploadTask =
                                    ref.putFile(_image!.absolute);
                                Future.value(uploadTask).then((value) async {
                                  var newUrl = await ref.getDownloadURL();
                                  databaseRef.child('1').set({
                                    'id': '13131',
                                    'title': newUrl.toString(),
                                  }).then((value) {
                                    setState(() {
                                      loading = false;
                                    });
                                    Utils().toastMessages("Uploaded");
                                  }).onError((error, stackTrace) {
                                    setState(() {
                                      loading = false;
                                    });
                                  });
                                }).onError((error, stackTrace) {
                                  Utils().toastMessages(error.toString());
                                });
                              },
                            ),
                            SizedBox(
                              height: 21,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Already have an account?",
                                  style:
                                      GoogleFonts.montserrat(color: Colors.white),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LoginScreen()));
                                  },
                                  child: Text("Login"),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
