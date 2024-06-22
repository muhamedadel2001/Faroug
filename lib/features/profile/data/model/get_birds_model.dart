import 'dart:convert';
GetBirdsModel getBirdsModelFromJson(String str) => GetBirdsModel.fromJson(json.decode(str));
String getBirdsModelToJson(GetBirdsModel data) => json.encode(data.toJson());
class GetBirdsModel {
  GetBirdsModel({
      num? numberOfBirds,}){
    _numberOfBirds = numberOfBirds;
}

  GetBirdsModel.fromJson(dynamic json) {
    _numberOfBirds = json['numberOfBirds'];
  }
  num? _numberOfBirds;

  num? get numberOfBirds => _numberOfBirds;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['numberOfBirds'] = _numberOfBirds;
    return map;
  }

}