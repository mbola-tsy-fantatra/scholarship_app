

import '../../domain/entities/sholarship.dart';

class ScholarshipModel extends Scholarship{
  const ScholarshipModel({required super.id,
    // required super.title,
    required super.name,  required super.applicationStartDate,
    required super.applicationEndDate, required super.officialLink, required super.organizationName,
    required super.coverPhoto, required super.fundingType, required super.applicationStartPeriod,
    required super.description});


  factory ScholarshipModel.fromJson(Map<String,dynamic> json){
    return ScholarshipModel(
        id: json['id'],
        // title: json['title'],
        name: json['name'],
        applicationStartDate: DateTime.parse(json['startApplicationDate']),
        applicationEndDate: DateTime.parse(json['endApplicationDate']),
        officialLink: json['officialLink'],
        organizationName: json['organizationName'],
        coverPhoto: json['coverPhoto'],
        fundingType: json['fundingType'],
        applicationStartPeriod: json['applicationStartPeriod'],
        description: json['description'],
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
      'organizationName':organizationName
    };
  }
}