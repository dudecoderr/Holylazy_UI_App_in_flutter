import 'package:bubble_lens/bubble_lens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:holylazy/constant/image_constant.dart';
import 'package:holylazy/screen/videoplay_screen.dart';
import 'package:video_player/video_player.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // VideoPlayerController? controller;

  List videos = [
    'https://assets.mixkit.co/videos/preview/mixkit-young-women-jumping-at-the-concert-14116-large.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    'https://vod-progressive.akamaized.net/exp=1677337375~acl=%2Fvimeo-prod-skyfire-std-us%2F01%2F593%2F23%2F577967684%2F2729940617.mp4~hmac=0a482297967950e17ef897cce77bdfef28ae27e8687a439bc49aa346b4542929/vimeo-prod-skyfire-std-us/01/593/23/577967684/2729940617.mp4',
    'https://vod-progressive.akamaized.net/exp=1677337274~acl=%2Fvimeo-prod-skyfire-std-us%2F01%2F4926%2F17%2F449630779%2F1975867773.mp4~hmac=323a4a64a48cce54465819d9714a38b21cd1461a7cd96e6d467d40b1cf6183d2/vimeo-prod-skyfire-std-us/01/4926/17/449630779/1975867773.mp4',
    'https://vod-progressive.akamaized.net/exp=1677337375~acl=%2Fvimeo-prod-skyfire-std-us%2F01%2F593%2F23%2F577967684%2F2729940617.mp4~hmac=0a482297967950e17ef897cce77bdfef28ae27e8687a439bc49aa346b4542929/vimeo-prod-skyfire-std-us/01/593/23/577967684/2729940617.mp4',
    'https://vod-progressive.akamaized.net/exp=1677337486~acl=%2Fvimeo-prod-skyfire-std-us%2F01%2F1147%2F13%2F330736743%2F1299304868.mp4~hmac=f8efd142d78d48d0d892af442c70b59ed720232cf2378f6fd5aff03bce148921/vimeo-prod-skyfire-std-us/01/1147/13/330736743/1299304868.mp4',
    'https://vod-progressive.akamaized.net/exp=1677337375~acl=%2Fvimeo-prod-skyfire-std-us%2F01%2F593%2F23%2F577967684%2F2729940617.mp4~hmac=0a482297967950e17ef897cce77bdfef28ae27e8687a439bc49aa346b4542929/vimeo-prod-skyfire-std-us/01/593/23/577967684/2729940617.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    'https://vod-progressive.akamaized.net/exp=1677337375~acl=%2Fvimeo-prod-skyfire-std-us%2F01%2F593%2F23%2F577967684%2F2729940617.mp4~hmac=0a482297967950e17ef897cce77bdfef28ae27e8687a439bc49aa346b4542929/vimeo-prod-skyfire-std-us/01/593/23/577967684/2729940617.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    'https://vod-progressive.akamaized.net/exp=1677337375~acl=%2Fvimeo-prod-skyfire-std-us%2F01%2F593%2F23%2F577967684%2F2729940617.mp4~hmac=0a482297967950e17ef897cce77bdfef28ae27e8687a439bc49aa346b4542929/vimeo-prod-skyfire-std-us/01/593/23/577967684/2729940617.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    'https://vod-progressive.akamaized.net/exp=1677337375~acl=%2Fvimeo-prod-skyfire-std-us%2F01%2F593%2F23%2F577967684%2F2729940617.mp4~hmac=0a482297967950e17ef897cce77bdfef28ae27e8687a439bc49aa346b4542929/vimeo-prod-skyfire-std-us/01/593/23/577967684/2729940617.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    'https://vod-progressive.akamaized.net/exp=1677337375~acl=%2Fvimeo-prod-skyfire-std-us%2F01%2F593%2F23%2F577967684%2F2729940617.mp4~hmac=0a482297967950e17ef897cce77bdfef28ae27e8687a439bc49aa346b4542929/vimeo-prod-skyfire-std-us/01/593/23/577967684/2729940617.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    'https://vod-progressive.akamaized.net/exp=1677337375~acl=%2Fvimeo-prod-skyfire-std-us%2F01%2F593%2F23%2F577967684%2F2729940617.mp4~hmac=0a482297967950e17ef897cce77bdfef28ae27e8687a439bc49aa346b4542929/vimeo-prod-skyfire-std-us/01/593/23/577967684/2729940617.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    'https://vod-progressive.akamaized.net/exp=1677337375~acl=%2Fvimeo-prod-skyfire-std-us%2F01%2F593%2F23%2F577967684%2F2729940617.mp4~hmac=0a482297967950e17ef897cce77bdfef28ae27e8687a439bc49aa346b4542929/vimeo-prod-skyfire-std-us/01/593/23/577967684/2729940617.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    'https://vod-progressive.akamaized.net/exp=1677337375~acl=%2Fvimeo-prod-skyfire-std-us%2F01%2F593%2F23%2F577967684%2F2729940617.mp4~hmac=0a482297967950e17ef897cce77bdfef28ae27e8687a439bc49aa346b4542929/vimeo-prod-skyfire-std-us/01/593/23/577967684/2729940617.mp4',
    'https://assets.mixkit.co/videos/preview/mixkit-young-women-jumping-at-the-concert-14116-large.mp4',
  ];

  List catagory = ["For You", "Nature", "Ocean", "Tranding"];

  int selected = 0;
  int currentIndex = 0;
  int i = 0;

  Content? content;

  //HomeController homeController = Get.put(HomeController());

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
            widgets: videos.map((video) {
              return SmallVideoWidget(
                videos: videos,
                url: video,
              );
            }).toList(),
          ),
        ],
      ),
      // body: Stack(
      //   children: [
      //     BubbleLens(
      //       width: MediaQuery.of(context).size.width,
      //       height: MediaQuery.of(context).size.height,
      //       radius: Radius.circular(20.0.r),
      //       paddingX: 0.0,
      //       paddingY: 0.0,
      //       size: 200,
      //       highRatio: 300,
      //       widgets: [
      //         for (i; i < videos.length; i++)
      //           GestureDetector(
      //             onTap: () {
      //               VideoPlayer(VideoPlayerController.network(
      //                 videos[i],
      //               )
      //                 ..initialize()
      //                 ..play()
      //                 ..setLooping(true));
      //               print("---------------------$i");
      //               Navigator.push(
      //                 context,
      //                 MaterialPageRoute(
      //                   builder: (context) {
      //                     return const VideoPlayScreen();
      //                   },
      //                 ),
      //               );
      //             },
      //             child: AspectRatio(
      //               aspectRatio: 0.5,
      //               child: Container(
      //                 height: 200.h,
      //                 width: 200.w,
      //                 margin: EdgeInsets.all(10.0.sp),
      //                 decoration: BoxDecoration(
      //                     borderRadius: BorderRadius.all(
      //                       Radius.circular(20.0.r),
      //                     ),
      //                     color: Colors.transparent),
      //                 child: ClipRRect(
      //                   borderRadius: BorderRadius.all(
      //                     Radius.circular(20.0.r),
      //                   ),
      //                   child: Container(
      //                     color: Colors.red,
      //                     child: Image.asset(
      //                       "assets/images/girl.png",
      //                       fit: BoxFit.fill,
      //                     ),
      //                   ),
      //                   child: VideoPlayer(VideoPlayerController.network(
      //                     videos[i],
      //                   )
      //                     ..initialize()
      //                     ..play()
      //                     ..setLooping(true)),
      //                 ),
      //               ),
      //             ),
      //           ),
      //       ],
      //     ),
      //     Padding(
      //       padding: EdgeInsets.only(top: 25.h, left: 20.w),
      //       child: Row(
      //         children: [
      //           Column(
      //             crossAxisAlignment: CrossAxisAlignment.center,
      //             children: [
      //               Container(
      //                 height: 50.h,
      //                 width: 50.h,
      //                 decoration: BoxDecoration(
      //                   shape: BoxShape.circle,
      //                   color: Colors.transparent,
      //                   border: Border.all(color: Colors.white, width: 2.w),
      //                 ),
      //                 child: ClipRRect(
      //                   borderRadius: BorderRadius.all(
      //                     Radius.circular(40.0.r),
      //                   ),
      //                   child: Image.asset(
      //                     "assets/images/man.png",
      //                     fit: BoxFit.cover,
      //                   ),
      //                 ),
      //               ),
      //               Text(
      //                 "Your story",
      //                 style: TextStyle(
      //                     color: Colors.white.withOpacity(0.8),
      //                     fontSize: 13.sp,
      //                     fontFamily: "Poppins-Medium"),
      //               )
      //             ],
      //           ),
      //           Column(
      //             crossAxisAlignment: CrossAxisAlignment.center,
      //             children: [
      //               Container(
      //                 height: 50.h,
      //                 width: 50.h,
      //                 margin: EdgeInsets.only(left: 10.w),
      //                 decoration: BoxDecoration(
      //                   shape: BoxShape.circle,
      //                   color: Colors.transparent,
      //                   border: Border.all(color: Colors.white, width: 2.w),
      //                 ),
      //                 child: ClipRRect(
      //                   borderRadius: BorderRadius.all(
      //                     Radius.circular(40.0.r),
      //                   ),
      //                   child: Image.asset(
      //                     "assets/images/girl2.png",
      //                     fit: BoxFit.fill,
      //                   ),
      //                 ),
      //               ),
      //               Text(
      //                 "anny",
      //                 style: TextStyle(
      //                     color: Colors.white,
      //                     fontSize: 13.sp,
      //                     fontFamily: "Poppins-Medium"),
      //               )
      //             ],
      //           ),
      //           Column(
      //             crossAxisAlignment: CrossAxisAlignment.center,
      //             children: [
      //               Container(
      //                 height: 50.h,
      //                 width: 50.h,
      //                 margin: EdgeInsets.only(left: 10.w),
      //                 decoration: BoxDecoration(
      //                   shape: BoxShape.circle,
      //                   color: Colors.transparent,
      //                   border: Border.all(color: Colors.white, width: 2.w),
      //                 ),
      //                 child: ClipRRect(
      //                   borderRadius: BorderRadius.all(
      //                     Radius.circular(40.0.r),
      //                   ),
      //                   child: Image.asset(
      //                     "assets/images/man3.png",
      //                     fit: BoxFit.fill,
      //                   ),
      //                 ),
      //               ),
      //               Text(
      //                 "holi",
      //                 style: TextStyle(
      //                   color: Colors.white,
      //                   fontSize: 13.sp,
      //                   fontFamily: "Poppins-Medium",
      //                 ),
      //               )
      //             ],
      //           ),
      //           Column(
      //             children: [
      //               Stack(
      //                 children: [
      //                   Container(
      //                     height: 50.h,
      //                     width: 50.h,
      //                     margin: EdgeInsets.only(left: 70.w),
      //                     decoration: BoxDecoration(
      //                       shape: BoxShape.circle,
      //                       color: Colors.transparent,
      //                       border: Border.all(
      //                           color: Colors.white.withOpacity(0.4),
      //                           width: 2.w),
      //                       image: const DecorationImage(
      //                         image: ExactAssetImage('assets/images/man2.png'),
      //                         fit: BoxFit.cover,
      //                       ),
      //                     ),
      //                     child: Container(
      //                       decoration: BoxDecoration(
      //                         shape: BoxShape.circle,
      //                         color: Colors.white.withOpacity(0.4),
      //                       ),
      //                     ),
      //                   ),
      //                   Container(
      //                     height: 50.h,
      //                     width: 50.h,
      //                     margin: EdgeInsets.only(left: 55.w),
      //                     decoration: BoxDecoration(
      //                       shape: BoxShape.circle,
      //                       color: Colors.transparent,
      //                       border: Border.all(
      //                           color: Colors.white.withOpacity(0.6),
      //                           width: 2.w),
      //                       image: const DecorationImage(
      //                         image: ExactAssetImage('assets/images/man4.png'),
      //                         fit: BoxFit.cover,
      //                       ),
      //                     ),
      //                     child: Container(
      //                       decoration: BoxDecoration(
      //                           shape: BoxShape.circle,
      //                           color: Colors.white.withOpacity(0.3)),
      //                     ),
      //                   ),
      //                   Container(
      //                     height: 50.h,
      //                     width: 50.h,
      //                     margin: EdgeInsets.only(left: 35.w),
      //                     decoration: BoxDecoration(
      //                       shape: BoxShape.circle,
      //                       color: Colors.transparent,
      //                       border: Border.all(
      //                           color: Colors.white.withOpacity(0.8),
      //                           width: 2.w),
      //                       image: const DecorationImage(
      //                         image: ExactAssetImage('assets/images/man5.png'),
      //                         fit: BoxFit.cover,
      //                       ),
      //                     ),
      //                     child: Container(
      //                       decoration: BoxDecoration(
      //                           shape: BoxShape.circle,
      //                           color: Colors.white.withOpacity(0.2)),
      //                     ),
      //                   ),
      //                   Container(
      //                     height: 50.h,
      //                     width: 50.h,
      //                     margin: EdgeInsets.only(left: 10.w),
      //                     decoration: BoxDecoration(
      //                       shape: BoxShape.circle,
      //                       color: Colors.transparent,
      //                       border: Border.all(color: Colors.white, width: 2.w),
      //                     ),
      //                     child: ClipRRect(
      //                       borderRadius: BorderRadius.all(
      //                         Radius.circular(40.0.r),
      //                       ),
      //                       child: Image.asset(
      //                         "assets/images/girl.png",
      //                         fit: BoxFit.fill,
      //                       ),
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //               Text(
      //                 "robert and 9 more",
      //                 style: TextStyle(
      //                   color: Colors.white.withOpacity(0.8),
      //                   fontSize: 13.sp,
      //                   fontFamily: "Poppins-Medium",
      //                 ),
      //               )
      //             ],
      //           ),
      //         ],
      //       ),
      //     ),
      //     Positioned(
      //       bottom: 20.h,
      //       child: Row(
      //         children: [
      //           Container(
      //             margin: EdgeInsets.only(left: 20.w),
      //             height: 30.h,
      //             width: 60.w,
      //             decoration: const BoxDecoration(
      //               color: Color(0xffd2d0ce),
      //               borderRadius: BorderRadius.all(
      //                 Radius.circular(20),
      //               ),
      //             ),
      //             child: const Icon(
      //               Icons.search,
      //               color: Colors.white,
      //             ),
      //           ),
      //           Container(
      //             margin: EdgeInsets.only(left: 10.w),
      //             height: 30.h,
      //             width: 280.w,
      //             color: Colors.transparent,
      //             child: ListView.builder(
      //               physics: const BouncingScrollPhysics(),
      //               scrollDirection: Axis.horizontal,
      //               itemCount: catagory.length,
      //               itemBuilder: (context, index) {
      //                 return GestureDetector(
      //                   onTap: () {
      //                     // setState(() {
      //                     selected = index;
      //                     // });
      //                   },
      //                   child: Container(
      //                     margin: EdgeInsets.only(right: 10.w),
      //                     height: 30.h,
      //                     decoration: BoxDecoration(
      //                       color: selected == index
      //                           ? const Color(0xffd2d0ce)
      //                           : Colors.white.withOpacity(0.2),
      //                       border: Border.all(
      //                           color: selected == index
      //                               ? Colors.transparent
      //                               : Colors.white,
      //                           width: 1),
      //                       borderRadius: BorderRadius.all(
      //                         Radius.circular(20.r),
      //                       ),
      //                     ),
      //                     child: Center(
      //                       child: Padding(
      //                         padding: EdgeInsets.symmetric(horizontal: 10.w),
      //                         child: Text(
      //                           catagory[index],
      //                           style: TextStyle(
      //                               color: selected == index
      //                                   ? Colors.black
      //                                   : Colors.white,
      //                               fontSize: 13.sp,
      //                               fontFamily: "Poppins-Medium"),
      //                         ),
      //                       ),
      //                     ),
      //                   ),
      //                 );
      //               },
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}

class SmallVideoWidget extends StatefulWidget {
  SmallVideoWidget({Key? key, required this.url, required this.videos})
      : super(key: key);
  String url;
  List videos;

  @override
  State<SmallVideoWidget> createState() => _SmallVideoWidgetState();
}

class _SmallVideoWidgetState extends State<SmallVideoWidget> {
  VideoPlayerController? videoPlayerController;

  @override
  void initState() {
    videoPlayerController = VideoPlayerController.network(widget.url)
      ..initialize()
      ..setLooping(true);
    super.initState();
  }

  @override
  void dispose() {
    videoPlayerController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return VideoPlayScreen(
              videoData: videoPlayerController!,
              videos: widget.videos,
            );
          },
        ));
      },
      child: AspectRatio(
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
            child: VideoPlayer(videoPlayerController!),
          ),
        ),
      ),
    );
  }
}
