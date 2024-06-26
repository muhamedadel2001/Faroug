import 'package:finalproject/features/flock_details/data/models/flock_data_model.dart';

class MortalityModel extends FlockDataModel {
  String? sId;
  int? numberofDead;
  String? breed;
  String? note;
  String? flockID;
  int? iV;
  DateTime? date;

  MortalityModel(
      {this.sId,
      this.numberofDead,
      this.breed,
      this.note,
      this.flockID,
      this.iV});

  MortalityModel fromJson(Map<String, dynamic> json) {
    MortalityModel mortalityModel = MortalityModel();
    mortalityModel.sId = json['_id'];
    mortalityModel.numberofDead = json['NumberofDead'];
    mortalityModel.breed = json['breed'];
    mortalityModel.note = json['Note'];
    mortalityModel.flockID = json['FlockID'];
    mortalityModel.iV = json['__v'];
    mortalityModel.date = DateTime.parse(json['date']);
    return mortalityModel;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['NumberofDead'] = numberofDead;
    data['breed'] = breed;
    data['Note'] = note;

    return data;
  }

  @override
  String get getLink => 'Morlaity';

  @override
  String get getId => this.sId!;

  String get getDeleteLink => 'morality';
}
