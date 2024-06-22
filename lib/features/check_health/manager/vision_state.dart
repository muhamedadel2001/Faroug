part of 'vision_cubit.dart';

@immutable
abstract class VisionState {}

class VisionInitial extends VisionState {}
class PathSaved extends VisionState {}
class SelectAndUplaoded extends VisionState {}
class LoadingResult extends VisionState {}
class Failed extends VisionState {}
