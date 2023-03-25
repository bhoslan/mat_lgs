import 'package:flutter/material.dart';
import '../../data/true_false_questions1.dart';

class TrueFalsePage1 extends StatefulWidget {
  const TrueFalsePage1({Key? key}) : super(key: key);

  @override
  State<TrueFalsePage1> createState() => _TrueFalsePage1State();
}

class _TrueFalsePage1State extends State<TrueFalsePage1> {
  TrueFalseQuestions1 trueFalseQuestions = TrueFalseQuestions1();
  int questionNumber = 0;
  int trueNumber = 0;
  int falseNumber = 0;
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = trueFalseQuestions.getCorrectAnswer();
    setState(() {
      if (trueFalseQuestions.isFinished()) {
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
        title: Text(
          "Testi bitirdiniz.",
          style: TextStyle(color: Colors.black),
        ),
        content: SingleChildScrollView(
            child: ListBody(
          children: [
            Text(
              "doğru : $trueNumber --- yanlış : $falseNumber",
              style: TextStyle(color: Colors.black),
            ),
            Text(
              "Bir daha çözmek için tıklayınız.",
              style: TextStyle(color: Colors.black),
            ),
          ],
        )),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                Navigator.pop(context, 'Cancel');
                trueFalseQuestions.reset();
                scoreKeeper.clear();
                trueNumber = 0;
                falseNumber = 0;
              });
            },
            child: const Text("Yeniden çöz."),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   // leading: IconButton(
      //   //   onPressed: () {
      //   //     Get.back();
      //   //   },
      //   //   icon: const Icon(Icons.arrow_back),
      //   //   color: Colors.black,
      //   // ),
      //   elevation: 0,
      // ),
      body: SafeArea(
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
      ),
    );
  }
}
