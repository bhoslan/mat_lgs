import '../models/true_false_question.dart';

class TrueFalseQuestions1 {
  int _questionNumber = 0;
  final List<TrueFalseQuestion> _questions = [
    TrueFalseQuestion("En küçük asal sayı 2'dir.", true),
    TrueFalseQuestion("Bir sayının çarpanları o sayının bölenleridir.", true),
    TrueFalseQuestion("Aralarında asal olan iki sayının EBOB'u büyük olana eşittir.", false),
    TrueFalseQuestion("Birbirinin katı olan sayılarda küçük olan sayı EBOB, büyük olan sayı EKOK'tur.", true),
    TrueFalseQuestion("İki basamaklı 21 tane asal sayı vardır.", false),
    TrueFalseQuestion("İki basamaklı en büyük asal sayı 97'dir", true),
    TrueFalseQuestion("İki sayının çarpımı EBOB'u ile EKOK'unun çarpımına eşittir.", true),
  ];

  String getQuestion() {
    return _questions[_questionNumber].question;
  }

  void getNextQuestion() {
    if (_questionNumber < _questions.length - 1) {
      _questionNumber++;
    }
  }

  bool getCorrectAnswer() {
    return _questions[_questionNumber].answer;
  }

  bool isFinished() {
    if (_questionNumber >= _questions.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
}
