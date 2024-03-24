import 'dart:async';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class VideoPlayerScreen extends StatefulWidget {
  final String api;
  final Function resetApi;
  const VideoPlayerScreen({
    super.key,
    required this.api,
    required this.resetApi,
  });

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  String _api = '';
  bool _isRequestInProgress = false;
  bool _isPlaying = false;
  bool _isPrepared = false;
  bool _isError = false;

  @override
  void initState() {
    super.initState();
    _api = widget.api;
    // _controller = n
    _controller = VideoPlayerController.networkUrl(Uri.parse(''));
  }

  @override
  void didUpdateWidget(VideoPlayerScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.api != '' && widget.api != oldWidget.api) {
      setState(() {
        _api = widget.api;
        _isRequestInProgress = true;
        _isError = false;
      });
      processAndCreateASLVideo(_api);
    }
  }

  void processAndCreateASLVideo(_api) {
    http.get(Uri.parse(_api)).then((response) {
      if (response.statusCode == 200) {
        // If the server returned a 200 OK response,
        // parse the JSON.
        final data = jsonDecode(response.body);
        // Do something with the data
        _initializeVideoPlayer(
            "http://10.0.2.2:5000/getASLVideo?videoName=video.mp4");
        setState(() {
          _isRequestInProgress = false;
        });
      } else {
        // If the server did not return a 200 OK response,
        // throw an exception.
        throw Exception('Failed to load data');
      }
    }).catchError((error) {
      // Handle any errors that occurred during the request.
      print('Error: $error');
      setState(() {
        _isError = true;
        _isRequestInProgress = false;
      });
    });
  }

  void _initializeVideoPlayer(String api) {
    if (api != '') {
      _controller = VideoPlayerController.networkUrl(Uri.parse(api))
        ..addListener(_videoReadyEventListener)
        ..initialize().then((_) {
          setState(() {
            _isError = false;
            _controller.addListener(_videoPlayEventListener);
          });
        }).catchError((error) {
          _showErrorDialog('Failed to load video');
          setState(() {
            _isError = true;
          });
        });
    } else {
      widget.resetApi();
    }
  }

  void _videoReadyEventListener() {
    final isPlaying = _controller.value.isPlaying;
    final isPrepared = _controller.value.isInitialized;
    final hasError = _controller.value.hasError;

    if (hasError) {
      _showErrorDialog('Error initializing video player');
      setState(() {
        _isError = true;
      });
      return;
    }

    if (isPrepared && !_isPrepared) {
      _isPrepared = true;
      if (isPlaying) {
        _controller.pause();
      }
    }

    if (!_controller.value.isPlaying &&
        _controller.value.position == _controller.value.duration) {
      setState(() {
        _controller.seekTo(Duration.zero);
        _isPlaying = false;
      });
    }
  }

  void _videoPlayEventListener() {
    if (!_controller.value.isPlaying &&
        _controller.value.position == _controller.value.duration) {
      setState(() {
        _controller.seekTo(Duration.zero);
        _isPlaying = false;
      });
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.removeListener(_videoReadyEventListener);
    _controller.removeListener(_videoPlayEventListener);
    _controller.dispose();
    super.dispose();
  }

  void stopPlaying() {
    setState(() {
      if (_controller.value.isPlaying) {
        _controller.pause();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return _api != ''
        ? Column(
            children: [
              _isRequestInProgress && !_isError
                  ? CircularProgressIndicator()
                  : Container(),
              !_isRequestInProgress && _isError
                  ? Text("Prompted text was unable to be Translated")
                  : Container(),
              Container(
                child: _controller.value.isInitialized &&
                        !_isRequestInProgress &&
                        !_isError
                    ? AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      )
                    : Container(),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    if (_controller.value.isPlaying) {
                      _controller.pause();
                      _isPlaying = false;
                    } else {
                      _controller.play();
                      _isPlaying = true;
                    }
                  });
                },
                child: Icon(
                  _isPlaying ? Icons.pause : Icons.play_arrow,
                ),
              ),
            ],
          )
        : Text("Type & Generate");
  }
}
