import 'package:finalproject/features/flock_details/data/models/flock_data_model.dart';

class MedicineModel extends FlockDataModel {
  String? sId;
  String? name;
  String? breed;
  String? note;
  String? flockID;
  int? iV;
    DateTime? date;

  MedicineModel(
      {this.sId, this.name, this.breed, this.note, this.flockID, this.iV});

  MedicineModel fromJson(Map<String, dynamic> json) {
    MedicineModel medicineModel = MedicineModel();
    medicineModel.sId = json['_id'];
    medicineModel.name = json['Name'];
    medicineModel.breed = json['breed'];
    medicineModel.note = json['Note'];
    medicineModel.flockID = json['FlockID'];
    medicineModel.iV = json['__v'];
           medicineModel.date = DateTime.parse(json['date']);
    return medicineModel;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // data['_id'] = sId;
    data['Name'] = name;
    data['breed'] = breed;
    data['Note'] = note;
    // data['FlockID'] = flockID;
    // data['__v'] = iV;

    return data;
  }

  @override
  String get getLink => 'Medicine';

    @override
  String get getId => this.sId!;

   String get getDeleteLink => 'medician';
}
