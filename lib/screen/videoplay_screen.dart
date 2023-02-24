import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

class VideoPlayScreen extends StatefulWidget {
  const VideoPlayScreen({Key? key}) : super(key: key);

  @override
  State<VideoPlayScreen> createState() => _VideoPlayScreenState();
}

class _VideoPlayScreenState extends State<VideoPlayScreen> {
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4")
      ..initialize()
      ..play()
      ..setLooping(true);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.red,
            height: 690.h,
            width: 360.w,
            child: VideoPlayer(_controller!),
          ),
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
                    image: const DecorationImage(
                      image: ExactAssetImage('assets/images/man3.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                SizedBox(
                  width: 8.w,
                ),
                Text(
                  "@Holi.lazy",
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
              "just look at these girls, so much power \nin those eyes💥",
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
  }
}
