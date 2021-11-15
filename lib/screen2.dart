import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobileotp/screen1.dart';
import 'package:mobileotp/screen3.dart';

class Screen2 extends StatefulWidget {
  String varID;
  Screen2({required this.varID});

  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  final snackBar =
      SnackBar(content: Text('Wrong OTP or OTP expired!! Try again..'));
  TextEditingController otp = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 50,
                    ),
                    Text(
                      'Enter OTP',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 40,
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Opacity(
                        opacity: 0.3,
                        child: TextField(
                          textAlign: TextAlign.left,
                          decoration: new InputDecoration.collapsed(
                            hintText: 'Enter OTP',
                          ),
                          controller: otp,
                          style: TextStyle(fontSize: 25),
                          cursorHeight: 2,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        PhoneAuthCredential credential =
                            PhoneAuthProvider.credential(
                                verificationId: widget.varID,
                                smsCode: otp.text);
                        try {
                          await _auth.signInWithCredential(credential);
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => Screen3()));
                        } catch (e) {
                          print(e);
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: 40,
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        decoration: BoxDecoration(
                          color: Color(0xFFF2B917),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          'Submit',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Haven't received OTP?\nResend",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  color: Color(0xffD4113F),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
              ),
            ),
            Expanded(flex: 1, child: Container()),
          ],
        ),
      ),
    );
  }
}
