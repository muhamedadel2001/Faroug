import 'package:finalproject/features/flock_details/data/models/flock_data_model.dart';

class IncomeModel extends FlockDataModel {
  String? sId;
  String? name;
  String? category;
  int? amount;
  String? incomeModelCategory;
  String? method;
  String? note;
  String? flockID;
  int? iV;
  DateTime? date;
  IncomeModel(
      {this.sId,
      this.name,
      this.category,
      this.amount,
      this.incomeModelCategory,
      this.method,
      this.note,
      this.flockID,
      this.iV});

  IncomeModel fromJson(Map<String, dynamic> json) {
    IncomeModel incomeModel = IncomeModel();
    incomeModel.sId = json['_id'];
    incomeModel.name = json['Name'];
    incomeModel.category = json['Category'];
    incomeModel.amount = json['Amount'];
    incomeModel.incomeModelCategory = json['IncomeModelCategory'];
    incomeModel.method = json['method'];
    incomeModel.note = json['Note'];
    incomeModel.flockID = json['FlockID'];
    incomeModel.iV = json['__v'];
    incomeModel.date = DateTime.parse(json['date']);
    return incomeModel;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = name;
    data['Category'] = category;
    data['Amount'] = amount;
    data['IncomeCategory'] = incomeModelCategory;
    data['method'] = method;
    data['Note'] = note;
    return data;
  }

  @override
  String get getLink => 'Income';

  @override
  String get getId => this.sId!;

  String get getDeleteLink => 'income';
}
