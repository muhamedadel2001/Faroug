import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:finalproject/features/home/data/flock_info_api.dart';
import 'package:meta/meta.dart';

part 'flock_info_state.dart';

class FlockInfoCubit extends Cubit<FlockInfoState> {
  FlockInfoCubit(this.flockInfoApi) : super(FlockInfoInitial());
  final FlockInfoApi flockInfoApi;
  updateFlockStatus(String flockId, bool status) async {
    try {
      log(status.toString());
      emit(FlockInfoLoading());
      await flockInfoApi.updateFlockStatus(flockId, status);
      emit(FlockInfoSuccess());
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
      emit(FlockInfoFailed(errMsg: error));
    } else {
      emit(FlockInfoFailed(errMsg: 'Oops something went wrong !!'));
    }
  }
}
