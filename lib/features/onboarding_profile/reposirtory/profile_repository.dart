import 'dart:convert';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:scholariship/features/scholariship/data/models/academic_model.dart';
import 'package:scholariship/features/scholariship/data/models/country_model.dart';
import 'package:scholariship/features/scholariship/data/models/study_level_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingProfileRepository {
  final http.Client httpClient;
  final SharedPreferences sharedPreferences;

  OnboardingProfileRepository({required this.httpClient, required this.sharedPreferences});

  Future<void> saveProfileDataLocally(Map<String, dynamic> profileData) async {
    try {
      final String encodedData = jsonEncode(profileData);
      await sharedPreferences.setString('profile_data', encodedData);
    } catch (e) {
      print('Error saving profile data locally: $e');
    }
  }

  Map<String, dynamic>? getProfileDataLocally() {
    try {
      final String? encodedData = sharedPreferences.getString('profile_data');
      if (encodedData != null) {
        return jsonDecode(encodedData);
      }
    } catch (e) {
      print('Error getting profile data locally: $e');
    }
    return null;
  }

  Future<void> saveProfileDataToBackend({
    required File? profileFile,
    required String? bio,
    required DateTime? dateOfBirth,
    required String countryName,
    required List<int> desiredStudyCountryIds,
    required List<int> academicsInterestIds,
    required int currentStudyLevelId,
  }) async {
    final String? token = sharedPreferences.getString('access_token');
    final uri = Uri.parse('${dotenv.env['BASE_URL']}/profiles');

    try {
      var request = http.MultipartRequest('POST', uri)
        ..headers['Authorization'] = 'Bearer $token'
        ..fields['bio'] = bio ?? ''
        ..fields['countryName'] = countryName
        ..fields['currentStudyLevelId'] = currentStudyLevelId.toString();

      if (profileFile != null) {
        request.files.add(await http.MultipartFile.fromPath('profilePicture', profileFile.path));
      }

      if (dateOfBirth != null) {
        request.fields['dateOfBirth'] = dateOfBirth.toIso8601String();
      }

      for (int i = 0; i < desiredStudyCountryIds.length; i++) {
        request.fields['desiredStudyCountryIds[$i]'] = desiredStudyCountryIds[i].toString();
      }

      for (int i = 0; i < academicsInterestIds.length; i++) {
        request.fields['academicsInterestIds[$i]'] = academicsInterestIds[i].toString();
      }

      print(request.fields);
      print(request.files);

      var response = await request.send();
      if (response.statusCode != 201) {
        final responseBody = await response.stream.bytesToString();
        throw Exception('Failed to save profile data: $responseBody');
      }
    } catch (e) {
      print('Error saving profile data to backend: $e');
      throw Exception('Failed to save profile data: $e');
    }
  }


  Future<List<AcademicModel>> getAcademics() async {
    try {
      final String? token = sharedPreferences.getString('access_token');
      final url = Uri.parse('${dotenv.env['BASE_URL']!}/profiles/academics');
      final response = await httpClient.get(
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
    } catch (e) {
      print('Error getting academics: $e');
      return [];
    }
  }

  Future<List<CountryModel>> getCountry() async {
    try {
      final String? token = sharedPreferences.getString('access_token');
      final url = Uri.parse('${dotenv.env['BASE_URL']!}/profiles/country');
      final response = await httpClient.get(
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
    } catch (e) {
      print('Error getting countries: $e');
      return [];
    }
  }

  Future<List<StudyLevelModel>> getStudyLevel() async {
    try {
      final String? token = sharedPreferences.getString('access_token');
      final url = Uri.parse('${dotenv.env['BASE_URL']!}/profiles/study-level');
      final response = await httpClient.get(
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
    } catch (e) {
      print('Error getting study levels: $e');
      return [];
    }
  }
}