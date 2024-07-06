

import '../entity/studyLevel.dart';

class StudyLevelModel extends StudyLevel{

  const StudyLevelModel({required super.id, required super.name});

  factory StudyLevelModel.fromJson(Map<String,dynamic> json){
    return StudyLevelModel(id: json['id']?? 0, name: json['name']);
  }

  Map<String,dynamic> toJson(){
    return {
      'id':id,
      'name':name
    };
  }
}