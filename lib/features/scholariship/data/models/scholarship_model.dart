

import '../../domain/entities/sholarship.dart';

class ScholarshipModel extends Scholarship{
  const ScholarshipModel({required super.scholarshipId, required super.title, required super.name, required super.requirements, required super.applicationStartDate, required super.applicationEndDate, required super.officialLink, required super.organizationName, required super.coverPhotoUrl});


  factory ScholarshipModel.fromJson(Map<String,dynamic> json){
    return ScholarshipModel(
        scholarshipId: json['scholarshipId'], title: json['title'], name: json['name'],
        requirements: json['requirements'], applicationStartDate: json['applicationStartDate'],
        applicationEndDate: json['applicationEndDate'], officialLink: json['officialLink'], organizationName: json['organizationName'],
        coverPhotoUrl: json['coverPhotoUrl']
    );
  }

  Map<String,dynamic> toJson(){
    return {
      'scholarshipId':scholarshipId,
      'requirements':requirements,
      'applicationEndDate':applicationEndDate,
      'coverPhotoUrl':coverPhotoUrl,
      'title':title,
      'name':name,
      'officialLink':officialLink,
      'applicationStart':applicationStartDate,
      'organizationName':organizationName
    };
  }
}