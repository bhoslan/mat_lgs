import 'package:flutter/material.dart';
import 'package:mat_lgs/utilities/app_colors.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoPlayerPage extends StatefulWidget {
  final String assetPath;
  const VideoPlayerPage({super.key, required this.assetPath});

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;

  @override
  void initState() {
    super.initState();
    _initPlayer();
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: false,
      looping: true,
    );
  }

  void _initPlayer() async {
    videoPlayerController = VideoPlayerController.asset(widget.assetPath);
    await videoPlayerController.initialize();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ApplicationColors.appBarbackGroundColor,
      appBar: AppBar(
        title: const Text("Çarpanlar ve Katlar"),
      ),
      body:  Padding(
              padding:const EdgeInsets.symmetric(vertical: 20),
              child: Chewie(
                controller: chewieController,
              ),
            )
          
    );
  }
}
