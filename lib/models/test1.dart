import 'package:flutter/cupertino.dart';
import 'package:mat_lgs/models/option.dart';
import 'package:mat_lgs/models/question.dart';

final test1 = [
  Question(
    id: 1,
    imagePath: "assets/images/advice.png",
    options: [
      Option(code: "A", text: "12", answerOption: 1),
      Option(code: "B", text: "13", answerOption: 2),
      Option(code: "C", text: "14", answerOption: 3),
      Option(code: "D", text: "15", answerOption: 4)
    ],
    solution: "Cevabı bla bla olmalıdır.",
    answerOption: 1,
  ),
  Question(
    id: 2,
    imagePath: "assets/images/dart.png",
    options: [
      Option(code: "A", text: "2", answerOption: 1),
      Option(code: "B", text: "3", answerOption: 2),
      Option(code: "C", text: "4", answerOption: 3),
      Option(code: "D", text: "5", answerOption: 4)
    ],
    solution: "Cevabı bla bla olmalıdır.",
    answerOption: 2,
  )
];
