part of 'registration_cubit.dart';

@immutable
sealed class RegistrationState {}

final class RegistrationInitial extends RegistrationState {}

final class RegistrationSuccessed extends RegistrationState {}

final class RegistrationFailed extends RegistrationState {
  final String errorMsg;
  RegistrationFailed({required this.errorMsg});
}

final class RegistrationLoading extends RegistrationState {}
