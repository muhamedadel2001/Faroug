
import 'flock_data_model.dart';

class ExpenseModel extends FlockDataModel {
  String? name;
  int? price;
  ExpenseModel({
    this.name,
    this.price,
  });

  @override
  ExpenseModel fromJson(Map<String, dynamic> json) {
    ExpenseModel expense = ExpenseModel();
    expense.name = json['name'] != null ? json['name'] as String : null;
    expense.price = json['price'] != null ? json['price'] as int : null;
    return expense;
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['price'] = price;
    return data;
  }
}
