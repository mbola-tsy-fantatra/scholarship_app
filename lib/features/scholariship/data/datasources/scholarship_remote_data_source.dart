import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:scholariship/features/scholariship/data/models/academic_model.dart';
import 'package:scholariship/features/scholariship/data/models/country_model.dart';
import 'package:scholariship/features/scholariship/data/models/study_level_model.dart';
import 'package:scholariship/features/scholariship/data/request/create_scholarship.dart';
import 'package:scholariship/features/scholariship/domain/entities/sholarship.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../global/error/exeception.dart';
import '../models/scholarship_model.dart';
import 'package:http/http.dart' as http;

abstract class ScholarshipRemoteDataSource{
  Future<List<ScholarshipModel>> findScholarship(String location,String studyLevel,String studyField);
  Future<Scholarship> createScholarship(CreateScholarship scholarship);
  Future<List<AcademicModel>> getAcademics();
  Future<List<CountryModel>> getCountry();
  Future<List<StudyLevelModel>> getStudyLevel();
}

class ScholarshipRemoteDataSourceImpl implements ScholarshipRemoteDataSource{
  final SharedPreferences sharedPreferences;
  final  http.Client client;

  ScholarshipRemoteDataSourceImpl({required this.sharedPreferences,required this.client});

  @override
  Future<List<ScholarshipModel>> findScholarship(String location, String studyLevel, String studyField) async {
    final String? token = sharedPreferences.getString('access_token');
    print(token);
    Map<String, String> queryParams = {};
    if (location.isNotEmpty) {
      queryParams['hostCountry'] = location;
    }
    if (studyLevel.isNotEmpty) {
      queryParams['studyLevel'] = studyLevel;
    }
    if (studyField.isNotEmpty) {
      queryParams['q'] = studyField;
    }
    final url = Uri.parse('${dotenv.env['BASE_URL']!}/scholarships').replace(queryParameters: queryParams);
    final response = await client.get(
        url  ,
        headers: {
      'Authorization': 'Bearer $token',
    },);
    if (response.statusCode == 200) {
      print(response.body);
      List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((data) => ScholarshipModel.fromJson(data)).toList();
    } else {
      throw ServerException();
    }
  }


  @override
  Future<List<AcademicModel>> getAcademics() async {
    final String? token = sharedPreferences.getString('access_token');
    final url = Uri.parse('${dotenv.env['BASE_URL']!}/profiles/academics');
    final response = await client.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => AcademicModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load academics');
    }
  }


  @override
  Future<List<CountryModel>> getCountry() async {
    final String? token = sharedPreferences.getString('access_token');
    final url = Uri.parse('${dotenv.env['BASE_URL']!}/profiles/country');
    final response = await client.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => CountryModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load countries');
    }
  }

  @override
  Future<List<StudyLevelModel>> getStudyLevel() async {
    final String? token = sharedPreferences.getString('access_token');
    final url = Uri.parse('${dotenv.env['BASE_URL']!}/profiles/study-level');
    final response = await client.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => StudyLevelModel.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load study levels');
    }
  }

  @override
  Future<Scholarship> createScholarship(CreateScholarship scholarship) async {
    final String? token = sharedPreferences.getString('access_token');
    final url = Uri.parse('${dotenv.env['BASE_URL']!}/scholarships');

    try {
      var request = http.MultipartRequest('POST', url)
        ..headers['Authorization'] = 'Bearer $token'
        ..fields['name'] = scholarship.name
        ..fields['officialLink'] = scholarship.officialLink
        ..fields['description'] = scholarship.description
        ..fields['organizationName'] = scholarship.organizationName
        ..fields['fundingType'] = scholarship.fundingType
        ..fields['startApplicationDate'] = scholarship.startApplicationDate.toString()
        ..fields['endApplicationDate'] = scholarship.endApplicationDate.toString()
        ..fields['applicationStartPeriod'] = scholarship.applicationStartPeriod
        ..files.add(await http.MultipartFile.fromPath(
          'coverPhoto',
          scholarship.coverPhoto.path,
        ));
        for(int i=0; i< scholarship.hostCountriesIds.length; i++){
          request.fields['hostCountriesIds${[i]}']= scholarship.hostCountriesIds[i].toString() ;
        }
      for(int i=0; i< scholarship.studyLevelsIds.length; i++){
        request.fields['studyLevelsIds${[i]}']= scholarship.studyLevelsIds[i].toString() ;
      }
      print(request.fields);
      print(request.files);
      var response = await request.send();

      if (response.statusCode == 201) {
        final responseBody = await response.stream.bytesToString();
        return ScholarshipModel.fromJson(jsonDecode(responseBody));
      } else {
        final responseBody = await response.stream.bytesToString();
        throw Exception('Failed to create scholarship: $responseBody');
      }
    } catch (e) {
      print('Error creating scholarship: $e');
      throw Exception('Failed to create scholarship: $e');
    }
  }
}