import 'package:finalproject/features/flock_details/data/models/flock_data_model.dart';

class ExpenseModel extends FlockDataModel {
  String? sId;
  String? name;
  String? category;
  int? amount;
  String? expenseModelCategory;
  String? method;
  String? note;
  String? flockID;
  int? iV;
  DateTime? date;

  ExpenseModel(
      {this.sId,
      this.name,
      this.category,
      this.amount,
      this.expenseModelCategory,
      this.method,
      this.note,
      this.flockID,
      this.iV});

  ExpenseModel fromJson(Map<String, dynamic> json) {
    ExpenseModel expenseModel = ExpenseModel();
    expenseModel.sId = json['_id'];
    expenseModel.name = json['Name'];
    expenseModel.category = json['Category'];
    expenseModel.amount = json['Amount'];
    expenseModel.expenseModelCategory = json['expenseModelCategory'];
    expenseModel.method = json['method'];
    expenseModel.note = json['Note'];
    expenseModel.flockID = json['FlockID'];
    expenseModel.iV = json['__v'];
    expenseModel.date = DateTime.parse(json['date']);
    return expenseModel;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // data['_id'] = sId;
    data['Name'] = name;
    data['Category'] = category;
    data['Amount'] = amount;
    data['expensesCategory'] = expenseModelCategory;
    data['method'] = method;
    data['Note'] = note;
    // data['FlockID'] = flockID;
    return data;
  }

  @override
  String get getLink => 'Expenses';

  @override
  String get getId => this.sId!;

  @override
  String get getDeleteLink => 'expenses';
}
