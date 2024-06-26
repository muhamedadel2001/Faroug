import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:finalproject/features/flock_details/data/api/records_api.dart';
import 'package:finalproject/features/flock_details/data/models/flock_data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'records_state.dart';

class RecordsCubit extends Cubit<RecordsState> {
  RecordsCubit(this.flockDataModel) : super(RecordsInitial());
  final FlockDataModel flockDataModel;
  List<FlockDataModel> recordsList = [];

  getRecord(String url) async {
    emit(RecordsLoading());
    RecordsApi recordsApi = RecordsApi(url);
    try {
      final Map<String, dynamic> data = await recordsApi.getRecord();
      miniRepo(data[flockDataModel.getLink]);
      emit(RecordsSuccess(recordsList));
    } on DioException catch (e) {
      catchingError(e);
    }
  }

  void deleteRecord(
      String flockId, String recordId, BuildContext context) async {
    try {
      RecordsApi recordsApi = RecordsApi(
          '${flockDataModel.getDeleteLink}/delete/$flockId/$recordId');
      await recordsApi.deleteRecord();
      staticDelete(recordId);
      emit(RecordsSuccess(recordsList));
    } on DioException catch (e) {
      deleteCatchingError(e, context);
    }
  }

  List<FlockDataModel> staticDelete(String recordId) {
    for (int i = 0; i < recordsList.length; i++) {
      if (recordsList[i].getId == recordId) {
        recordsList.removeAt(i);
      }
    }
    return recordsList;
  }

  void miniRepo(List jsonList) {
    recordsList.clear();
    for (int i = 0; i < jsonList.length; i++) {
      recordsList.add(flockDataModel.fromJson(jsonList[i]));
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
      emit(RecordsFailed(errMsg: error));
    } else {
      emit(RecordsFailed(errMsg: 'Oops something went wrong !!'));
    }
  }

  deleteCatchingError(DioException e, BuildContext context) {
    if (e.response != null && e.response!.statusCode != null) {
      int statusCode = e.response!.statusCode!;
      String error = errorMsg(statusCode);
      log(error);
      // MySnackBar(clr: Colors.red).showSnackBar(error, context);
    } else {
      log(e.toString());
      // MySnackBar(clr: Colors.red)
      // .showSnackBar('Oops something went wrong !!', context);
    }
  }
}
