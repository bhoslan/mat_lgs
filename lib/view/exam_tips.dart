import 'package:flutter/material.dart';
import 'package:mat_lgs/component/custom_drawer_widget.dart';
import 'package:mat_lgs/component/custom_tap_card_widget.dart';
import 'package:mat_lgs/constants/app/app_constants.dart';

class ExamTips extends StatelessWidget {
  const ExamTips({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(ApplicationConstants.titleExamTips),
      ),
      drawer: CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTapCardWidget(
                text: ApplicationConstants.tips1,
              ),
              const SizedBox(
                height: 8,
              ),
              CustomTapCardWidget(
                text: ApplicationConstants.tips2,
              ),
              const SizedBox(
                height: 8,
              ),
              CustomTapCardWidget(
                text: ApplicationConstants.tips3,
              ),
              const SizedBox(
                height: 8,
              ),
              CustomTapCardWidget(
                text: ApplicationConstants.tips4,
              ),
              const SizedBox(
                height: 8,
              ),
              CustomTapCardWidget(
                text: ApplicationConstants.tips5,
              ),
              const SizedBox(
                height: 8,
              ),
              CustomTapCardWidget(
                text: ApplicationConstants.tips6,
              ),
              const SizedBox(
                height: 8,
              ),
              CustomTapCardWidget(
                text: ApplicationConstants.tips7,
              ),
              const SizedBox(
                height: 8,
              ),
              CustomTapCardWidget(
                text: ApplicationConstants.tips8,
              ),
              const SizedBox(
                height: 8,
              ),
              CustomTapCardWidget(
                text: ApplicationConstants.tips9,
              ),
              const SizedBox(
                height: 8,
              ),
              CustomTapCardWidget(
                text: ApplicationConstants.tips10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
