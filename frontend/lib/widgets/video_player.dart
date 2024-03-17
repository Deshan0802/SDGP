import 'dart:async';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String api;
  final Function resetApi;
  const VideoPlayerScreen(
      {super.key, required this.api, required this.resetApi});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  String _api = '';

  @override
  void initState() {
    super.initState();
    _api = widget.api;
    // _initializeVideoPlayer(_api);
  }

  @override
  void didUpdateWidget(VideoPlayerScreen oldWidget) {
    // print("update");
    super.didUpdateWidget(oldWidget);
    if (widget.api != '' && widget.api != oldWidget.api) {
      // print("update trigger");
      setState(() {
        _api = widget.api;
      });
      _initializeVideoPlayer(_api);
    }
  }

  void _initializeVideoPlayer(String api) {
    if (api != '') {
      // print("vid widget : " + api);
      _controller = VideoPlayerController.networkUrl(Uri.parse(api));
      _initializeVideoPlayerFuture = _controller.initialize();
      _controller.setLooping(true);
    } else {
      widget.resetApi();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _api != ''
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
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    if (_controller.value.isPlaying) {
                      _controller.pause();
                    } else {
                      _controller.play();
                    }
                  });
                },
                child: Icon(
                  _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                ),
              ),
            ],
          )
        : Text("Type & Generate");
  }
}
