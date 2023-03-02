import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

import 'multiplayer.dart';

class VideoPlayScreen extends StatefulWidget {
  VideoPlayScreen({required this.currentindex, required this.videos, Key? key})
      : super(key: key);

  var currentindex;
  List videos;

  @override
  State<VideoPlayScreen> createState() => _VideoPlayScreenState();
}

class _VideoPlayScreenState extends State<VideoPlayScreen> {



  @override
  void initState() {

    _controller = PageController(initialPage: widget.currentindex);
    super.initState();
  }
  PageController _controller = PageController(initialPage: 0, keepPage: false);
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _controller,
        itemCount: widget.videos.length,
        onPageChanged: (index) {

          print("=======$index");
          print("=======${widget.videos[widget.currentindex]}");
        },
        itemBuilder: (context, index) {
          print("=======${widget.videos[widget.currentindex]}");
          return Scaffold(
            body: Stack(
              children: [
                Container(
                  color: Colors.red,
                  height: 690.h,
                  width: 360.w,
                  //   url: controller!,
                  // ),
                  child:  FlickMultiPlayer(
                      isheaderVideo: true,
                      url: widget.videos[index],
                      flickMultiManager: FlickMultiManager(mute: true))

                ),
                // PageView.builder(
                //   itemCount: videos.length,
                //   itemBuilder: (context, index) {
                //     return Container(
                //       color: Colors.red,
                //       height: 690.h,
                //       width: 360.w,
                //       child: VideoPlayer(
                //         VideoPlayerController.network(
                //           videos[index],
                //         )
                //           ..initialize()
                //           ..play()
                //           ..setLooping(true),
                //       ),
                //     );
                //   },
                // ),
                Positioned(
                  top: 32.h,
                  left: 20.w,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 100.h,
                  left: 20.w,
                  child: Row(
                    children: [
                      Container(
                        height: 50.h,
                        width: 50.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.transparent,
                          border: Border.all(color: Colors.white, width: 2.w),
                          image: DecorationImage(
                            image: index == 0
                                ? const ExactAssetImage(
                                    'assets/images/man3.png')
                                : index == 1
                                    ? const ExactAssetImage(
                                        'assets/images/girl2.png')
                                    : const ExactAssetImage(
                                        'assets/images/man4.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(
                        index == 0
                            ? "@Holi.lazy"
                            : index == 1
                                ? "anny.bunny"
                                : "robert.rusai",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 13.sp,
                          fontFamily: "Poppins-Medium",
                        ),
                      )
                    ],
                  ),
                ),
                Positioned(
                  bottom: 50.h,
                  left: 20.w,
                  child: Text(
                    index == 0
                        ? "the dance was very frenetic, lively, rattling,  \nclanging, rolling..💃"
                        : index == 1
                            ? "just look at these girls, so much power \nin those eyes💥"
                            : "the dance was very frenetic, lively, rattling,  \nclanging, rolling..💃",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13.sp,
                      fontFamily: "Poppins-Medium",
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20.h,
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20.w),
                        height: 25.h,
                        width: 65.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.r),
                          ),
                          color: Colors.white.withOpacity(0.6),
                        ),
                        child: Center(
                          child: Text(
                            "Follow",
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Poppins-SemiBold",
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20.w),
                        height: 25.h,
                        width: 65.w,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.r),
                          ),
                          color: Colors.transparent,
                        ),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.remove_red_eye,
                                  color: Colors.white,
                                  size: 15.h,
                                ),
                                Text(
                                  "45k",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Poppins-SemiBold",
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20.w),
                        height: 25.h,
                        width: 65.w,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.r),
                          ),
                          color: Colors.transparent,
                        ),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.favorite,
                                  color: Colors.white,
                                  size: 15.h,
                                ),
                                Text(
                                  "18k",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Poppins-SemiBold",
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20.w),
                        height: 25.h,
                        width: 65.w,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.r),
                          ),
                          color: Colors.transparent,
                        ),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.bookmark,
                                  color: Colors.white,
                                  size: 15.h,
                                ),
                                Text(
                                  "463",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Poppins-SemiBold",
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}

class SingleVideo extends StatefulWidget {
  SingleVideo({Key? key, required this.url}) : super(key: key);
  VideoPlayerController url;

  @override
  State<SingleVideo> createState() => _SingleVideoState();
}

class _SingleVideoState extends State<SingleVideo> {
  @override
  void dispose() {
    print("----> dispose");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      height: 690.h,
      width: 360.w,
      child: VideoPlayer(
        widget.url,
      ),
    );
  }
}

class SecondVideo extends StatefulWidget {
  const SecondVideo({
    Key? key,
  }) : super(key: key);

  @override
  State<SecondVideo> createState() => _SecondVideoState();
}

class _SecondVideoState extends State<SecondVideo> {
  VideoPlayerController? videoPlayerController;

  @override
  void initState() {
    // videoPlayerController = VideoPlayerController.network(
    //     "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4")
    //   ..initialize();
    print("==============2video");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      height: 690.h,
      width: 360.w,
      child: VideoPlayer(
        VideoPlayerController.network(
            "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4")
          ..initialize()
          ..play(),
      ),
    );
  }
}
