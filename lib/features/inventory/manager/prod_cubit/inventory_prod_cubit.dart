import 'package:bloc/bloc.dart';
import 'package:finalproject/core/utilities/statics.dart';
import 'package:finalproject/features/inventory/data/inventory_api.dart';
import 'package:finalproject/features/inventory/data/model/prod_model/inventory_prod_model.dart';
import 'package:finalproject/features/inventory/manager/cons_cubit/inventory_cons_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'inventory_prod_state.dart';

class InventoryProdCubit extends Cubit<InventoryProdState> {
  InventoryProdCubit() : super(InventoryInitial());
  static InventoryProdCubit get(context) =>
      BlocProvider.of<InventoryProdCubit>(context);
  bool onTapButton = true;
  int sumForEggs = 0;
  int sumForAll = 0;
  List<ProductionInventories> prodList = [];
  InventoryApi inventoryApi = InventoryApi();

  InventoryProdModel inventoryModel = InventoryProdModel();
  onTap(BuildContext context) {
    onTapButton = !onTapButton;
    emit(InventoryChangeButton());
    if (onTapButton == true) {
      InventoryConsCubit.get(context).getConsumptions();
    } else {
      getProductions();
    }
  }

  getProductions() async {
    emit(ProductionsLoading());
    await inventoryApi.getProduction().then((value) {
      inventoryModel = value;
      prodList = inventoryModel.productionInventories!;
      emit(GetProdItemsSuccess());
    }).catchError((error) {
      emit(GetProdItemsFailed());
    });
  }

  createProductions() async {
    emit(CreateProdItemsLoading());
    await inventoryApi.createProduction(body: {
      "Name": nameText.text,
      "Category": categoryText.text,
      "Quantity": quantityText.text,
      "Price": priceText.text
    }).then((value) {
      emit(CreateProdItemsSuccess());
      nameText.clear();
      categoryText.clear();
      priceText.clear();
      quantityText.clear();
    }).catchError((error) {
      emit(CreateProdItemsFailed());
    });
  }

  getPercentage() async {
    try {
      emit(GetPercentageLoading());
      await inventoryApi.getProduction().then((value) {
        inventoryModel = value;
        for (var item in inventoryModel.productionInventories!) {
          if (item.category == 'Eggs') {
            sumForEggs += item.quantity!.toInt();
            sumForAll += item.quantity!.toInt();
          } else {
            sumForAll += item.quantity!.toInt();
          }
        }
        emit(GetPercentageSuccess());
      });
    } catch (err) {
      emit(GetPercentageFailed());
    }
  }
}
