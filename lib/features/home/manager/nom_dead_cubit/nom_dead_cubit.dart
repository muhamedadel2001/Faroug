import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:finalproject/features/home/data/flock_info_api.dart';
import 'package:meta/meta.dart';

part 'nom_dead_state.dart';

class NomDeadCubit extends Cubit<NomDeadState> {
  NomDeadCubit(this.flockInfoApi) : super(NomDeadInitial());
  final FlockInfoApi flockInfoApi;
  int nomOfDead = 0;
  getNomOfDead(String flockId) async {
    try {
      emit(NomDeadLoading());
      nomOfDead = await flockInfoApi.getMortalityNom(flockId);
      emit(NomDeadSuccess(nomOfDead));
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
      emit(NomDeadFailed(errMsg: error));
    } else {
      emit(NomDeadFailed(errMsg: 'Oops something went wrong !!'));
    }
  }
}
