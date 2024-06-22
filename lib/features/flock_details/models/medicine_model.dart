import 'flock_data_model.dart';

class MedicineModel extends FlockDataModel {
  final String? name;
  final int? price;
  MedicineModel({
    this.name,
    this.price,
  });
  @override
  fromJson(Map<String, dynamic> json) {}

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{};
  }}
