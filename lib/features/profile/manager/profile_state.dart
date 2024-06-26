part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ManagerInitial extends ProfileState {}
class GetProfileLoading extends ProfileState {}
class GetProfileSuccess extends ProfileState {}
class GetProfileFailed extends ProfileState {}
class UpdatedSuccess extends ProfileState {}
class UpdatedFailed extends ProfileState {}
class GetBirdsSuccess extends ProfileState {}
class SignOutSuccess extends ProfileState {}
class SignOutFailed extends ProfileState {}
