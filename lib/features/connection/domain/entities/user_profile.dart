import 'package:equatable/equatable.dart';

import '../../../../core/entity/country.dart';
import '../../../../core/entity/desired_study_country.dart';
import '../../../../core/entity/studyLevel.dart';
import '../../../../core/entity/user.dart';

class UserProfile extends Equatable{
  final String id;
  final String bio;
  final String? profilePicture;
  final DateTime? dateOfBirth;
  final int countryId;
  final int currentStudyLevelId;
  final String userId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final Country country;
  final List<DesiredStudyCountry> desiredStudyCountries;
  final StudyLevel currentStudyLevel;
  final User user;
  final List<dynamic> savedScholarships;

  const UserProfile({
    required this.id,
    required this.bio,
    this.profilePicture,
    this.dateOfBirth,
    required this.countryId,
    required this.currentStudyLevelId,
    required this.userId,
    required this.createdAt,
    required this.updatedAt,
    required this.country,
    required this.desiredStudyCountries,
    required this.currentStudyLevel,
    required this.user,
    required this.savedScholarships,
  });

  @override
  List<Object?> get props =>
      [id,bio,profilePicture,savedScholarships,
    dateOfBirth,countryId,currentStudyLevelId,userId,createdAt,
    updatedAt,country,desiredStudyCountries,currentStudyLevel,user];
}
