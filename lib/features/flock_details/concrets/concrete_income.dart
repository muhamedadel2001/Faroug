import 'package:flutter/material.dart';

import '../../../core/widgets/search_bar.dart';
import '../models/flock_data_model.dart';
import '../models/income_model.dart';
import '../widgets/items/income_item.dart';
import 'abstract_widget.dart';


class ConcreteIncome implements MyItem {
  @override
  Widget buildItem(FlockDataModel flock) {
    return IncomeItem(flock: flock as IncomeModel);
  }

  @override
  void converting(BuildContext context) {
    // BlocProvider.of<FlocksDataCubit>(context).getIncome();
  }

  @override
  String get getTitle => 'Income';

  @override
  Widget buildFiltration() {
    return const CustomSearchBar(hintText: 'Income');
  }
  
  @override
  fromJson(Map<String, dynamic> json) {
    
  }
  
  @override
  void fromjson() {
   
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
