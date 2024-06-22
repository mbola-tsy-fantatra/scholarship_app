import '../../domain/entities/country.dart';

class CountryModel extends Country{
  const CountryModel({required super.countryId, required super.name});


  factory CountryModel.fromJson(Map<String,dynamic> json){
    return CountryModel(countryId: json['countryId'], name: json['name']);
  }

  Map<String,dynamic> toJson(){
    return {
      'countryId':countryId,
      'name':name
    };
  }
}

