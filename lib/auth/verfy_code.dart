import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Screens/home_screen/home_screen.dart';
import '../Screens/posts/history_screen.dart';
import '../utils/utils.dart';
import '../widgets/round_button.dart';


class VerifyCodeScreen extends StatefulWidget {
  final String verificationId;
  const VerifyCodeScreen({Key? key, required this.verificationId})
      : super(key: key);

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  bool loading = false;
  final VerifyCodeController = TextEditingController();
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Verify"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 21),
        child: Column(
          children: [
            SizedBox(
              height: 75,
            ),
            TextFormField(
              controller: VerifyCodeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: "6 Digit Code",
              ),
            ),
            SizedBox(
              height: 75,
            ),
            RoundButton(title: "Verify", loading: loading, onTap: () async {
              setState(() {
                loading = true;
              });
              final credential = PhoneAuthProvider.credential(
                  verificationId: widget.verificationId,
                  smsCode: VerifyCodeController.text.toString());
              try{

                await auth.signInWithCredential(credential);
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
              }
                  catch(e){
                    setState(() {
                      loading = false;
                    });
                    Utils().toastMessages(e.toString());
                  }
            }),
          ],
        ),
      ),
    );
  }
}
