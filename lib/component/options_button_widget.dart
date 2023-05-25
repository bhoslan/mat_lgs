import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mat_lgs/provider/test_true_false_number.dart';
import 'package:provider/provider.dart';

class OptionsButtonWidget extends StatefulWidget {
  final String correctAnswer;
  final String questionNumber;
  const OptionsButtonWidget({
    Key? key,
    required this.correctAnswer,
    required this.questionNumber,
  }) : super(key: key);

  @override
  State<OptionsButtonWidget> createState() => _OptionsButtonWidgetState();
}

class _OptionsButtonWidgetState extends State<OptionsButtonWidget> {
  String choosingOption = "";
  bool isSelected = false;
  Color containerColorA = Colors.black;
  Color containerColorB = Colors.black;
  Color containerColorC = Colors.black;
  Color containerColorD = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Consumer<TestTrueFalseNumber>(
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
            child: Consumer<TestTrueFalseNumber>(builder: (context, nesne, child) {
              return TextButton(
                onPressed: isSelected
                    ? null
                    : () {
                        choosingOption = "A";
                        isSelected = true;
                        if (widget.correctAnswer == choosingOption) {
                          providerObject.increaseTrueNumber();
                          containerColorA = Colors.green;
                        } else {
                          providerObject.increaseFalseNumber();
                          containerColorA = Colors.red;
                        }

                        if (kDebugMode) {
                          print("Doğru :${providerObject.trueNumber} Yanlış :${providerObject.falseNumber1}");
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
            child: Consumer<TestTrueFalseNumber>(builder: (context, nesne, child) {
              return TextButton(
                  onPressed: isSelected
                      ? null
                      : () {
                          choosingOption = "B";
                          isSelected = true;
                          if (widget.correctAnswer == choosingOption) {
                            nesne.increaseTrueNumber();

                            containerColorB = Colors.green;
                          } else {
                            nesne.increaseFalseNumber();

                            containerColorB = Colors.red;
                          }

                          if (kDebugMode) {
                            print("Doğru :${nesne.trueNumber} Yanlış :${nesne.falseNumber1}");
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
            child: Consumer<TestTrueFalseNumber>(builder: (context, nesne, child) {
              return TextButton(
                  onPressed: isSelected
                      ? null
                      : () {
                          choosingOption = "C";
                          isSelected = true;
                          if (widget.correctAnswer == choosingOption) {
                            nesne.increaseTrueNumber();
                            containerColorC = Colors.green;
                          } else {
                            nesne.increaseFalseNumber();
                            setState(() {
                              containerColorC = Colors.red;
                            });
                          }

                          if (kDebugMode) {
                            print("Doğru :${nesne.trueNumber} Yanlış :${nesne.falseNumber1}");
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
            child: Consumer<TestTrueFalseNumber>(builder: (context, nesne, child) {
              return TextButton(
                  onPressed: isSelected
                      ? null
                      : () {
                          choosingOption = "D";
                          isSelected = true;
                          if (widget.correctAnswer == choosingOption) {
                            nesne.increaseTrueNumber();
                            containerColorD = Colors.green;
                          } else {
                            nesne.increaseFalseNumber();
                            containerColorD = Colors.red;
                          }

                          if (kDebugMode) {
                            print("Doğru :${nesne.trueNumber} Yanlış :${nesne.falseNumber1}");
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
