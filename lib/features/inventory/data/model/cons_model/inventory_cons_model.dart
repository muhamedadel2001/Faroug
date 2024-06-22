import 'dart:convert';
InventoryConsModel inventoryConsModelFromJson(String str) => InventoryConsModel.fromJson(json.decode(str));
String inventoryConsModelToJson(InventoryConsModel data) => json.encode(data.toJson());
class InventoryConsModel {
  InventoryConsModel({
      List<ConsumptionInventories>? consumptionInventories,}){
    _consumptionInventories = consumptionInventories;
}

  InventoryConsModel.fromJson(dynamic json) {
    if (json['consumptionInventories'] != null) {
      _consumptionInventories = [];
      json['consumptionInventories'].forEach((v) {
        _consumptionInventories?.add(ConsumptionInventories.fromJson(v));
      });
    }
  }
  List<ConsumptionInventories>? _consumptionInventories;

  List<ConsumptionInventories>? get consumptionInventories => _consumptionInventories;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_consumptionInventories != null) {
      map['consumptionInventories'] = _consumptionInventories?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

ConsumptionInventories consumptionInventoriesFromJson(String str) => ConsumptionInventories.fromJson(json.decode(str));
String consumptionInventoriesToJson(ConsumptionInventories data) => json.encode(data.toJson());
class ConsumptionInventories {
  ConsumptionInventories({
      String? id, 
      String? name, 
      num? price, 
      num? quantity, 
      String? category, 
      num? prercent, 
      String? userID, 
      String? date, 
      num? v,}){
    _id = id;
    _name = name;
    _price = price;
    _quantity = quantity;
    _category = category;
    _prercent = prercent;
    _userID = userID;
    _date = date;
    _v = v;
}

  ConsumptionInventories.fromJson(dynamic json) {
    _id = json['_id'];
    _name = json['Name'];
    _price = json['Price'];
    _quantity = json['Quantity'];
    _category = json['Category'];
    _prercent = json['Prercent'];
    _userID = json['UserID'];
    _date = json['date'];
    _v = json['__v'];
  }
  String? _id;
  String? _name;
  num? _price;
  num? _quantity;
  String? _category;
  num? _prercent;
  String? _userID;
  String? _date;
  num? _v;

  String? get id => _id;
  String? get name => _name;
  num? get price => _price;
  num? get quantity => _quantity;
  String? get category => _category;
  num? get prercent => _prercent;
  String? get userID => _userID;
  String? get date => _date;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['Name'] = _name;
    map['Price'] = _price;
    map['Quantity'] = _quantity;
    map['Category'] = _category;
    map['Prercent'] = _prercent;
    map['UserID'] = _userID;
    map['date'] = _date;
    map['__v'] = _v;
    return map;
  }

}