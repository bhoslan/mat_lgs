import 'package:flutter/material.dart';
import 'package:mat_lgs/models/question.dart';

import 'option.dart';
import 'options_widget.dart';

class QuestionWidget extends StatelessWidget {
  final PageController controller;
  final ValueChanged<int> onChangedPage;
  final ValueChanged<Option> onClickedOption;
  final List<Question> questions;

  const QuestionWidget({
    super.key,
    required this.controller,
    required this.onChangedPage,
    required this.onClickedOption,
    required this.questions,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        onPageChanged: onChangedPage,
        controller: controller,
        itemCount: questions.length,
        itemBuilder: ((context, index) {
          final question = questions[index];
          return buildQuestion(question: question);
        }));
  }
  Widget buildQuestion({
    required Question question,
  }) =>
      Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 32),
            Image.asset(question.imagePath),
            const SizedBox(height: 40),
            Expanded(
              child: OptionsWidget(
                question: question,
                onClickedOption: onClickedOption,
              ),
            ),
          ],
        ),
      );
}
