import 'package:bloc/bloc.dart';
import 'package:finalproject/features/inventory/data/model/cons_model/inventory_cons_model.dart';
import 'package:finalproject/features/inventory/presentation/inventory_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../../core/utilities/statics.dart';
import '../../data/inventory_api.dart';
part 'inventory_cons_state.dart';

class InventoryConsCubit extends Cubit<InventoryConsState> {
  InventoryConsCubit() : super(InventoryConsInitial());
  static InventoryConsCubit get(context) =>
      BlocProvider.of<InventoryConsCubit>(context);
  List<ConsumptionInventories> consList = [];
  InventoryApi inventoryApi = InventoryApi();
  InventoryConsModel inventoryConsModel = InventoryConsModel();
  getConsumptions() async {
    emit(ConsumptionLoading());
    await inventoryApi.getConsumption().then((value) {
      inventoryConsModel = value;
      consList = inventoryConsModel.consumptionInventories!;
      emit(GetConsItemsSuccess());
    }).catchError((error) {
      emit(GetConsItemsFailed());
    });
  }

  createConsumptions( ) async {
    emit(CreateConsItemsLoading());
    await inventoryApi.createConsumption(body: {
      "Name": nameText.text,
      "Category": categoryText.text,
      "Quantity": quantityText.text,
      "Price": priceText.text
    }).then((value) {
      emit(CreateConsItemsSuccess());
      nameText.clear();
      categoryText.clear();
      priceText.clear();
      quantityText.clear();
    }).catchError((error) {
      emit(CreateConsItemsFailed());
    });
  }
}
