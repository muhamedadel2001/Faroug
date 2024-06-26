part of 'water_cubit.dart';

@immutable
sealed class WaterState {}

final class WaterInitial extends WaterState {}

final class WaterLoading extends WaterState {}

final class WaterSuccess extends WaterState {
  final double liters;
  final double waterUsed;

  WaterSuccess({required this.liters, required this.waterUsed});
}

final class WaterFailed extends WaterState {}
