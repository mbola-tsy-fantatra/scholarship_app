import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../models/scholarship_model.dart';
import 'package:http/http.dart' as http;

abstract class ScholarshipRemoteDataSource{
  Future<List<ScholarshipModel>> findScholarship(String location,String studyLevel,String studyField);
}

class ScholarshipRemoteDataSourceImpl implements ScholarshipRemoteDataSource{

  final  http.Client client;

  ScholarshipRemoteDataSourceImpl({required this.client});

  @override
  Future<List<ScholarshipModel>> findScholarship(String location, String studyLevel, String studyField) async{
    final url = Uri.parse('${dotenv.env['BASE_URL']!}/scholarship').replace(queryParameters: {
      'hostCountry': location,
      'studyLevel': studyLevel,
      'q': studyField,
    });
    final response = await client.get(url);
    
    if(response.statusCode ==200){
      List<dynamic> jsonResponse = jsonDecode(response.body);
       return jsonResponse.map((data) => ScholarshipModel.fromJson(data)).toList();
    }else{
      throw UnimplementedError();
    }
  }

}