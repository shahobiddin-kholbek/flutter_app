import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// Define the main widget for the YouTube video player
class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() =>
      _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  final videoURL = "https://youtube.com/shorts/v5oKX5RCrhg?feature=shared";
  late YoutubePlayerController playerController;
  @override
  void initState() {
    final videoId = YoutubePlayer.convertUrlToId(videoURL);
    playerController = YoutubePlayerController(
        initialVideoId: videoId!,
        flags: const YoutubePlayerFlags(
            autoPlay: true, hideControls: true, mute: true, loop: true),
        );
    super.initState();
  }

  void seekForward() {
    final currentPosition = playerController.value.position;
    final duration = playerController.value.metaData.duration;
    if (currentPosition.inSeconds + 10 < duration.inSeconds) {
      playerController.seekTo(
        currentPosition + const Duration(seconds: 10),
      );
    }
  }

  void seekBackward() {
    final currentPosition = playerController.value.position;
    if (currentPosition.inSeconds - 10 > 0) {
      playerController.seekTo(currentPosition - const Duration(seconds: 10));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: const Text("Play YouTube Video on Flutter App"),
      ),
      body: Stack(
        children: [
          YoutubePlayer(controller: playerController, aspectRatio: 9 / 16,),
          Positioned(
            top: 100,right: 100,left: 100,bottom: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: seekBackward,
                  icon: const Icon(Icons.replay_10,size: 30,color: Colors.white54,),
                ),
                const SizedBox(width: 30),
                IconButton(
                  onPressed: seekForward,
                  icon: const Icon(Icons.forward_10,size: 30,color: Colors.white54,),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}