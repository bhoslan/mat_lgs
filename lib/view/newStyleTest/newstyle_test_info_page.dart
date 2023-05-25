import 'package:flutter/material.dart';
import 'package:mat_lgs/constants/app/app_constants.dart';
import 'package:mat_lgs/view/newStyleTest/newstyle_test_page1.dart';
import 'package:mat_lgs/view/test/test_page2.dart';
import '../../component/custom_drawer_widget.dart';

class NewStyleTestInfoPage extends StatefulWidget {
  const NewStyleTestInfoPage({super.key});

  @override
  State<NewStyleTestInfoPage> createState() => _NewStyleTestInfoPageState();
}

class _NewStyleTestInfoPageState extends State<NewStyleTestInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: const Text(ApplicationConstants.titleMathTests),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(30),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0, bottom: 4),
                child: SizedBox(width: 30, height: 30, child: Image.asset("assets/images/ruler.png")),
              ),
              const Expanded(
                flex: 1,
                child: Center(
                  child: Text(
                    "TEST KONULARI",
                    style: TextStyle(
                      color: Colors.amber,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          CustomButtonTapCardWidget(
            title: "Test 1 - Çarpanlar ve Katlar",
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const NewStyleTestPage1()));
            },
          ),
          CustomButtonTapCardWidget(
            title: "Test 2 - Ebob Ekok",
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const TestPage2()));
            },
          ),
          // const CustomButtonTapCardWidget(
          //   title: "Test 3 - Aralarında Asal Sayılar",
          // ),
          // const CustomButtonTapCardWidget(
          //   title: "Test 4 - Üslü İfadeler",
          // ),
        ]),
      ),
    );
  }
}

class CustomButtonTapCardWidget extends StatefulWidget {
  const CustomButtonTapCardWidget({Key? key, required this.title, this.onTap}) : super(key: key);
  final String title;
  final Function()? onTap;

  @override
  State<CustomButtonTapCardWidget> createState() => _CustomButtonTapCardWidgetState();
}

class _CustomButtonTapCardWidgetState extends State<CustomButtonTapCardWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Card(
        color: Colors.amber,
        borderOnForeground: true,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 40,
          child: Row(children: [
            const SizedBox(
              width: 20,
            ),
            Expanded(
              flex: 1,
              child: Text(
                widget.title,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
