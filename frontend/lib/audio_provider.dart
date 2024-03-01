// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:flutter/material.dart';
// import 'package:front_end/managePermission.dart';
// import 'package:front_end/manageStorage.dart';
// import 'package:record/record.dart';

// class AudioProvider extends ChangeNotifier {
//   final Record _record = Record();
//   bool _isRecording = false;
//   String _afterRecordingFilePath = '';

//   bool get isRecording => _isRecording;
//   String get recordedFilePath => _afterRecordingFilePath;

//   void showToast(String text,
//       {bool shortToast = true,
//       fromBottom = true,
//       Color color = const Color(0xff4BB543),
//       Color textColor = Colors.white}) {
//     Fluttertoast.showToast(
//         msg: text,
//         toastLength: shortToast ? Toast.LENGTH_SHORT : Toast.LENGTH_SHORT,
//         gravity: fromBottom ? ToastGravity.BOTTOM : ToastGravity.TOP,
//         backgroundColor: color,
//         textColor: textColor,
//         fontSize: 16.0);
//   }

//   void cleanOldData() {
//     _afterRecordingFilePath = '';
//     notifyListeners();
//   }

//   void recordVoice() async {
//     final _isPermitted = (await PermissionManagement.recordingPermission()) &&
//         (await PermissionManagement.storagePermission());

//     if (!_isPermitted) return;

//     if (!(await _record.hasPermission())) return;

//     final _voiceDirPath = await StorageManagement.getaudioDirectory;
//     final _voiceFilePath = StorageManagement.createRecordAudioPath(
//         dirPath: _voiceDirPath, fileName: 'audio_message');

//     await _record.start(path: _voiceFilePath);
//     _isRecording = true;
//     notifyListeners();

//     showToast('Recording Started!');
//   }

//   stopRecording() async {
//     String? _audioFilePath;

//     if (await _record.isRecording()) {
//       _audioFilePath = await _record.stop();
//       showToast('Recording Stopped');
//     }

//     print('Audio file path: $_audioFilePath');

//     _isRecording = false;
//     _afterRecordingFilePath = _audioFilePath ?? '';
//     notifyListeners();
//   }
// }
