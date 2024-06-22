import 'package:dio/dio.dart';
import 'package:finalproject/features/inventory/data/model/cons_model/inventory_cons_model.dart';
import 'package:finalproject/features/inventory/data/model/prod_model/inventory_prod_model.dart';

import '../../../core/utilities/logic/api_services.dart';

class InventoryApi extends WebServices {
  final urlProd = 'ProInventory';
  final urlCons = 'conInventory';
  final urlProdCreate = 'ProInventory/create';
  final urlConsCreate = 'conInventory/create';
  Future<dynamic> getProduction() async {
    try {
      final Response response = await dio.get(
        urlProd,
        options: Options(validateStatus: (_) => true),
      );
      print(response.data);
      return InventoryProdModel.fromJson(response.data);
    } catch (err) {
      print('error is $err');
    }
  }

  Future<Map<String, dynamic>> createProduction(
      {required Map<String, dynamic> body}) async {
    final Response response = await dio.post(
      urlProdCreate,
      data: body,
      options: Options(validateStatus: (_) => true),
    );
    return response.data;
  }

  Future<dynamic> getConsumption() async {
    try {
      final Response response = await dio.get(
        urlCons,
        options: Options(validateStatus: (_) => true),
      );
      print(response.data);
      return InventoryConsModel.fromJson(response.data);
    } catch (err) {
      print('error is $err');
    }
  }

  Future<Map<String, dynamic>> createConsumption(
      {required Map<String, dynamic> body}) async {
    final Response response = await dio.post(
      urlConsCreate,
      data: body,
      options: Options(validateStatus: (_) => true),
    );
    return response.data;
  }
}
