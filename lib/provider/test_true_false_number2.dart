import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TestTrueFalseNumber2 extends ChangeNotifier {
  int trueNumber2 = 0;
  int falseNumber2 = 0;
  double net = 0;
  bool isShowAnswer2 = false;
  String message = "";
  bool isTest2Finished = false;

  int get trueNumber => trueNumber2;
  int get falseNumber => falseNumber2;
  double get netNumber => calculateNet2();
  bool get isShowAnswer => isShowAnswer2;

  setIsShowAnswer2() {
    isShowAnswer2 = !isShowAnswer2;
    notifyListeners();
  }

  void increaseTrueNumber2() {
    trueNumber2 = trueNumber2 + 1;
    notifyListeners();
  }

  void increaseFalseNumber2() {
    falseNumber2 = falseNumber2 + 1;
    notifyListeners();
  }

  double calculateNet2() {
    net = double.parse((trueNumber2 - falseNumber2 / 3).toStringAsFixed(2));
    return net;
  }

  resetTest2() {
    trueNumber2 = falseNumber2 = 0;
    net = 0;
  }

  String resultMessage2() {
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

  void saveTestResult2() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt("true2", trueNumber2);
    prefs.setInt("false2", falseNumber2);
    prefs.setDouble("net2", netNumber);
  }
}
