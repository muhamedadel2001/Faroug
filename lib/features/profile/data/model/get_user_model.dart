import 'dart:convert';
GetUserModel getUserModelFromJson(String str) => GetUserModel.fromJson(json.decode(str));
String getUserModelToJson(GetUserModel data) => json.encode(data.toJson());
class GetUserModel {
  GetUserModel({
      User? user,}){
    _user = user;
}

  GetUserModel.fromJson(dynamic json) {
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  User? _user;

  User? get user => _user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    return map;
  }

}

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());
class User {
  User({
      String? id, 
      String? firstName, 
      String? lastName, 
      String? email, 
      String? password, 
      String? flockName, 
      bool? isAdmin, 
      String? createdAt, 
      String? updatedAt, 
      num? v,}){
    _id = id;
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _password = password;
    _flockName = flockName;
    _isAdmin = isAdmin;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
}

  User.fromJson(dynamic json) {
    _id = json['_id'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _email = json['email'];
    _password = json['password'];
    _flockName = json['flockName'];
    _isAdmin = json['isAdmin'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _v = json['__v'];
  }
  String? _id;
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _password;
  String? _flockName;
  bool? _isAdmin;
  String? _createdAt;
  String? _updatedAt;
  num? _v;

  String? get id => _id;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get email => _email;
  String? get password => _password;
  String? get flockName => _flockName;
  bool? get isAdmin => _isAdmin;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get v => _v;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = _id;
    map['firstName'] = _firstName;
    map['lastName'] = _lastName;
    map['email'] = _email;
    map['password'] = _password;
    map['flockName'] = _flockName;
    map['isAdmin'] = _isAdmin;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['__v'] = _v;
    return map;
  }

}