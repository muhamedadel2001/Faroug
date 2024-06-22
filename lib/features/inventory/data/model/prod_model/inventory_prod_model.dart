import 'dart:convert';
InventoryProdModel inventoryProdModelFromJson(String str) => InventoryProdModel.fromJson(json.decode(str));
String inventoryProdModelToJson(InventoryProdModel data) => json.encode(data.toJson());
class InventoryProdModel {
  InventoryProdModel({
      List<ProductionInventories>? productionInventories,}){
    _productionInventories = productionInventories;
}

  InventoryProdModel.fromJson(dynamic json) {
    if (json['productionInventories'] != null) {
      _productionInventories = [];
      json['productionInventories'].forEach((v) {
        _productionInventories?.add(ProductionInventories.fromJson(v));
      });
    }
  }
  List<ProductionInventories>? _productionInventories;

  List<ProductionInventories>? get productionInventories => _productionInventories;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_productionInventories != null) {
      map['productionInventories'] = _productionInventories?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

ProductionInventories productionInventoriesFromJson(String str) => ProductionInventories.fromJson(json.decode(str));
String productionInventoriesToJson(ProductionInventories data) => json.encode(data.toJson());
class ProductionInventories {
  ProductionInventories({
      String? id, 
      String? name, 
      num? quantity, 
      String? category, 
      String? userID, 
      String? date, 
      num? v,}){
    _id = id;
    _name = name;
    _quantity = quantity;
    _category = category;
    _userID = userID;
    _date = date;
    _v = v;
}

  ProductionInventories.fromJson(dynamic json) {
    _id = json['_id'];
    _name = json['Name'];
    _quantity = json['Quantity'];
    _category = json['Category'];
    _userID = json['UserID'];
    _date = json['date'];
    _v = json['__v'];
  }
  String? _id;
  String? _name;
  num? _quantity;
  String? _category;
  String? _userID;
  String? _date;
  num? _v;

  String? get id => _id;
  String? get name => _name;
  num? get quantity => _quantity;
  String? get category => _category;
  String? get userID => _userID;
  String? get date => _date;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['Name'] = _name;
    map['Quantity'] = _quantity;
    map['Category'] = _category;
    map['UserID'] = _userID;
    map['date'] = _date;
    map['__v'] = _v;
    return map;
  }

}