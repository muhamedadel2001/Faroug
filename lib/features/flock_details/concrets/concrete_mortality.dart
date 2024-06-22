import 'package:flutter/material.dart';

import '../models/flock_data_model.dart';
import '../models/mortality_model.dart';
import '../widgets/filtration/mortality_filtration_bar.dart';
import '../widgets/items/mortality_item.dart';
import 'abstract_widget.dart';

class ConcreteMortality implements MyItem {
  @override
  Widget buildItem(FlockDataModel flock) {
    return MortalityItem(flock: flock as MortalityModel);
  }

  @override
  void converting(BuildContext context) {
    // BlocProvider.of<FlocksDataCubit>(context).getIncome();
  }

  @override
  String get getTitle => 'Mortality';

  @override
  Widget buildFiltration() {
    return const MortalityFiltrationBar();
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
