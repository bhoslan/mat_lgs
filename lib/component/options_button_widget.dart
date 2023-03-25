import 'package:flutter/material.dart';

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
  int trueNumber = 0;
  int falseNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "${widget.questionNumber}) ",
          style: const TextStyle(color: Colors.black),
        ),
        Container(
          color: containerColorA,
          width: 30,
          height: 30,
          child: TextButton(
              onPressed: isSelected
                  ? null
                  : () {
                      choosingOption = "A";
                      isSelected = true;
                      if (widget.correctAnswer == choosingOption) {
                        trueNumber = trueNumber + 1;
                      } else {
                        falseNumber = falseNumber + 1;
                      }
                      print("true: $trueNumber");
                      print("false:$falseNumber");
                      setState(() {
                        containerColorA = Colors.blue;
                      });
                    },
              child: const Text(
                "A",
                style: TextStyle(color: Colors.white),
              )),
        ),
        const SizedBox(
          width: 5,
          height: 30,
        ),
        Container(
            color: containerColorB,
            width: 30,
            height: 30,
            child: TextButton(
                onPressed: isSelected
                    ? null
                    : () {
                        choosingOption = "B";
                        isSelected = true;

                        if (widget.correctAnswer == choosingOption) {
                          trueNumber = trueNumber + 1;
                        } else {
                          falseNumber = falseNumber + 1;
                        }
                        print("true: $trueNumber");
                        print("false:$falseNumber");
                        setState(() {
                          containerColorB = Colors.blue;
                        });
                      },
                child: const Text(
                  "B",
                  style: TextStyle(color: Colors.white),
                ))),
        const SizedBox(
          width: 5,
          height: 30,
        ),
        Container(
            color: containerColorC,
            width: 30,
            height: 30,
            child: TextButton(
                onPressed: isSelected
                    ? null
                    : () {
                        choosingOption = "C";
                        isSelected = true;
                        setState(() {
                          containerColorC = Colors.blue;
                        });
                      },
                child: const Text(
                  "C",
                  style: TextStyle(color: Colors.white),
                ))),
        const SizedBox(
          width: 5,
          height: 30,
        ),
        Container(
          color: containerColorD,
          width: 30,
          height: 30,
          child: TextButton(
            onPressed: isSelected
                ? null
                : () {
                    choosingOption = "D";
                    isSelected = true;
                    setState(() {
                      containerColorD = Colors.blue;
                    });
                  },
            child: const Text(
              "D",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
