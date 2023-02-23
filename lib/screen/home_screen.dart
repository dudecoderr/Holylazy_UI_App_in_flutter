import 'package:bubble_lens/bubble_lens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  VideoPlayerController? _controller;

  @override
  void initState() {
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..initialize().then((_) {
        //_controller!.play();
        setState(() {});
      });
    super.initState();
  }

  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          BubbleLens(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            radius: Radius.circular(20.0.r),
            paddingX: 0.0,
            paddingY: 0.0,
            size: 200,
            highRatio: 300,
            widgets: [
              for (int i = 0; i < 30; i++)
                AspectRatio(
                  aspectRatio: 0.5,
                  child: Container(
                    height: 200.h,
                    width: 200.w,
                    margin: EdgeInsets.all(10.0.sp),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0.r),
                        ),
                        color: Colors.transparent),
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0.r),
                        ),
                        child: VideoPlayer(_controller!)),
                  ),
                ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 25.h, left: 20.w),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 50.h,
                      width: 50.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                        border: Border.all(color: Colors.white, width: 2.w),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(40.0.r),
                        ),
                        child: Image.asset(
                          "assets/images/man.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(
                      "Your story",
                      style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 13.sp,
                          fontFamily: "Poppins-Medium"),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 50.h,
                      width: 50.h,
                      margin: EdgeInsets.only(left: 10.w),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                        border: Border.all(color: Colors.white, width: 2.w),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(40.0.r),
                        ),
                        child: Image.asset(
                          "assets/images/girl2.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Text(
                      "anny",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.sp,
                          fontFamily: "Poppins-Medium"),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 50.h,
                      width: 50.h,
                      margin: EdgeInsets.only(left: 10.w),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                        border: Border.all(color: Colors.white, width: 2.w),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(40.0.r),
                        ),
                        child: Image.asset(
                          "assets/images/man3.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Text(
                      "holi",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13.sp,
                        fontFamily: "Poppins-Medium",
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 50.h,
                          width: 50.h,
                          margin: EdgeInsets.only(left: 70.w),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.transparent,
                            border: Border.all(
                                color: Colors.white.withOpacity(0.4),
                                width: 2.w),
                            image: DecorationImage(
                              image: ExactAssetImage('assets/images/man2.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white.withOpacity(0.4)),
                          ),
                        ),
                        Container(
                          height: 50.h,
                          width: 50.h,
                          margin: EdgeInsets.only(left: 55.w),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.transparent,
                            border: Border.all(
                                color: Colors.white.withOpacity(0.6),
                                width: 2.w),
                            image: const DecorationImage(
                              image: ExactAssetImage('assets/images/man4.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white.withOpacity(0.3)),
                          ),
                        ),
                        Container(
                          height: 50.h,
                          width: 50.h,
                          margin: EdgeInsets.only(left: 35.w),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.transparent,
                            border: Border.all(
                                color: Colors.white.withOpacity(0.8),
                                width: 2.w),
                            image: const DecorationImage(
                              image: ExactAssetImage('assets/images/man5.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white.withOpacity(0.2)),
                          ),
                        ),
                        Container(
                          height: 50.h,
                          width: 50.h,
                          margin: EdgeInsets.only(left: 10.w),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.transparent,
                            border: Border.all(color: Colors.white, width: 2.w),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(
                              Radius.circular(40.0.r),
                            ),
                            child: Image.asset(
                              "assets/images/girl.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "robert and 9 more",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 13.sp,
                        fontFamily: "Poppins-Medium",
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20.h,
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20.w),
                  height: 30.h,
                  width: 60.w,
                  decoration: const BoxDecoration(
                    color: Color(0xffd2d0ce),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10.w),
                  height: 30.h,
                  width: 280.w,
                  color: Colors.transparent,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selected = !selected;
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 10.w),
                          height: 30.h,
                          width: 90.w,
                          decoration: const BoxDecoration(
                            color: Color(0xffd2d0ce),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "For You",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
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
