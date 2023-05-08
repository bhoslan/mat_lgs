// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mat_lgs/models/option.dart';

class Question {
  final int id;
  final String imagePath;
  final List<Option> options;
  final String solution;
  bool isLocked;
  int answerOption;
  Option? selectedOption = Option(code: "code", text: "text", answerOption: 0);
  Question({
    required this.id,
    required this.imagePath,
    required this.options,
    required this.solution,
    this.isLocked = false,
    required this.answerOption,
  });
}
