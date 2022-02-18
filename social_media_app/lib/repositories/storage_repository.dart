import 'dart:io' as io;
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:image_picker/image_picker.dart';

class StorageRepository {
  Future<String> uploadFile(XFile file) async {
    try {
      final fileName = DateTime.now().toIso8601String();
      final result = await Amplify.Storage.uploadFile(local: io.File(file.path), key: fileName + '.jpg');
      return result.key;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> getUrlForFile(String imageKey) async {
    try {
      final result = await Amplify.Storage.getUrl(key: imageKey);
      return result.url;
    } catch (e) {
      rethrow;
    }
  }
}
