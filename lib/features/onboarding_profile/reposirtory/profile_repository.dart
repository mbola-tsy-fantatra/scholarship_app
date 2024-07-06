import 'dart:convert';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:scholariship/core/model/country_model.dart';
import 'package:scholariship/core/model/study_level_model.dart';
import 'package:scholariship/features/scholariship/data/models/academic_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileRepository {
  final http.Client httpClient;
  final SharedPreferences sharedPreferences;
  ProfileRepository({required this.httpClient, required this.sharedPreferences});

  Future<void> saveProfileDataLocally(Map<String, dynamic> profileData) async {
    final String encodedData = jsonEncode(profileData);
    await sharedPreferences.setString('profile_data', encodedData);
  }

  Map<String, dynamic>? getProfileDataLocally() {
    final String? encodedData = sharedPreferences.getString('profile_data');
    if (encodedData != null) {
      return jsonDecode(encodedData);
    }
    return null;
  }


  Future<void> saveProfileDataToBackend({
    required File? profileFile,
    required String? bio,
    required DateTime? dateOfBirth,
    required int countryId,
    required List<int> desiredStudyCountryIds,
    required List<int> academicsInterestIds,
    required int currentStudyLevelId,
  }) async {
    final uri = Uri.parse('${dotenv.env['BASE_URL']}/profile');
    var request = http.MultipartRequest('POST', uri);

    if (profileFile != null) {
      request.files.add(await http.MultipartFile.fromPath('profilePicture', profileFile.path));
    }

    request.fields['bio'] = bio ?? '';
    if (dateOfBirth != null) {
      request.fields['dateOfBirth'] = dateOfBirth.toIso8601String();
    }
    request.fields['countryId'] = countryId.toString();
    request.fields['desiredStudyCountryIds'] = jsonEncode(desiredStudyCountryIds);
    request.fields['academicsInterestIds'] = jsonEncode(academicsInterestIds);
    request.fields['currentStudyLevelId'] = currentStudyLevelId.toString();
    var response = await request.send();
    if (response.statusCode != 200) {
      throw Exception('Failed to save profile data');
    }
  }

  Future<List<AcademicModel>> getAcademics() async {
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
  }

  Future<List<CountryModel>> getCountry() async {
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
  }


  Future<List<StudyLevelModel>> getStudyLevel() async {
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
  }
}