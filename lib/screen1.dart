import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobileotp/screen2.dart';
import 'package:mobileotp/screen3.dart';

class Screen1 extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  TextEditingController mobile = TextEditingController();

  String verificationId = "";
  final snackBar = SnackBar(content: Text('Verification Failed!! Try again..'));
  FirebaseAuth _auth = FirebaseAuth.instance;

  mobileLogin() async {
    final PhoneCodeSent smsOTPSent = (String verId, int? forceCodeResend) {
      verificationId = verId;
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Screen2(
                varID: verId,
              )));
    };
    print(mobile.text);
    await _auth.verifyPhoneNumber(
        phoneNumber: '+91' + mobile.text,
        verificationCompleted: (AuthCredential phoneCredential) async {
          print(phoneCredential);
        },
        verificationFailed: (Exception exception) {
          print(exception);
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        timeout: Duration(seconds: 30),
        codeSent: smsOTPSent,
        codeAutoRetrievalTimeout: (String varId) {
          verificationId = varId;
        });
  }

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
                      'Hello! Champion',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 40,
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Container(
                            child: Text(
                              '+91 ',
                              style: TextStyle(fontSize: 25),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 2,
                            child: TextField(
                              maxLength: 10,
                              decoration: InputDecoration(counterText: ''),
                              controller: mobile,
                              style: TextStyle(fontSize: 25),
                              cursorHeight: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        await mobileLogin();
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
                          'Login',
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
                        'Forget Password?',
                        style: TextStyle(color: Colors.white, fontSize: 18),
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
