import 'package:flutter/material.dart';

import '../models/flock_data_model.dart';

abstract class MyItem {
  Widget buildItem(FlockDataModel flock);
  void converting(BuildContext context);
  String get getTitle;
  Widget buildFiltration();
  String get getLink;
  Map<String, dynamic> toJson();
  fromJson(Map<String, dynamic> json);
}
