import '../../../../core/model/country_model.dart';
import '../../../../core/model/desired_study_country_model.dart';
import '../../../../core/model/study_level_model.dart';
import '../../../../core/model/user_model.dart';
import '../../domain/entities/profile.dart';

class UserProfileModel extends ProfileUser {
  const UserProfileModel({
     String? id,
    String? bio,
    String? profilePicture,
    DateTime? dateOfBirth,
     int? countryId,
    int? currentStudyLevelId,
    String? userId,
     DateTime? createdAt,
     DateTime? updatedAt,
     // CountryModel? country,
     // List<DesiredStudyCountryModel>? desiredStudyCountries,
     // StudyLevelModel? currentStudyLevel,
     UserModel? user,
     List<dynamic>? savedScholarships,
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
    // country: country,
    // desiredStudyCountries: desiredStudyCountries,
    // currentStudyLevel: currentStudyLevel,
    user: user,
    savedScholarships: savedScholarships,
  );

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    if (json['id'] == null) {
      print('Error: id is null');
    }
    if (json['bio'] == null) {
      print('Error: bio is null');
    }
    if (json['profilePicture'] == null) {
      print('Error: profilePicture is null');
    }
    if (json['currentStudyLevelId'] == null) {
      print('Error: currentStudyLevelId is null');
    }
    if (json['userId'] == null) {
      print('Error: userId is null');
    }
    if (json['createdAt'] == null) {
      print('Error: createdAt is null');
    }
    if (json['updatedAt'] == null) {
      print('Error: updatedAt is null');
    }
    if (json['user'] == null) {
      print('Error: user is null');
    }

    return UserProfileModel(
      id: json['id'] ?? '',
      bio: json['bio'] ?? '',
      profilePicture: json['profilePicture'] ?? '',
      dateOfBirth: json['dateOfBirth'] != null ? DateTime.parse(json['dateOfBirth']) : null,
      countryId: json['countryId'] ?? 0,
      currentStudyLevelId: json['currentStudyLevelId'] ?? 0,
      userId: json['userId'] ?? '',
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : DateTime.now(),
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : DateTime.now(),
      // country: CountryModel.fromJson(json['country']),
      // desiredStudyCountries: json['desiredStudyCountries'] != null
      //     ? List<DesiredStudyCountryModel>.from(json['desiredStudyCountries'].map((x) => DesiredStudyCountryModel.fromJson(x)))
      //     : [],
      // currentStudyLevel: StudyLevelModel.fromJson(json['currentStudyLevel']),
      user: UserModel.fromJson(json['user'] ?? {}),
      savedScholarships: json['savedScholarships'] ?? [],
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
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      // 'country': (country as CountryModel).toJson(),
      // 'desiredStudyCountries': desiredStudyCountries.map((x) => (x as DesiredStudyCountryModel).toJson()).toList(),
      // 'currentStudyLevel': (currentStudyLevel as StudyLevelModel).toJson(),
      'user': (user as UserModel).toJson(),
      'savedScholarships': savedScholarships,
    };
  }
}
