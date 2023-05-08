import 'package:flutter/material.dart';
import 'package:mat_lgs/provider/true_false_number.dart';
import 'package:provider/provider.dart';
import '../../component/custom_drawer_widget.dart';
import '../../data/true_false_questions1.dart';

class TrueFalsePage extends StatefulWidget {
  const TrueFalsePage({Key? key}) : super(key: key);

  @override
  State<TrueFalsePage> createState() => _TrueFalsePageState();
}

class _TrueFalsePageState extends State<TrueFalsePage> {
  TrueFalseQuestions1 trueFalseQuestions = TrueFalseQuestions1();
  int questionNumber = 0;
  int trueNumber = 0;
  int falseNumber = 0;
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = trueFalseQuestions.getCorrectAnswer();
    setState(() {
      if (trueFalseQuestions.isFinished()) {
        final providerObject2 = Provider.of<TrueFalseNumber>(context, listen: false);
        providerObject2.setTrueNumber(trueNumber);
        providerObject2.setTrueNumber(falseNumber);
        customShowDialog(context);
      } else {
        if (userPickedAnswer == correctAnswer) {
          scoreKeeper.add(
            const Icon(
              Icons.check,
              color: Colors.green,
            ),
          );

          trueNumber++;
        } else {
          scoreKeeper.add(
            const Icon(
              Icons.close,
              color: Colors.red,
            ),
          );
          falseNumber++;
        }

        trueFalseQuestions.getNextQuestion();
      }
    });
  }

  Future<dynamic> customShowDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
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
                  ],
                ),
                TableRow(
                  children: [
                    Center(
                      child: Text("$trueNumber",
                          style: const TextStyle(
                            color: Colors.amber,
                          ),
                          textAlign: TextAlign.center),
                    ),
                    Text("$falseNumber", style: const TextStyle(color: Colors.amber), textAlign: TextAlign.center),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
          ]),
        ),
        actions: [
          Consumer<TrueFalseNumber>(
              builder: (context, providerObject, child) => TextButton(
                    onPressed: () {
                      setState(() {
                        providerObject.setTrueNumber(trueNumber);
                        providerObject.setFalseNumber(falseNumber);
                        Navigator.pop(context, 'Cancel');
                        trueFalseQuestions.reset();
                        scoreKeeper.clear();
                        trueNumber = 0;
                        falseNumber = 0;
                      });
                    },
                    child: const Center(child: Text("YENİDEN ÇÖZ", style: TextStyle(color: Colors.amber))),
                  )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Test 1"),
      ),
      drawer: CustomDrawer(),
      body: Consumer<TrueFalseNumber>(
          builder: (context, providerObject, child) => SafeArea(
                child: Container(
                  color: Colors.white,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 6,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Center(
                              child: Text(
                                trueFalseQuestions.getQuestion(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  decoration: TextDecoration.none,
                                  color: Colors.black,
                                  fontSize: 25.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: TextButton(
                                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),
                                child: const Text(
                                  'Doğru',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24.0,
                                  ),
                                ),
                                onPressed: () {
                                  checkAnswer(true);
                                }),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: TextButton(
                                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),
                                child: const Text(
                                  'Yanlış',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24.0,
                                  ),
                                ),
                                onPressed: () {
                                  checkAnswer(false);
                                }),
                          ),
                        ),
                        Row(
                          children: scoreKeeper,
                        )
                      ]),
                ),
              )),
    );
  }
}
