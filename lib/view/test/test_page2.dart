import 'package:flutter/material.dart';
import 'package:mat_lgs/component/custom_drawer_widget.dart';
import 'package:mat_lgs/component/options_button_widget.dart';
import 'package:mat_lgs/component/options_button_widget_test2.dart';
import 'package:mat_lgs/provider/test_true_false_number.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';

import '../../provider/test_true_false_number2.dart';

class TestPage2 extends StatefulWidget {
  const TestPage2({super.key});

  @override
  State<TestPage2> createState() => _TestPage2State();
}

class _TestPage2State extends State<TestPage2> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TestTrueFalseNumber2>(
      builder: (context, providerObject, child) => WillPopScope(
        onWillPop: () async {
          providerObject.resetTest2();
          providerObject.setIsShowAnswer2();
          return true;
        },
        child: Scaffold(
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
                              Row(
                                children: [
                                  const OptionsButtonWidgetTest2(correctAnswer: "A", questionNumber: "1"),
                                  SizedBox(width: MediaQuery.of(context).size.width / 8),
                                  const OptionsButtonWidgetTest2(correctAnswer: "B", questionNumber: "2"),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Row(
                            children: [
                              const OptionsButtonWidgetTest2(correctAnswer: "C", questionNumber: "3"),
                              SizedBox(width: MediaQuery.of(context).size.width / 8),
                              const OptionsButtonWidgetTest2(correctAnswer: "D", questionNumber: "4"),
                            ],
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Row(
                            children: [
                              const OptionsButtonWidgetTest2(correctAnswer: "A", questionNumber: "5"),
                              SizedBox(width: MediaQuery.of(context).size.width / 8),
                              const OptionsButtonWidgetTest2(correctAnswer: "B", questionNumber: "6"),
                            ],
                          ),
                        ],
                      ),
                    )),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Consumer<TestTrueFalseNumber2>(builder: (context, providerObject, child) {
                        return ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.amber),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
                            child: const Text("Sonuçları Göster"),
                            onPressed: () {
                              providerObject.setIsShowAnswer2();
                              providerObject.saveTestResult2();
                              setState(() {});
                              customShowDialog(context, providerObject);
                              // final providerObject2 = Provider.of<TrueFalseNumber>(context, listen: false);
                              // print("doğru : ${providerObject2.trueNumber}");
                            });
                      }),
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }

  Future<dynamic> customShowDialog(BuildContext context, TestTrueFalseNumber2 providerObject) {
    return showDialog(
      context: context,
      builder: ((context) => AlertDialog(
            backgroundColor: Colors.blueGrey.shade900,
            content: SingleChildScrollView(
              child: ListBody(children: [
                const Center(
                  child: Text(
                    "TEST SONUCUNUZ",
                    style: TextStyle(color: Colors.amber),
                  ),
                ),
                const Divider(
                  color: Colors.amber,
                  thickness: 1,
                  indent: 10,
                  endIndent: 10,
                ),
                Table(
                  children: [
                    const TableRow(
                      children: [
                        Text("Doğru", style: TextStyle(color: Colors.amber), textAlign: TextAlign.center),
                        Text("Yanlış", style: TextStyle(color: Colors.amber), textAlign: TextAlign.center),
                        Text("Net", style: TextStyle(color: Colors.amber), textAlign: TextAlign.center),
                      ],
                    ),
                    TableRow(
                      children: [
                        Center(
                          child: Text("${providerObject.trueNumber2}",
                              style: const TextStyle(
                                color: Colors.amber,
                              ),
                              textAlign: TextAlign.center),
                        ),
                        Text("${providerObject.falseNumber2}",
                            style: const TextStyle(color: Colors.amber), textAlign: TextAlign.center),
                        Text("${providerObject.calculateNet2()}",
                            style: const TextStyle(color: Colors.amber), textAlign: TextAlign.center),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Center(
                  child: Text(providerObject.resultMessage2(),
                      style: const TextStyle(color: Colors.amber, fontStyle: FontStyle.italic),
                      textAlign: TextAlign.center),
                ),
              ]),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Center(child: Text("KAPAT", style: const TextStyle(color: Colors.amber))),
              ),
            ],
          )),
    );
  }
}

class CustomSizedBox extends StatelessWidget {
  const CustomSizedBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 5,
      height: 30,
    );
  }
}
