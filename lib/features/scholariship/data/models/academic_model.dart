import '../../domain/entities/academic.dart';

class AcademicModel extends Academic{
  const AcademicModel({required super.id, required super.key, required super.title});

  factory AcademicModel.fromJson(Map<String,dynamic> json){
    return AcademicModel(id: json['id'], key: json['key'], title: json['title']);
  }

  Map<String,dynamic> toJson(){
    return {
      'id': id,
      'title':title,
      'key':key
    };
  }
}