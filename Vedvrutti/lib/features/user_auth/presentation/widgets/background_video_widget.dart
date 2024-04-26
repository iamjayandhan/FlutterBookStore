import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class BackgroundVideoWidget extends StatefulWidget {
  const BackgroundVideoWidget({Key? key}) : super(key: key);

  @override
  State<BackgroundVideoWidget> createState() => _BackgroundVideoWidgetState();
}

class _BackgroundVideoWidgetState extends State<BackgroundVideoWidget> {
  late final VideoPlayerController videoController;

  @override
  void initState() {
    super.initState();

    // Wrap video initialization in a try-catch block for error handling
    try {
      videoController = VideoPlayerController.asset('assets/video.mp4');
      initializeVideo();
    } catch (e) {
      print('Error initializing video: $e');
    }
  }

  Future<void> initializeVideo() async {
    try {
      await videoController.initialize();
      await videoController.play();
      videoController.setLooping(true);
    } catch (e) {
      print('Error initializing video: $e');
    }
  }

  @override
  void dispose() {
    videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VideoPlayer(videoController);
  }
}
