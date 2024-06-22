import 'flock_data_model.dart';

class FeedServeModel extends FlockDataModel {
  final String? name;
  final double? amount;
  final String? date;
  FeedServeModel({
    this.name,
    this.amount,
    this.date,
  });

  @override
  fromJson(Map<String, dynamic> json) {}

  @override
  Map<String, dynamic> toJson() {
    return <String, dynamic>{};
  }
}
