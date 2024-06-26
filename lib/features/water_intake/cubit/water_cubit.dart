import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:finalproject/features/water_intake/water_api.dart';
import 'package:meta/meta.dart';

part 'water_state.dart';

class WaterCubit extends Cubit<WaterState> {
  WaterCubit() : super(WaterInitial());
  WaterApi waterApi = WaterApi();
  double waterUsed = 0;
  double liters = 100;
  getWaterInTake() async {
    try {
      emit(WaterLoading());
      final Map<String, dynamic> data = await waterApi.getWaterInTake();
      log(data.toString());
      emit(WaterSuccess(liters: data['Liters'], waterUsed: data['waterUsed']));
    } on DioException catch (e) {
      catchingError(e);
    }
  }

  String errorMsg(int statusCode) {
    if (statusCode >= 500) {
      return 'Server error occured , please try again later.';
    } else if (statusCode == 401) {
      return 'Sorry , You don\'t have access on this page.';
    } else {
      return 'Oops something went wrong !!';
    }
  }

  catchingError(DioException e) {
    if (e.response != null && e.response!.statusCode != null) {
      int statusCode = e.response!.statusCode!;
      String error = errorMsg(statusCode);
      log(error);
      emit(WaterFailed());
    } else {
      log('oops');
      emit(WaterFailed());
    }
  }
}
