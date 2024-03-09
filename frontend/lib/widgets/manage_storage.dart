import 'dart:io';
import 'dart:math';

import 'package:path_provider/path_provider.dart';

class StorageManagement {
  static Future<String> createDirectory({required String directoryName}) async {
    final Directory? directory = await getExternalStorageDirectory();

    final formattedDirectoryName = '/$directoryName/';

    final Directory newDirectory =
        await Directory(directory!.path + formattedDirectoryName).create();

    return newDirectory.path;
  }

  static get getaudioDirectory async =>
      await createDirectory(directoryName: 'recordings');

  static String createRecordAudioPath(
          {required String dirPath, required String fileName}) =>
      """$dirPath${fileName.substring(0, min(fileName.length, 100))}_${DateTime.now()}.aac""";
}
