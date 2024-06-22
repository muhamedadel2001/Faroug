import 'dart:io';

import 'package:dio/dio.dart';
import 'package:finalproject/features/check_health/data/model/images_model.dart';

class VisionApi {
  static Future<dynamic> uploadImage(File imageFile) async {
    final dio = Dio(BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
    ));
    const uri =
        'https://model-rvwh.onrender.com/predict'; // Replace with your API endpoint

    try {
      FormData formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          imageFile.path,
          filename: imageFile.path.split('/').last,
        ),
      });

      Response response = await dio.post(
        uri,
        data: formData,
      );

      if (response.statusCode == 200) {
        print('Image uploaded successfully');
      } else {
        print('Image upload failed with status: ${response.statusCode}');
      }
      print(response.data);
      return ImagesModel.fromJson(response.data);
    } catch (e) {
      print('Image upload failed with error: $e');
    }
  }
}
