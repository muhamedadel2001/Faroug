import 'package:flutter/material.dart';

import '../../../core/widgets/search_bar.dart';
import '../models/flock_data_model.dart';
import '../models/vaccinantion_model.dart';
import '../widgets/items/vaccination_and_medicine_item.dart';
import 'abstract_widget.dart';





class ConcreteVaccination implements MyItem {
  @override
  Widget buildItem(FlockDataModel flock) {
    return VaccinationItem(flock: flock as VaccintatioModel);
  }

  @override
  void converting(BuildContext context) {
    // BlocProvider.of<FlocksDataCubit>(context).getIncome();
  }

  @override
  String get getTitle => 'Vaccination';

  @override
  Widget buildFiltration() {
    return const CustomSearchBar(hintText: 'Vaccination');
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
