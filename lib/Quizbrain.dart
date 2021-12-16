import 'question.dart';

class Quizbrain {
  int _questionNum = 0;
  int _score = 0;
  List<Question> _ques = [
    Question(
        q: 'Is cloud computing allow renting infrastructure,run time environment and service pay per  use.',
        a: true),
    Question(q: 'Is IaaS , SaaS ,  PaaS is cloud computing services', a: true),
    Question(
        q: 'Is Grid computing uses the available resource and interconnected computer system to accomplish  a common goal',
        a: true),
    Question(q: 'IS cloud computing is not a centralized model', a: false),
    Question(
        q: 'In order to Achive goal ,is distribued system connected to each other',
        a: true),
    Question(q: '', a: true),
    Question(q: 'In general SOA is  about to design software sysytem', a: true),
  ];

  void nextQuestion() {
    if (_questionNum < _ques.length - 1) {
      _questionNum++;
    }
  }

  get quesNumber => _questionNum;
  get numberOfQues => _ques.length;
  get getScore => _score;
  void increaseNum() {
    if (_questionNum < _ques.length - 1) _questionNum++;
  }

  void resetQuiz() {
    _questionNum = 0;
    _score = 0;
  }

  void increaseScore() {
    _score++;
  }

  bool wasLast() {
    if (_questionNum >= _ques.length) return true;
    return false;
  }

  String? getQuestionText(int questionNum) {
    return _ques[_questionNum].questionText;
  }

  bool? getCorrectAnswer(int quesetionNum) {
    return _ques[_questionNum].questionAnswer;
  }
}
