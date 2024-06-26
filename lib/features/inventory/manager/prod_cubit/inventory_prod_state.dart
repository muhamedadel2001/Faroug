part of 'inventory_prod_cubit.dart';

@immutable
abstract class InventoryProdState {}

class InventoryInitial extends InventoryProdState {}
class InventoryChangeButton extends InventoryProdState {}
class ProductionsLoading extends InventoryProdState {}
class GetProdItemsSuccess extends InventoryProdState {}
class GetProdItemsFailed extends InventoryProdState {}
class CreateProdItemsLoading extends InventoryProdState {}
class CreateProdItemsSuccess extends InventoryProdState {}
class CreateProdItemsFailed extends InventoryProdState {}
class GetPercentageSuccess extends InventoryProdState {}
class GetPercentageFailed extends InventoryProdState {}
class GetPercentageLoading extends InventoryProdState {}
