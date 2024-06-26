

import '../../domain/entities/sholarship.dart';

class ScholarshipModel extends Scholarship{
  const ScholarshipModel({required super.id,
    required super.name,  required super.applicationStartDate,
    required super.applicationEndDate, required super.officialLink, required super.organizationName,
    required super.coverPhoto, required super.fundingType, required super.applicationStartPeriod,
    required super.description,super.savedBy});


  factory ScholarshipModel.fromJson(Map<String,dynamic> json){
    if (json['id'] == null) {
      print("id is null");
    }
    if (json['name'] == null) {
      print("name is null");
    }
    if (json['startApplicationDate'] == null) {
      print("startApplicationDate is null");
    }
    if (json['endApplicationDate'] == null) {
      print("endApplicationDate is null");
    }
    if (json['officialLink'] == null) {
      print("officialLink is null");
    }
    if (json['organizationName'] == null) {
      print("organizationName is null");
    }
    if (json['coverPhoto'] == null) {
      print("coverPhoto is null");
    }
    if (json['fundingType'] == null) {
      print("fundingType is null");
    }
    if (json['applicationStartPeriod'] == null) {
      print("applicationStartPeriod is null");
    }
    if (json['description'] == null) {
      print("description is null");
    }
    return ScholarshipModel(
      id: json['id'] ?? "",
      name: json['name'] ?? "",
      applicationStartDate: DateTime.parse(json['startApplicationDate'])  ,
      applicationEndDate: DateTime.parse(json['endApplicationDate']) ,
      officialLink: json['officialLink'] ?? "",
      organizationName: json['organizationName'] ?? "",
      coverPhoto: json['coverPhoto'] ?? "",
      fundingType: json['fundingType'] ?? "",
      savedBy: json['savedBy'] ?? [],
      applicationStartPeriod: json['applicationStartPeriod'] ?? "",
      description: json['description'] ?? "",
    );
  }

  Map<String,dynamic> toJson(){
    return {
      'id':id,
      'applicationEndDate':applicationEndDate,
      'coverPhotoUrl':coverPhoto,
      'description': description,
      'applicationStartPeriod': applicationStartPeriod,
      // 'title':title,
      'name':name,
      'officialLink':officialLink,
      'applicationStart':applicationStartDate,
      'organizationName':organizationName,
      'savedBy':savedBy
    };
  }
}