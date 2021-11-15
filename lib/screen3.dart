import 'package:flutter/material.dart';

class Screen3 extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _Screen3State createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController examName = TextEditingController();
  TextEditingController schoolName = TextEditingController();
  TextEditingController clas = TextEditingController();
  TextEditingController dateOfBirth = TextEditingController();

  final snackBar = SnackBar(content: Text('Submitted Successfully!!'));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: 10,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 5,
                      decoration: BoxDecoration(
                        color: Color(0xFFF2B917),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 5,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'Basic Details',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xffD4113F),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(60),
                      bottomRight: Radius.circular(60),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height / 5 * 3.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 40,
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Opacity(
                      opacity: 0.3,
                      child: TextField(
                        textAlign: TextAlign.left,
                        decoration: new InputDecoration.collapsed(
                          hintText: 'Name',
                        ),
                        controller: name,
                        style: TextStyle(fontSize: 25),
                        cursorHeight: 2,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 40,
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Opacity(
                      opacity: 0.3,
                      child: TextField(
                        textAlign: TextAlign.left,
                        decoration: new InputDecoration.collapsed(
                          hintText: 'Date of Birth',
                        ),
                        controller: dateOfBirth,
                        style: TextStyle(fontSize: 25),
                        cursorHeight: 2,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 40,
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Opacity(
                      opacity: 0.3,
                      child: TextField(
                        textAlign: TextAlign.left,
                        decoration: new InputDecoration.collapsed(
                          hintText: 'Email',
                        ),
                        controller: email,
                        style: TextStyle(fontSize: 25),
                        cursorHeight: 2,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 40,
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Opacity(
                      opacity: 0.3,
                      child: TextField(
                        textAlign: TextAlign.left,
                        decoration: new InputDecoration.collapsed(
                          hintText: 'Exam Name',
                        ),
                        controller: examName,
                        style: TextStyle(fontSize: 25),
                        cursorHeight: 2,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 40,
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Opacity(
                      opacity: 0.3,
                      child: TextField(
                        textAlign: TextAlign.left,
                        decoration: new InputDecoration.collapsed(
                          hintText: 'School Name',
                        ),
                        controller: schoolName,
                        style: TextStyle(fontSize: 25),
                        cursorHeight: 2,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 40,
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Opacity(
                      opacity: 0.3,
                      child: TextField(
                        textAlign: TextAlign.left,
                        decoration:
                            new InputDecoration.collapsed(hintText: 'Class'),
                        controller: clas,
                        style: TextStyle(fontSize: 25),
                        cursorHeight: 2,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
