import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:mat_lgs/view/exam_tips.dart';
import 'package:mat_lgs/view/stopwatchTimer/stopwatch_timer.dart';
import 'package:mat_lgs/view/test/test_info_page.dart';
import 'package:mat_lgs/view/trueFalse/true_false_info_page.dart';
import 'package:mat_lgs/view/video/video_info_page.dart';
import '../component/custom_drawer_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String _anasayfa = "Anasayfa";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_anasayfa),
      ),
      drawer: CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.amber,
              ),
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Text(
                      ("LGS 2023'E KALAN SÜRE"),
                      style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.normal),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Center(
                        child: TimerCountdown(
                          endTime: DateTime(2023, 6, 4, 9, 30),
                          daysDescription: "Gün",
                          hoursDescription: "Saat",
                          secondsDescription: "Saniye",
                          minutesDescription: "Dakika",
                          enableDescriptions: true,
                          timeTextStyle: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                          descriptionTextStyle:
                              const TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.normal),
                          colonsTextStyle: const TextStyle(color: Colors.amber, fontSize: 20),
                          spacerWidth: 25,
                        ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomCardWidget(
                  iconImage: Image.asset("assets/images/subjectMath.png"),
                  cardText: "Video anlatımı",
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const VideoInfoPage()));
                  },
                ),
                CustomCardWidget(
                  iconImage: Image.asset("assets/images/testImage.png"),
                  cardText: "Doğru-Yanlış",
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const TrueFalseInfoPage()));
                  },
                ),
                CustomCardWidget(
                  iconImage: Image.asset("assets/images/mathsTest.png"),
                  cardText: "Testler",
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const TestInfoPage()));
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomCardWidget(
                  iconImage: Image.asset("assets/images/newGenQuestion.png"),
                  cardText: "Yeni nesil sorular",
                  onTap: () {
                    return print("Tıklandı");
                  },
                ),
                CustomCardWidget(
                  iconImage: Image.asset("assets/images/goal.png"),
                  cardText: "Günlük hedefler",
                  onTap: () {
                    return print("Tıklandı");
                  },
                ),
                CustomCardWidget(
                  iconImage: Image.asset("assets/images/advice.png"),
                  cardText: "Sınav tavsiyeleri",
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ExamTips(),
                      ),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomCardWidget(
                  iconImage: Image.asset("assets/images/stopwatch.png"),
                  cardText: "Zamanlayıcı",
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const StopwatchTimer()));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomCardWidget extends StatelessWidget {
  CustomCardWidget({
    Key? key,
    required this.cardText,
    required this.iconImage,
    this.onTap,
  }) : super(key: key);

  final String cardText;
  final Image iconImage;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: Colors.amber,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: SizedBox(
          width: MediaQuery.of(context).size.width / 3.5,
          height: MediaQuery.of(context).size.width / 4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(width: 60, height: 60, child: iconImage),
              Text(
                cardText,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
