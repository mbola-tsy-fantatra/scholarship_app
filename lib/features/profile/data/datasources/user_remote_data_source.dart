import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:scholariship/core/dto/profile/create_profile_dto.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../global/error/exeception.dart';
import '../models/profile_model.dart';

abstract class UserRemoteDataSource {
  Future<UserProfileModel> getUserProfileInfo(String userId);
  Future<UserProfileModel> createUserProfile(CreateProfileDto profileDto);
  Future<UserProfileModel> updateProfile(CreateProfileDto profileDto);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final Dio dio;
  final SharedPreferences sharedPreferences;

  UserRemoteDataSourceImpl({required this.dio,required this.sharedPreferences});

  @override
  Future<UserProfileModel> getUserProfileInfo(String userId) async {
    print(userId);
    final url = '${dotenv.env['BASE_URL']}/profiles/$userId';
    final String? token = sharedPreferences.getString('access_token');
    print('userId: $userId');
      final response = await dio.get(
        url,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200) {
        print( 'user profile :${response.data}');
        return UserProfileModel.fromJson(response.data);
      } else {
        throw ServerException();
      }
  }

  @override
  Future<UserProfileModel> createUserProfile(CreateProfileDto profileDto) async {
    final url = '${dotenv.env['BASE_URL']}/user/profile';
    const token = '';

    try {
      FormData formData = FormData.fromMap({
        'name': profileDto.name,
        'bio': profileDto.bio,
        'profilePicture': profileDto.profilePicture != null
            ? await MultipartFile.fromFile(profileDto.profilePicture!.path)
            : null,
        'dateOfBirth': profileDto.dateOfBirth?.toIso8601String(),
        'countryId': profileDto.countryId,
        'desiredStudyCountryIds': profileDto.desiredStudyCountryIds,
        'academicsInterestIds': profileDto.academicsInterestIds,
        'currentStudyLevelId': profileDto.currentStudyLevelId,
      });

      final response = await dio.post(
        url,
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.data);
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException(); // Handle Dio errors or other exceptions
    }
  }

  @override
  Future<UserProfileModel> updateProfile(CreateProfileDto profileDto) async {
    final url = '${dotenv.env['BASE_URL']}/user/profile';
    const token = '';

    try {
      Map<String, dynamic> data = {
        'name': profileDto.name,
        'bio': profileDto.bio,
        'dateOfBirth': profileDto.dateOfBirth?.toIso8601String(),
        'countryId': profileDto.countryId,
        'desiredStudyCountryIds': profileDto.desiredStudyCountryIds,
        'academicsInterestIds': profileDto.academicsInterestIds,
        'currentStudyLevelId': profileDto.currentStudyLevelId,
      };

      if (profileDto.profilePicture != null) {
        data['profilePicture'] =
        await MultipartFile.fromFile(profileDto.profilePicture!.path);
      }

      FormData formData = FormData.fromMap(data);

      final response = await dio.put(
        url,
        data: formData,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        return UserProfileModel.fromJson(response.data);
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException(); // Handle Dio errors or other exceptions
    }
  }
}
