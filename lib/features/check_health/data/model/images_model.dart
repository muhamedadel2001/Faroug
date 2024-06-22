import 'dart:convert';
ImagesModel imagesModelFromJson(String str) => ImagesModel.fromJson(json.decode(str));

class ImagesModel {
  ImagesModel({
      String? type,
      num? probability,}){
    _class = type;
    _probability = probability;
}

  ImagesModel.fromJson(dynamic json) {
    _class = json['class'];
    _probability = json['probability'];
  }
  String? _class;
  num? _probability;

  String? get type => _class;
  num? get probability => _probability;



}