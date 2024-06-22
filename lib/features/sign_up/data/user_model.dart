class User {
  late String firstName;
  late String lastName;
  late String email;
  late String password;
  late String flockName;

  User(
      {required this.firstName,
        required this.lastName,
        required this.email,
        required this.password,
        required this.flockName});

  User.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    password = json['password'];
    flockName = json['flockName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['password'] = password;
    data['flockName'] = flockName;
    return data;
  }
}
