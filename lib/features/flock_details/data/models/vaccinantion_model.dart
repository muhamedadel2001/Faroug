import 'package:finalproject/features/flock_details/data/models/flock_data_model.dart';

class VaccinationModel extends FlockDataModel {
  String? sId;
  String? name;
  String? breed;
  String? vaccinationmodelType;
  String? method;
  String? discription;
  String? flockID;
  int? iV;
  DateTime? date;

  VaccinationModel(
      {this.sId,
      this.name,
      this.breed,
      this.vaccinationmodelType,
      this.method,
      this.discription,
      this.flockID,
      this.iV});

  VaccinationModel fromJson(Map<String, dynamic> json) {
    VaccinationModel vaccinationModel = VaccinationModel();
    vaccinationModel.sId = json['_id'];
    vaccinationModel.name = json['Name'];
    vaccinationModel.breed = json['breed'];
    vaccinationModel.vaccinationmodelType = json['VaccinationModelType'];
    vaccinationModel.method = json['Method'];
    vaccinationModel.discription = json['discription'];
    vaccinationModel.flockID = json['FlockID'];
    vaccinationModel.iV = json['__v'];
    vaccinationModel.date = DateTime.parse(json['date']);
    return vaccinationModel;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // data['_id'] = sId;
    data['Name'] = name;
    data['breed'] = breed;
    data['VaccinationType'] = vaccinationmodelType;
    data['Method'] = method;
    data['discription'] = discription;
    // data['FlockID'] = flockID;
    // data['__v'] = iV;

    return data;
  }

  @override
  String get getLink => 'Vaccination';

  @override
  String get getId => this.sId!;

  String get getDeleteLink => 'vaccination';
}
