part of 'login_cubit_cubit.dart';

@immutable
sealed class LoginCubitState {}

final class LoginCubitInitial extends LoginCubitState {}

final class LoginSuccessed extends LoginCubitState {
  final String _userToken;
  final String _id;
  final String _city;

  LoginSuccessed(this._userToken, this._id, this._city,);
  saveToken() {
    SharedPrefUtil().saveToken(_userToken);
    SharedPrefUtil().saveId(_id);
    SharedPrefUtil().saveCity(_city);
  }
}

final class LoginFailed extends LoginCubitState {
  final String errorMsg;
  LoginFailed({required this.errorMsg});
}

final class LoginLoading extends LoginCubitState {}
