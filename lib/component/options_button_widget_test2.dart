import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/test_true_false_number2.dart';

class OptionsButtonWidgetTest2 extends StatefulWidget {
  final String correctAnswer;
  final String questionNumber;
  const OptionsButtonWidgetTest2({
    Key? key,
    required this.correctAnswer,
    required this.questionNumber,
  }) : super(key: key);

  @override
  State<OptionsButtonWidgetTest2> createState() => _OptionsButtonWidgetTest2State();
}

class _OptionsButtonWidgetTest2State extends State<OptionsButtonWidgetTest2> {
  String choosingOption = "";
  bool isSelected = false;
  Color containerColorA = Colors.black;
  Color containerColorB = Colors.black;
  Color containerColorC = Colors.black;
  Color containerColorD = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Consumer<TestTrueFalseNumber2>(
      builder: (context, providerObject, child) => Row(
        children: [
          Text(
            "${widget.questionNumber}) ",
            style: const TextStyle(color: Colors.black),
          ),
          Container(
            color: containerColorA,
            width: 30,
            height: 30,
            child: Consumer<TestTrueFalseNumber2>(builder: (context, nesne, child) {
              return TextButton(
                onPressed: isSelected
                    ? null
                    : () {
                        choosingOption = "A";
                        isSelected = true;
                        if (widget.correctAnswer == choosingOption) {
                          providerObject.increaseTrueNumber2();
                          containerColorA = Colors.green;
                        } else {
                          providerObject.increaseFalseNumber2();
                          containerColorA = Colors.red;
                        }

                        if (kDebugMode) {
                          print("Doğru :${providerObject.trueNumber} Yanlış :${providerObject.falseNumber2}");
                        }
                      },
                child: const Text(
                  "A",
                  style: TextStyle(color: Colors.white),
                ),
              );
            }),
          ),
          const SizedBox(
            width: 5,
            height: 30,
          ),
          Container(
            color: containerColorB,
            width: 30,
            height: 30,
            child: Consumer<TestTrueFalseNumber2>(builder: (context, nesne, child) {
              return TextButton(
                  onPressed: isSelected
                      ? null
                      : () {
                          choosingOption = "B";
                          isSelected = true;
                          if (widget.correctAnswer == choosingOption) {
                            nesne.increaseTrueNumber2();

                            containerColorB = Colors.green;
                          } else {
                            nesne.increaseFalseNumber2();

                            containerColorB = Colors.red;
                          }

                          if (kDebugMode) {
                            print("Doğru :${nesne.trueNumber} Yanlış :${nesne.falseNumber2}");
                          }
                        },
                  child: const Text(
                    "B",
                    style: TextStyle(color: Colors.white),
                  ));
            }),
          ),
          const SizedBox(
            width: 5,
            height: 30,
          ),
          Container(
            color: containerColorC,
            width: 30,
            height: 30,
            child: Consumer<TestTrueFalseNumber2>(builder: (context, nesne, child) {
              return TextButton(
                  onPressed: isSelected
                      ? null
                      : () {
                          choosingOption = "C";
                          isSelected = true;
                          if (widget.correctAnswer == choosingOption) {
                            nesne.increaseTrueNumber2();
                            containerColorC = Colors.green;
                          } else {
                            nesne.increaseFalseNumber2();
                            setState(() {
                              containerColorC = Colors.red;
                            });
                          }

                          if (kDebugMode) {
                            print("Doğru :${nesne.trueNumber} Yanlış :${nesne.falseNumber2}");
                          }
                        },
                  child: const Text(
                    "C",
                    style: TextStyle(color: Colors.white),
                  ));
            }),
          ),
          const SizedBox(
            width: 5,
            height: 30,
          ),
          Container(
            color: containerColorD,
            width: 30,
            height: 30,
            child: Consumer<TestTrueFalseNumber2>(builder: (context, nesne, child) {
              return TextButton(
                  onPressed: isSelected
                      ? null
                      : () {
                          choosingOption = "D";
                          isSelected = true;
                          if (widget.correctAnswer == choosingOption) {
                            nesne.increaseTrueNumber2();
                            containerColorD = Colors.green;
                          } else {
                            nesne.increaseFalseNumber2();
                            containerColorD = Colors.red;
                          }

                          if (kDebugMode) {
                            print("Doğru :${nesne.trueNumber} Yanlış :${nesne.falseNumber2}");
                          }
                        },
                  child: const Text(
                    "D",
                    style: TextStyle(color: Colors.white),
                  ));
            }),
          ),
        ],
      ),
    );
  }
}
