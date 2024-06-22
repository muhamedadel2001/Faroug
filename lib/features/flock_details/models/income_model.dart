
import 'flock_data_model.dart';

class IncomeModel extends FlockDataModel {
   String? name;
   int? price;
  IncomeModel({
    this.name,
    this.price,
  });
  
  @override
  fromJson(Map<String, dynamic> json) {
  name = json['name'];
    price = json['price'];
  }
  
  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['price'] = price;
    return data;
  }

 
}
