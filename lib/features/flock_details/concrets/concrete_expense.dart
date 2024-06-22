import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widgets/search_bar.dart';
import '../models/expense_model.dart';
import '../models/flock_data_model.dart';
import '../widgets/items/expneses_item.dart';
import 'abstract_widget.dart';


class ConcreteExpense implements MyItem {
  @override
  Widget buildItem(FlockDataModel flock) {
    return ExpenseItem(flock: flock as ExpenseModel);
  }

  @override
  Future<void> converting(BuildContext context) async {
    // await BlocProvider.of<FlocksDataCubit>(context).getExpenses();
  }
  
  @override
  String get getTitle => 'Expenses';
  
  @override
  Widget buildFiltration() {
    return const CustomSearchBar(hintText: 'Expenses');
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
