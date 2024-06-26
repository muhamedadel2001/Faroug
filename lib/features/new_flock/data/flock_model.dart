class FlockModel {
  String? sId;
  String? flockName;
  int? number;
  String? breed;
  int? costPerBirds;
  String? supplier;
  bool? active;
  DateTime? date;

  FlockModel({
    sId,
    flockName,
    number,
    breed,
    costPerBirds,
    supplier,
  });

  FlockModel.flockModelfromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    flockName = json['flockName'];
    number = json['number'];
    breed = json['Breed'];
    costPerBirds = json['CostPerBirds'];
    supplier = json['Supplier'];
    active = json['Active'];
    date = DateTime.parse(json['date']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['flockName'] = flockName;
    data['number'] = number;
    data['Breed'] = breed;
    data['CostPerBirds'] = costPerBirds;
    data['Supplier'] = supplier;
    // data['Active'] = active;
    return data;
  }
}
