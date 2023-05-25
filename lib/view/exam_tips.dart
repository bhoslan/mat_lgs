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
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTapCardWidget(
                text: ApplicationConstants.tips1,
              ),
              SizedBox(
                height: 8,
              ),
              CustomTapCardWidget(
                text: ApplicationConstants.tips2,
              ),
              SizedBox(
                height: 8,
              ),
              CustomTapCardWidget(
                text: ApplicationConstants.tips3,
              ),
              SizedBox(
                height: 8,
              ),
              CustomTapCardWidget(
                text: ApplicationConstants.tips4,
              ),
              SizedBox(
                height: 8,
              ),
              CustomTapCardWidget(
                text: ApplicationConstants.tips5,
              ),
              SizedBox(
                height: 8,
              ),
              CustomTapCardWidget(
                text: ApplicationConstants.tips6,
              ),
              SizedBox(
                height: 8,
              ),
              CustomTapCardWidget(
                text: ApplicationConstants.tips7,
              ),
              SizedBox(
                height: 8,
              ),
              CustomTapCardWidget(
                text: ApplicationConstants.tips8,
              ),
              SizedBox(
                height: 8,
              ),
              CustomTapCardWidget(
                text: ApplicationConstants.tips9,
              ),
              SizedBox(
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
