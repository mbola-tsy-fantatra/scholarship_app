import 'dart:io';

import 'package:equatable/equatable.dart';

class CreateProfileDto extends Equatable {
  final String? name;
  final String? bio;
  final File? profilePicture;
  final DateTime? dateOfBirth;
  final int countryId;
  final List<int> desiredStudyCountryIds;
  final List<int> academicsInterestIds;
  final int currentStudyLevelId;

  const CreateProfileDto({
    this.name,
    this.bio,
    this.profilePicture,
    this.dateOfBirth,
    required this.countryId,
    required this.desiredStudyCountryIds,
    required this.academicsInterestIds,
    required this.currentStudyLevelId,
  });

  @override
  List<Object?> get props => [
    name,
    bio,
    profilePicture,
    dateOfBirth,
    countryId,
    desiredStudyCountryIds,
    academicsInterestIds,
    currentStudyLevelId,
  ];

  factory CreateProfileDto.fromJson(Map<String, dynamic> json) {
    return CreateProfileDto(
      name:json['name'],
      bio: json['bio'],
      profilePicture: json['profilePicture'] != null ? File(json['profilePicture']) : null,
      dateOfBirth: json['dateOfBirth'] != null ? DateTime.parse(json['dateOfBirth']) : null,
      countryId: json['countryId'],
      desiredStudyCountryIds: List<int>.from(json['desiredStudyCountryIds']),
      academicsInterestIds: List<int>.from(json['academicsInterestIds']),
      currentStudyLevelId: json['currentStudyLevelId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name':name,
      'bio': bio,
      'profilePicture': profilePicture?.path,
      'dateOfBirth': dateOfBirth?.toIso8601String(),
      'countryId': countryId,
      'desiredStudyCountryIds': desiredStudyCountryIds,
      'academicsInterestIds': academicsInterestIds,
      'currentStudyLevelId': currentStudyLevelId,
    };
  }
}
