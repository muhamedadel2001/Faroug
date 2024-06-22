part of 'inventory_cons_cubit.dart';

@immutable
abstract class InventoryConsState {}

class InventoryConsInitial extends InventoryConsState {}
class ConsumptionLoading extends InventoryConsState {}
class GetConsItemsSuccess extends InventoryConsState {}
class GetConsItemsFailed extends InventoryConsState {}
class CreateConsItemsLoading extends InventoryConsState {}
class CreateConsItemsSuccess extends InventoryConsState {}
class CreateConsItemsFailed extends InventoryConsState {}
