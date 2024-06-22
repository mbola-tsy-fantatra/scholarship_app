import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:scholariship/core/dto/profile/create_profile_dto.dart';
import '../../../../global/error/exeception.dart';
import '../models/user_model.dart';

abstract class UserRemoteDataSource {
  Future<UserModel> getUserProfileInfo(String userId);
  Future<UserModel> createUserProfile(CreateProfileDto profileDto);
  Future<UserModel> updateProfile(CreateProfileDto profileDto);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final Dio dio;

  UserRemoteDataSourceImpl({required this.dio});

  @override
  Future<UserModel> getUserProfileInfo(String userId) async {
    final url = '${dotenv.env['BASE_URL']}/user/profile/$userId';
    const token = '';

    try {
      final response = await dio.get(
        url,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
          },
        ),
      );

      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data);
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException(); // Handle Dio errors or other exceptions
    }
  }

  @override
  Future<UserModel> createUserProfile(CreateProfileDto profileDto) async {
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
        return UserModel.fromJson(response.data);
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException(); // Handle Dio errors or other exceptions
    }
  }

  @override
  Future<UserModel> updateProfile(CreateProfileDto profileDto) async {
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
        return UserModel.fromJson(response.data);
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException(); // Handle Dio errors or other exceptions
    }
  }
}
