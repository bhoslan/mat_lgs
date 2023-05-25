import 'package:flutter/material.dart';
import 'package:mat_lgs/component/custom_drawer_widget.dart';
import 'package:mat_lgs/component/options_button_widget.dart';
import 'package:mat_lgs/provider/test_true_false_number.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';

class TestPage1 extends StatefulWidget {
  const TestPage1({super.key});

  @override
  State<TestPage1> createState() => _TestPage1State();
}

class _TestPage1State extends State<TestPage1> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TestTrueFalseNumber>(
      builder: (context, providerObject, child) => WillPopScope(
        onWillPop: () async {
          providerObject.resetTest();
          providerObject.setIsShowAnswer();
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
                                  const OptionsButtonWidget(correctAnswer: "A", questionNumber: "1"),
                                  SizedBox(width: MediaQuery.of(context).size.width / 8),
                                  const OptionsButtonWidget(correctAnswer: "B", questionNumber: "2"),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Row(
                            children: [
                              const OptionsButtonWidget(correctAnswer: "C", questionNumber: "3"),
                              SizedBox(width: MediaQuery.of(context).size.width / 8),
                              const OptionsButtonWidget(correctAnswer: "D", questionNumber: "4"),
                            ],
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Row(
                            children: [
                              const OptionsButtonWidget(correctAnswer: "A", questionNumber: "5"),
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
                      child: Consumer<TestTrueFalseNumber>(builder: (context, providerObject, child) {
                        return ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.amber),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
                            child: const Text("Sonuçları Göster"),
                            onPressed: () {
                              providerObject.setIsShowAnswer();
                              providerObject.saveTestResult();
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

  Future<dynamic> customShowDialog(BuildContext context, TestTrueFalseNumber providerObject) {
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
                          child: Text("${providerObject.trueNumber}",
                              style: const TextStyle(
                                color: Colors.amber,
                              ),
                              textAlign: TextAlign.center),
                        ),
                        Text("${providerObject.falseNumber}",
                            style: const TextStyle(color: Colors.amber), textAlign: TextAlign.center),
                        Text("${providerObject.calculateNet()}",
                            style: const TextStyle(color: Colors.amber), textAlign: TextAlign.center),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Center(
                  child: Text(providerObject.resultMessage(),
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
                child: const Center(child: Text("KAPAT", style: TextStyle(color: Colors.amber))),
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
