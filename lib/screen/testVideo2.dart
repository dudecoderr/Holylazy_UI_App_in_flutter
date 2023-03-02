// ignore_for_file: file_names

import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';


class FlickMultiPlayer extends StatefulWidget {
  const FlickMultiPlayer({Key? key, required this.url, this.image, required this.isheaderVideo, required this.flickMultiManager}) : super(key: key);

  final String url;
  final String? image;
  final bool isheaderVideo;
  final FlickMultiManager flickMultiManager;

  @override
  _FlickMultiPlayerState createState() => _FlickMultiPlayerState();
}

class _FlickMultiPlayerState extends State<FlickMultiPlayer> {
  FlickManager? flickManager;

  @override
  void initState() {
    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.network(widget.url,videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true,
      )),

      autoPlay: false,
      onVideoEnd: (){
        flickManager?.flickControlManager?.play();
      }

    );
    widget.flickMultiManager.init(flickManager!);
    super.initState();
  }

  @override
  void dispose() {
    widget.flickMultiManager.remove(flickManager!);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("This is value of Headers ${widget.isheaderVideo}");
    return VisibilityDetector(
      key: ObjectKey(flickManager),
      onVisibilityChanged: (visiblityInfo) {
        if (visiblityInfo.visibleFraction > 0.8) {
          widget.flickMultiManager.play(flickManager);
        } else {
          widget.flickMultiManager.pause();
        }
      },
      child: Container(
        height: MediaQuery.of(context).size.width,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.red,
          border: Border.all(width: 0.0),
          borderRadius: BorderRadius.circular(25),
        ),
        foregroundDecoration: widget.isheaderVideo
            ? BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).scaffoldBackgroundColor,
                    Theme.of(context).scaffoldBackgroundColor.withOpacity(0.0),
                    Theme.of(context).scaffoldBackgroundColor.withOpacity(0.0),
                    Theme.of(context).scaffoldBackgroundColor
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0, 0.058, 0.95, 1],
                ),
              )
            : null,
        child: FlickVideoPlayer(
          flickManager: flickManager!,
          flickVideoWithControls: FlickVideoWithControls(

            videoFit: BoxFit.fill,
            playerLoadingFallback: Positioned.fill(
              child: Stack(
                children: <Widget>[
                  Positioned(
                    right: 10,
                    top: 10,
                    child: SizedBox(
                        width: 20,
                        height: 20,
                        child: Shimmer.fromColors(
                          baseColor: Theme.of(context).unselectedWidgetColor.withOpacity(0.3),
                          highlightColor: Colors.pink,
                          child: Container(
                            color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
                          ),
                        )),
                  ),
                ],
              ),
            ),
            controls: FeedPlayerPortraitControls(
              flickMultiManager: widget.flickMultiManager,
              flickManager: flickManager,
            ),
          ),
          flickVideoWithControlsFullscreen: const FlickVideoWithControls(
            controls: FlickLandscapeControls(),
            iconThemeData: IconThemeData(
              size: 40,
              color: Colors.white,
            ),
            textStyle: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class FeedPlayerPortraitControls extends StatelessWidget {
  const FeedPlayerPortraitControls({Key? key, this.flickMultiManager, this.flickManager}) : super(key: key);

  final FlickMultiManager? flickMultiManager;
  final FlickManager? flickManager;

  @override
  Widget build(BuildContext context) {
    FlickDisplayManager displayManager = Provider.of<FlickDisplayManager>(context);
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          FlickAutoHideChild(
            showIfVideoNotInitialized: false,
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const FlickLeftDuration(),
              ),
            ),
          ),
          Expanded(
            child: FlickToggleSoundAction(
              toggleMute: () {
                flickMultiManager?.toggleMute();
                displayManager.handleShowPlayerControls();
              },
              child: const FlickSeekVideoAction(
                child: Center(child: FlickVideoBuffer()),
              ),
            ),
          ),
          FlickAutoHideChild(
            autoHide: true,
            showIfVideoNotInitialized: false,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: FlickSoundToggle(
                    toggleMute: () => flickMultiManager?.toggleMute(),
                    color: Colors.white,
                  ),
                ),
                // FlickFullScreenToggle(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FlickMultiManager {
  FlickMultiManager({
    Key? key,
    required this.mute,
  });

  bool mute = false;

  final List<FlickManager> _flickManagers = [];
  FlickManager? activeManager;

  init(FlickManager flickManager) {
    _flickManagers.add(flickManager);

    if (mute) {
      flickManager.flickControlManager?.mute();
    } else {
      flickManager.flickControlManager?.unmute();
    }
    if (_flickManagers.length == 1) {
      // play(flickManager);
    }
  }

  remove(FlickManager flickManager) {
    if (activeManager == flickManager) {
      activeManager = null;
    }
    flickManager.dispose();
    _flickManagers.remove(flickManager);
  }

  togglePlay(FlickManager flickManager) {
    if (activeManager?.flickVideoManager?.isPlaying == true && flickManager == activeManager) {
      pause();
    } else {
      play(flickManager);
    }
  }

  pause() {
    activeManager?.flickControlManager?.pause();
  }

  play([FlickManager? flickManager]) {
    if (flickManager != null) {
      activeManager?.flickControlManager?.pause();
      activeManager = flickManager;
    }

    if (mute) {
      activeManager?.flickControlManager?.mute();
    } else {
      activeManager?.flickControlManager?.unmute();
    }

    activeManager?.flickControlManager?.play();
  }

  toggleMute() {
    activeManager?.flickControlManager?.toggleMute();
    mute = activeManager?.flickControlManager?.isMute ?? false;
    if (mute) {
      for (var manager in _flickManagers) {
        manager.flickControlManager?.mute();
      }
    } else {
      for (var manager in _flickManagers) {
        manager.flickControlManager?.unmute();
      }
    }
  }
}
