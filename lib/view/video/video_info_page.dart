import 'package:flutter/material.dart';
import 'package:mat_lgs/constants/app/app_constants.dart';
import 'package:mat_lgs/view/video/video_player_page.dart';
import '../../component/custom_drawer_widget.dart';

class VideoInfoPage extends StatefulWidget {
  const VideoInfoPage({super.key});

  @override
  State<VideoInfoPage> createState() => _VideoInfoPageState();
}

class _VideoInfoPageState extends State<VideoInfoPage> {
  final asset = "assets/videos/video1.mp4";

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
                child: Container(width: 30, height: 30, child: Image.asset("assets/images/ruler.png")),
              ),
              const Expanded(
                flex: 1,
                child: Center(
                  child: Text(
                    "VİDEO KONULARI",
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
            title: "Çarpanlar ve Katlar",
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => const VideoPlayerPage(
                          assetPath: "assets/videos/video1.mp4",
                        )),
              );
            },
          ),
          CustomButtonTapCardWidget(
            title: "Ebob Ekok",
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => const VideoPlayerPage(
                          assetPath: "assets/videos/video2.mp4",
                        )),
              );
            },
          ),
          const CustomButtonTapCardWidget(
            title: "Aralarında Asal Sayılar",
          ),
          const CustomButtonTapCardWidget(
            title: "Üslü İfadeler",
          ),
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
            Checkbox(
                value: isChecked,
                checkColor: Colors.white,
                activeColor: Colors.black,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value!;
                  });
                }),
            Expanded(
              flex: 1,
              child: Text(
                textAlign: TextAlign.left,
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
