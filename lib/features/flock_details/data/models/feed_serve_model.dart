import 'package:finalproject/features/flock_details/data/models/flock_data_model.dart';

class FeedServedModel extends FlockDataModel {
  String? sId;
  String? name;
  String? category;
  int? amount;
  String? note;
  String? flockID;
  int? iV;
  DateTime? date;
  FeedServedModel(
      {this.sId,
      this.name,
      this.category,
      this.amount,
      this.note,
      this.flockID,
      this.iV});

  FeedServedModel fromJson(Map<String, dynamic> json) {
    FeedServedModel feedServedModel = FeedServedModel();
    feedServedModel.sId = json['_id'];
    feedServedModel.name = json['Name'];
    feedServedModel.category = json['Category'];
    feedServedModel.amount = json['Amount'];
    feedServedModel.note = json['Note'];
    feedServedModel.flockID = json['FlockID'];
    feedServedModel.iV = json['__v'];
        feedServedModel.date = DateTime.parse(json['date']);
    return feedServedModel;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // data['_id'] = sId;
    data['Name'] = name;
    data['Category'] = category;
    data['Amount'] = amount;
    data['Note'] = note;
    // data['FlockID'] = flockID;
    // data['__v'] = iV;
    return data;
  }
  
  @override
  String get getLink => 'FeedServied';

    @override
  String get getId => this.sId!;

    @override
 
  String get getDeleteLink => 'feedServied';
}
