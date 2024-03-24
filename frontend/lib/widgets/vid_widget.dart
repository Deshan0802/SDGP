import 'dart:async';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String url;
  final Function resetUrl;
  const VideoPlayerWidget(
      {super.key, required this.url, required this.resetUrl});

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  String _url = '';

  @override
  void initState() {
    super.initState();
    _url = widget.url;
  }

  @override
  void didUpdateWidget(VideoPlayerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.url != '' && widget.url != oldWidget.url) {
      setState(() {
        _url = widget.url;
      });
      _initializeVideoPlayer(_url);
    }
  }

  void _initializeVideoPlayer(String url) {
    if (url != '') {
      _controller = VideoPlayerController.networkUrl(Uri.parse(url));
      _initializeVideoPlayerFuture = _controller.initialize();
      _controller.play();
      // _controller.setLooping(true);
    } else {
      widget.resetUrl();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _url != ''
        ? Column(
            children: [
              FutureBuilder(
                future: _initializeVideoPlayerFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
              // FloatingActionButton(
              //   onPressed: () {
              //     setState(() {
              //       if (_controller.value.isPlaying) {
              //         _controller.pause();
              //       } else {
              //         _controller.play();
              //       }
              //     });
              //   },
              //   child: Icon(
              //     _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
              //   ),
              // ),
            ],
          )
        : const Text("ASL Translation");
  }
}
