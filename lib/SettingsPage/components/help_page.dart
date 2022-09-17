import 'package:flutter/material.dart';
import 'package:proj_ver1/responsive.dart';
import 'package:video_player/video_player.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: MobileHelpPage(),
    );
  }
}

class MobileHelpPage extends StatefulWidget {
  const MobileHelpPage({super.key});

  @override
  State<MobileHelpPage> createState() => MobileHelpPageState();
}

class MobileHelpPageState extends State<MobileHelpPage> {
  late VideoPlayerController controller;
  late Future<void> initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.network(
        "https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4");
    initializeVideoPlayerFuture = controller.initialize();
    controller.setLooping(false);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ayuda"),
      ),
      // body: Container(
        // padding: const EdgeInsets.all(15),
        // child: FutureBuilder(
            // future: initializeVideoPlayerFuture,
            // builder: (context, snapshot) {
              // if (snapshot.connectionState == ConnectionState.done) {
                // return AspectRatio(
                  // aspectRatio: controller.value.aspectRatio,
                  // child: VideoPlayer(controller),
                // );
              // } else {
                // return const Center(
                  // child: CircularProgressIndicator(),
                // );
              // }
            // })
      // ),
      // floatingActionButton: FloatingActionButton(
        // backgroundColor: Colors.green,
        // onPressed: () {
          // setState(() {
            // if (controller.value.isPlaying) {
              // controller.pause();
            // } else {
              // controller.play();
            // }
          // });
        // },
        // child: Icon(controller.value.isPlaying ? Icons.pause : Icons.play_arrow)
      // ),
    );
  }
}
