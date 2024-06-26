abstract class FlockDataModel {
  String get getLink;
  String get getDeleteLink;
  String get getId;
  FlockDataModel fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson();
}
