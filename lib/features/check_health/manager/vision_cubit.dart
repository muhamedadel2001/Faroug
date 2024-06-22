import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:finalproject/features/check_health/data/model/images_model.dart';
import 'package:finalproject/features/check_health/data/vision_api.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'vision_state.dart';

class VisionCubit extends Cubit<VisionState> {
  VisionCubit() : super(VisionInitial());
  ImagesModel imagesModel = ImagesModel();
  static VisionCubit get(context) => BlocProvider.of<VisionCubit>(context);
  File? selectedImage;
  Future<File?> pickImageFirst() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      emit(PathSaved());
      return File(pickedFile.path);
    }
    return null;
  }

  Future<void> selectAndUpload() async {
    final pickedImage = await pickImageFirst();
    if (pickedImage != null) {
      selectedImage = pickedImage!;
      await VisionApi.uploadImage(pickedImage).then((value) {
        imagesModel = value;
        emit(SelectAndUplaoded());
      }).catchError((error){
        emit(Failed());
      });

    }
  }
}
