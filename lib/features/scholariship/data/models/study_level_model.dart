

import '../../domain/entities/studyLevel.dart';

class StudyLevelModel extends StudyLevel{

  const StudyLevelModel({required super.id, required super.name});

  factory StudyLevelModel.fromJson(Map<String,dynamic> json){
    return StudyLevelModel(id: json['id'], name: json['name']);
  }

  Map<String,dynamic> toJson(){
    return {
      'id':id,
      'name':name
    };
  }
}