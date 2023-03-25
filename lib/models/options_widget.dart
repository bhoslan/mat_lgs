// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:mat_lgs/models/question.dart';
import 'package:mat_lgs/models/utils.dart';
import 'option.dart';

class OptionsWidget extends StatelessWidget {
  final Question question;
  final ValueChanged<Option> onClickedOption;
  const OptionsWidget({
    Key? key,
    required this.question,
    required this.onClickedOption,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ListView(
        physics: const BouncingScrollPhysics(),
        children: Utils.heightBetween(
          question.options.map((option) => buildOption(context, option)).toList(),
          height: 8,
        ),
      );

  Widget buildOption(BuildContext contex, Option option) {
    final color = getColorForOption(option, question);
    return GestureDetector(
      onTap: () => onClickedOption(option),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            buildAnswer(option),
            buildSolution(question.selectedOption, option),
          ],
        ),
      ),
    );
  }

  getColorForOption(Option option, Question question) {
    final isSelected = option == question.selectedOption;
    if (!isSelected) {
      return Colors.grey.shade200;
    } else if (option.answerOption == question.answerOption) {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }

  Widget buildAnswer(Option option) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          Text(
            option.code,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(width: 12),
          Text(
            option.text,
            style: const TextStyle(fontSize: 20),
          )
        ],
      ),
    );
  }

  Widget buildSolution(Option? solution, Option? answer) {
    if (solution == answer) {
      return Text(
        question.solution,
        style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
      );
    } else {
      return Container();
    }
  }
}
