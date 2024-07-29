import '../../../../core/model/country_model.dart';
import '../../../../core/model/desired_study_country_model.dart';
import '../../../../core/model/study_level_model.dart';
import '../../../../core/model/user_model.dart';
import '../../domain/entities/user_profile.dart';


class UserProfileModel extends UserProfile {
  const UserProfileModel({
    required String id,
    String? bio,
    String? profilePicture,
    DateTime? dateOfBirth,
    required int countryId,
    required int currentStudyLevelId,
    required String userId,
    required DateTime createdAt,
    required DateTime updatedAt,
    required CountryModel country,
    required List<DesiredStudyCountryModel> desiredStudyCountries,
    required StudyLevelModel currentStudyLevel,
    required UserModel user,
    required List<dynamic> savedScholarships,
  }) : super(
    id: id,
    bio: bio,
    profilePicture: profilePicture,
    dateOfBirth: dateOfBirth,
    countryId: countryId,
    currentStudyLevelId: currentStudyLevelId,
    userId: userId,
    createdAt: createdAt,
    updatedAt: updatedAt,
    country: country,
    desiredStudyCountries: desiredStudyCountries,
    currentStudyLevel: currentStudyLevel,
    user: user,
    savedScholarships: savedScholarships,
  );

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      id: json['id'],
      bio: json['bio'],
      profilePicture: json['profilePicture'],
      dateOfBirth: json['dateOfBirth'] != null ? DateTime.parse(json['dateOfBirth']) : null,
      countryId: json['countryId'],
      currentStudyLevelId: json['currentStudyLevelId'],
      userId: json['userId'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      country: CountryModel.fromJson(json['country']),
      desiredStudyCountries: List<DesiredStudyCountryModel>.from(
          json['desiredStudyCountries'].map((x) => DesiredStudyCountryModel.fromJson(x))),
      currentStudyLevel: StudyLevelModel.fromJson(json['currentStudyLevel']),
      user: UserModel.fromJson(json['user']),
      savedScholarships: json['savedScholarships'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'bio': bio,
      'profilePicture': profilePicture,
      'dateOfBirth': dateOfBirth?.toIso8601String(),
      'countryId': countryId,
      'currentStudyLevelId': currentStudyLevelId,
      'userId': userId,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'country': (country as CountryModel).toJson(),
      'desiredStudyCountries': desiredStudyCountries.map((x) => (x as DesiredStudyCountryModel).toJson()).toList(),
      'currentStudyLevel': (currentStudyLevel as StudyLevelModel).toJson(),
      'user': (user as UserModel).toJson(),
      'savedScholarships': savedScholarships,
    };
  }
}