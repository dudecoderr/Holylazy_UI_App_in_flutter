import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:holylazy/screen/home_screen.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return const MaterialApp(
          home: HomeScreen(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}

class MyApps extends StatelessWidget {
  const MyApps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> urls = [
      "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
      "http://techslides.com/demos/sample-videos/small.mp4",
      "https://assets.mixkit.co/videos/preview/mixkit-young-women-jumping-at-the-concert-14116-large.mp4",
      "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
    ];

    return MaterialApp(
      home: PageView.builder(
        itemBuilder: (ctx, index) => VideoScreen(url: urls[index]),
        itemCount: urls.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

class VideoScreen extends StatefulWidget {
  final String url;
  const VideoScreen({Key? key, required this.url}) : super(key: key);

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController controller;

  void initController() async {
    controller = VideoPlayerController.network(widget.url);
    await controller.initialize();
    controller.play();
  }

  @override
  void initState() {
    initController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (controller.value.isInitialized) {
      return const CircularProgressIndicator();
    }
    return SizedBox(
      height: double.infinity,
      child: AspectRatio(
        aspectRatio: controller.value.aspectRatio,
        child: VideoPlayer(controller),
      ),
    );
  }
}
