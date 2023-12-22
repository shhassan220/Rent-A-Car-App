import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../../utils/utils.dart';
import '../../widgets/round_button.dart';

class CarBookScreen extends StatefulWidget {
  const CarBookScreen({Key? key}) : super(key: key);

  @override
  State<CarBookScreen> createState() => _CarBookScreenState();
}

class _CarBookScreenState extends State<CarBookScreen> {
  bool loading = false;

  final carBookController = TextEditingController();
  final _dateController = TextEditingController();

  final databaseRef = FirebaseDatabase.instance.ref("Car");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(
            "Book Now",
          style: GoogleFonts.montserrat(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            SizedBox(
              height: 55,
            ),
            TextFormField(
              style: GoogleFonts.montserrat(color: Colors.white),
              controller: carBookController,
              decoration: InputDecoration(
                label: Text(
                  "What is you Name",
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(
                    color: Colors.blue,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 1.0,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              style: GoogleFonts.montserrat(color: Colors.white),
              controller: _dateController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.calendar_today, color: Colors.white,),
                label: Text(
                  "From Your Journey Date",
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(
                    color: Colors.blue,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 1.0,
                  ),
                ),
              ),
              readOnly: true,
              onTap: (){
                _selectDate();
              },
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              style: GoogleFonts.montserrat(color: Colors.white),
              controller: carBookController,
              decoration: InputDecoration(
                label: Text(
                  "What is you mind",
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(
                    color: Colors.blue,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 1.0,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 55,
            ),
            RoundButton(
              title: "Add",
              loading: loading,
              onTap: () {
                setState(() {
                  loading = true;
                });
                String id = DateTime.now().millisecondsSinceEpoch.toString();
                databaseRef.child(id).set({
                  'id': id,
                  'title': carBookController.text.toString(),
                  'date' : _dateController.text.toString(),
                }).then((value) {
                  Utils().toastMessages("Car Booked");
                  setState(() {
                    loading = false;
                  });
                }).onError((error, stackTrace) {
                  Utils().toastMessages(error.toString());
                  setState(() {
                    loading = false;
                  });
                });
              },
            ),
          ],
        ),
      ),
    );
  }
  Future <void> _selectDate() async {
    DateTime? _picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2030),
    );
    if(_picked != null){
      setState(() {
        _dateController.text = _picked.toString().split(" ")[0];
      });
    }
  }
}
