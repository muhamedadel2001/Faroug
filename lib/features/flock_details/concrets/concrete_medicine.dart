import 'package:flutter/material.dart';

import '../../../core/widgets/search_bar.dart';
import '../models/flock_data_model.dart';
import '../models/medicine_model.dart';
import '../widgets/items/medicine_item.dart';
import 'abstract_widget.dart';




class ConcreteMedicine implements MyItem {
  @override
  Widget buildItem(FlockDataModel flock) {
    return MedicineItem(flock: flock as MedicineModel);
  }

  @override
  void converting(BuildContext context) {
    // BlocProvider.of<FlocksDataCubit>(context).getIncome();
  }

  @override
  String get getTitle => 'Medicine';

  @override
  Widget buildFiltration() {
    return const CustomSearchBar(hintText: 'Medicine');
  }
  
  @override
  fromJson(Map<String, dynamic> json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }
  
  @override
  void fromjson() {
    // TODO: implement fromjson
  }
  
  @override
  // TODO: implement getLink
  String get getLink => throw UnimplementedError();
  
  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
