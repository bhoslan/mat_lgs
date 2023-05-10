

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TestTrueFalseNumber extends ChangeNotifier {
  int trueNumber1 = 0;
  int falseNumber1 = 0;
  double net = 0;
  bool isShowAnswer1 = false;
  String message = "";

  int get trueNumber => trueNumber1;
  int get falseNumber => falseNumber1;
  double get netNumber => calculateNet();
  bool get isShowAnswer => isShowAnswer1;

  setIsShowAnswer() {
    isShowAnswer1 = !isShowAnswer1;
    notifyListeners();
  }

  void increaseTrueNumber() {
    trueNumber1 = trueNumber1 + 1;
    notifyListeners();
  }

  void increaseFalseNumber() {
    falseNumber1 = falseNumber1 + 1;
    notifyListeners();
  }

  double calculateNet() {
    net = trueNumber1 - falseNumber1 / 4;
    return net;
  }

  resetTest() {
    trueNumber1 = falseNumber1 = 0;
    net = 0;
  }

  String resultMessage() {
    if (net < 1) {
      message = "Bu konuda yetersizsiniz. Oldukça fazla çalışmalısınız.";
    } else if (net >= 1 && net < 4) {
      message = "Bilgi düzeyiniz yeterli değil. Bu konuya daha fazla çalışmanız gerekiyor.";
    } else if (net >= 4 && net <= 5) {
      message = "Bu konuya daha sıkı çalışarak başarılı olabilirsiniz.";
    } else {
      message = "Bu konuda oldukça iyisiniz. Daha çok soru çözerek hız kazanabilirsiniz.";
    }
    return message;
  }

  void saveTestResult() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt("true", trueNumber1);
    prefs.setInt("false", falseNumber1);
    prefs.setDouble("net", netNumber);
  }
}
