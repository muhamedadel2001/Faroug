import 'dart:io';

import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerHelper {
  File? image;
  static Future<File?> pickImage(ImageSource source) async {
    try {
      final pickedImage = await ImagePicker().pickImage(source: source);
      if (pickedImage == null) {
        return null;
      }
      return  File(pickedImage.path);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
      return null;
    }
  }
}
