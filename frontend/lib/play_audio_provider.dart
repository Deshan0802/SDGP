import 'dart:io';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class PlayAudioProvider extends ChangeNotifier {
  final _audioPlayer = AudioPlayer();
  double _currentAudioPlaying = 0.0;
  bool _isAudioPlaying = false;
  String _audioFilePath = '';

  bool get isAudioPlaying => _isAudioPlaying;

  String get currentAudioPath => _audioFilePath;

  setAudioFilePath(String filePath) {
    _audioFilePath = filePath;
    notifyListeners();
  }

  clearCurrentAudioPath() {
    _audioFilePath = '';
    notifyListeners();
  }

  playAudio(File incomingAudioFile, {bool update = true}) async {
    try {
      _audioPlayer.positionStream.listen((event) {
        _currentAudioPlaying = event.inMicroseconds.ceilToDouble();
        if (update) notifyListeners();
      });

      _audioPlayer.playerStateStream.listen((event) {
        if (event.processingState == ProcessingState.completed) {
          _audioPlayer.stop();
          _reset();
        }
      });

      if (_audioFilePath != incomingAudioFile.path) {
        setAudioFilePath(incomingAudioFile.path);

        await _audioPlayer.setFilePath(incomingAudioFile.path);
        updateAudioPlayingStatus(true);
        await _audioPlayer.play();
      }

      if (_audioPlayer.processingState == ProcessingState.idle) {
        await _audioPlayer.setFilePath(incomingAudioFile.path);
        updateAudioPlayingStatus(true);

        await _audioPlayer.play();
      } else if (_audioPlayer.playing) {
        updateAudioPlayingStatus(false);

        await _audioPlayer.pause();
      } else if (_audioPlayer.processingState == ProcessingState.ready) {
        updateAudioPlayingStatus(true);

        await _audioPlayer.play();
      } else if (_audioPlayer.processingState == ProcessingState.completed) {
        _reset();
      }
    } catch (e) {
      print('Error in playaudio: $e');
    }
  }

  void _reset() {
    _currentAudioPlaying = 0.0;
    notifyListeners();

    updateAudioPlayingStatus(false);
  }

  updateAudioPlayingStatus(bool update) {
    _isAudioPlaying = update;
    notifyListeners();
  }

  get currentLoadingStatus {
    final _currentTime = (_currentAudioPlaying /
        (_audioPlayer.duration?.inMicroseconds.ceilToDouble() ?? 1.0));

    return _currentTime > 1.0 ? 1.0 : _currentTime;
  }
}
