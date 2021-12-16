import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'Quizbrain.dart';

class Quiz extends StatefulWidget {
  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scorekeeper = [];
  Quizbrain quizbrain = Quizbrain();
  Widget giveAleart(BuildContext context) {
    return AlertDialog(
        title: Text("quiz ended"),
        content: Row(
          children: <Widget>[
            Text('Score : '),
            Text('${quizbrain.getScore}'),
          ],
        ),
        actions: [
          DialogButton(
            onPressed: () {
              setState(() {
                quizbrain.resetQuiz();
                scorekeeper.clear();
                Navigator.of(context).pop();
              });
            },
            child: Text(
              "OK",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]);
  }

  void checkans(bool userans) {
    if (scorekeeper.length >= quizbrain.numberOfQues) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => giveAleart(context)));
    } else {
      bool? correctAnswer = quizbrain.getCorrectAnswer(quizbrain.quesNumber);

      if (userans == correctAnswer) {
        {
          scorekeeper.add(Icon(Icons.check, color: Colors.green));
          quizbrain.increaseScore();
        }
      } else {
        scorekeeper.add(Icon(Icons.close, color: Colors.green));
      }

      setState(() {
        quizbrain.increaseNum();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    '${quizbrain.getQuestionText(quizbrain.quesNumber)}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: FlatButton(
                    textColor: Colors.white,
                    color: Colors.green,
                    child: Text(
                      'True',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    onPressed: () {
                      checkans(true);
                    }),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: FlatButton(
                    color: Colors.red,
                    child: Text(
                      'False',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      checkans(false);
                    }),
              ),
            ),
            Row(
              children: scorekeeper,
            ),
          ],
        ),
        //Signout function below
        // Positioned(
        //   top: 20,
        //   right: 20,
        //   child: GestureDetector(
        //       onTap: () {
        //         FirebaseAuth.instance.signOut();
        //         Navigator.of(context).pop();
        //       },
        //       child: Icon(
        //         Icons.last_page,
        //         color: Colors.red,
        //       )),
        // ),
      ],
    );
  }
}
