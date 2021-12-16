import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobileotp/mainquiz.dart';

class Screen1 extends StatefulWidget {
  @override
  _Screen1State createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  TextEditingController mobile = TextEditingController();
  TextEditingController otp = TextEditingController();

  String verificationId = "";
  final snackBar = SnackBar(content: Text('Verification Failed!! Try again..'));
  FirebaseAuth _auth = FirebaseAuth.instance;

  mobileLogin() async {
    final PhoneCodeSent smsOTPSent = (String verId, int? forceCodeResend) {
      verificationId = verId;
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Container(
          child: Column(
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/background.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 210,
                  width: 80,
                  height: 190,
                  child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                    image: AssetImage('images/clock.png'),
                  ))),
                ),
                Positioned(
                  width: 80,
                  height: 200,
                  left: 20,
                  child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                    image: AssetImage('images/light-1.png'),
                  ))),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            child: Form(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        suffix: GestureDetector(
                          onTap: () {
                            mobileLogin();
                          },
                          child: Icon(Icons.add_to_home_screen_outlined),
                        ),
                        hintText: "+91 ",
                        labelText: "PHONE NUMBER",
                        labelStyle: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                        ),
                        prefixIcon: Icon(Icons.phone),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      controller: mobile,
                      maxLength: 10,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter Otp Here ",
                        labelText: "ENTER OTP",
                        labelStyle: TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                        ),
                        prefixIcon: Icon(Icons.security),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      obscureText: true,
                      maxLength: 10,
                      controller: otp,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        PhoneAuthCredential credential =
                            PhoneAuthProvider.credential(
                                verificationId: verificationId,
                                smsCode: otp.text);
                        try {
                          await _auth.signInWithCredential(credential);
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => Quiz()));
                        } catch (e) {
                          print(e);
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      },
                      child: Text(
                        'SUBMIT',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        await mobileLogin();
                      },
                      child: Text(
                        'RESEND ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}

//SafeArea(
//       child: Scaffold(
//         body: Column(
//           mainAxisSize: MainAxisSize.max,
//           children: [
//             Expanded(
//               flex: 1,
//               child: Container(
//                 width: double.infinity,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Container(
//                       height: 50,
//                     ),
//                     Text(
//                       'LOGIN QUIZZER',
//                       style: TextStyle(
//                         fontSize: 30,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                     Container(
//                       width: double.infinity,
//                       height: 40,
//                       margin: EdgeInsets.symmetric(horizontal: 30),
//                       padding: EdgeInsets.symmetric(horizontal: 30),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: Row(
//                         children: [
//                           Container(
//                             child: Text(
//                               '+91 ',
//                               style: TextStyle(fontSize: 25),
//                             ),
//                           ),
//                           Container(
//                             width: MediaQuery.of(context).size.width / 2,
//                             child: TextField(
//                               maxLength: 10,
//                               decoration: InputDecoration(counterText: ''),
//                               controller: mobile,
//                               style: TextStyle(fontSize: 25),
//                               cursorHeight: 2,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () async {
//                         await mobileLogin();
//                       },
//                       child: Container(
//                         alignment: Alignment.center,
//                         width: double.infinity,
//                         height: 40,
//                         margin: EdgeInsets.symmetric(horizontal: 30),
//                         padding: EdgeInsets.symmetric(horizontal: 30),
//                         decoration: BoxDecoration(
//                           color: Color(0xFFF2B917),
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         child: Text(
//                           'Login',
//                           style: TextStyle(
//                             fontSize: 25,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 decoration: BoxDecoration(
//                   color: Color(0xffD4113F),
//                   borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(50),
//                     bottomRight: Radius.circular(50),
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(flex: 1, child: Container()),
//           ],
//         ),
//       ),
//     );
//   }
// }
