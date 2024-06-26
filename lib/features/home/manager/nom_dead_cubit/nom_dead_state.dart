part of 'nom_dead_cubit.dart';

@immutable
sealed class NomDeadState {}

final class NomDeadInitial extends NomDeadState {}

final class NomDeadLoading extends NomDeadState {}

final class NomDeadSuccess extends NomDeadState {
  final int nom;

  NomDeadSuccess(this.nom);
}

final class NomDeadFailed extends NomDeadState {
  final String errMsg;

  NomDeadFailed({required this.errMsg});
}
