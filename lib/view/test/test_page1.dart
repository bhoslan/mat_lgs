// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:mat_lgs/component/custom_drawer_widget.dart';
import 'package:mat_lgs/component/options_button_widget.dart';
import 'package:mat_lgs/models/options_widget.dart';
import 'package:photo_view/photo_view.dart';

class TestPage1 extends StatefulWidget {
  const TestPage1({super.key});

  @override
  State<TestPage1> createState() => _TestPage1State();
}

class _TestPage1State extends State<TestPage1> {
  @override
  Widget build(BuildContext context) {
    List answers1 = ["", "A", "B", "C", "D", "A", "B"];
    ValueChanged onClickedOption;

    return Scaffold(
        appBar: AppBar(
          title: const Text("Test 1"),
        ),
        drawer: CustomDrawer(),
        body: Column(
          children: [
            Expanded(flex: 9, child: PhotoView(imageProvider: const AssetImage("assets/tests/test1-1.JPG"))),
            Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const OptionsButtonWidget(correctAnswer: "B", questionNumber: "1"),
                          SizedBox(width: MediaQuery.of(context).size.width / 8),
                          const OptionsButtonWidget(correctAnswer: "B", questionNumber: "2"),
                        ],
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Row(
                        children: [
                          const OptionsButtonWidget(correctAnswer: "B", questionNumber: "3"),
                          SizedBox(width: MediaQuery.of(context).size.width / 8),
                          const OptionsButtonWidget(correctAnswer: "B", questionNumber: "4"),
                        ],
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Row(
                        children: [
                          const OptionsButtonWidget(correctAnswer: "B", questionNumber: "5"),
                          SizedBox(width: MediaQuery.of(context).size.width / 8),
                          const OptionsButtonWidget(correctAnswer: "B", questionNumber: "6"),
                        ],
                      ),
                    ],
                  ),
                )),
            Row(
              children: [
                Expanded(
                    flex: 3,
                    child: ElevatedButton(
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.amber)),
                      child: const Text("Cevapları Göster"),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Puan : "),
                        ));
                      },
                    )),
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.pink,
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
