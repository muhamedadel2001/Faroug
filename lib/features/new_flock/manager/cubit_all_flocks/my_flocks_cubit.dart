import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:finalproject/features/new_flock/data/all_flocks_api.dart';
import 'package:finalproject/features/new_flock/data/flock_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'my_flocks_state.dart';

class MyFlocksCubit extends Cubit<MyFlocksState> {
  MyFlocksCubit(this.allFlocksApi) : super(MyFlocksInitial());
  final AllFlocksApi allFlocksApi;
  final List<FlockModel> myFlocks = [];
  getAllFlocks() async {
    try {
    emit(MyFlocksLoading());
      Map<String, dynamic> data = await allFlocksApi.getAllFlocks();
      miniRepo(data["Flocks"]);
      emit(MyFlocksSuccess(myFlocks: myFlocks));
    } on DioException catch (e) {
      if (e.response != null && e.response!.statusCode != null) {
        int statusCode = e.response!.statusCode!;
        String error = errorMsg(statusCode);
        emit(MyFlocksFailed(errMsg: error));
      } else {
        emit(MyFlocksFailed(errMsg: 'Oops something went wrong !!'));
      }
    }
  }

  miniRepo(List<dynamic> jsonList) {
    for (int i = 0; i < jsonList.length; i++) {
      myFlocks.add(FlockModel.flockModelfromJson(jsonList[i]));
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

}

