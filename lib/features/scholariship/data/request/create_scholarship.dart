import 'dart:io';
import 'package:equatable/equatable.dart';

class CreateScholarship extends Equatable {
  final String name;
  final String officialLink;
  final String description;
  final File coverPhoto;
  final String organizationName;
  final String fundingType;
  final DateTime? startApplicationDate;
  final DateTime? endApplicationDate;
  final String applicationStartPeriod;
  final List<int> hostCountriesIds;
  final List<int> studyLevelsIds;

  const CreateScholarship({
    required this.name,
    required this.officialLink,
    required this.description,
    required this.coverPhoto,
    required this.organizationName,
    required this.fundingType,
    required this.startApplicationDate,
    required this.endApplicationDate,
    required this.applicationStartPeriod,
    required this.hostCountriesIds,
    required this.studyLevelsIds,
  });

  @override
  List<Object?> get props => [
    name,
    officialLink,
    description,
    coverPhoto,
    organizationName,
    fundingType,
    startApplicationDate,
    endApplicationDate,
    applicationStartPeriod,
    hostCountriesIds,
    studyLevelsIds,
  ];

  factory CreateScholarship.fromJson(Map<String, dynamic> json) {
    return CreateScholarship(
      name: json['name'],
      officialLink: json['officialLink'],
      description: json['description'],
      coverPhoto: File(json['coverPhoto']),
      organizationName: json['organizationName'],
      fundingType: json['fundingType'],
      startApplicationDate: DateTime.parse(json['startApplicationDate']),
      endApplicationDate: DateTime.parse(json['endApplicationDate']),
      applicationStartPeriod: json['applicationStartPeriod'],
      hostCountriesIds: List<int>.from(json['hostCountriesIds']),
      studyLevelsIds: List<int>.from(json['studyLevelsIds']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'officialLink': officialLink,
      'description': description,
      'organizationName': organizationName,
      'fundingType': fundingType.toString(),
      'startApplicationDate': startApplicationDate?.toIso8601String(),
      'endApplicationDate': endApplicationDate?.toIso8601String(),
      'applicationStartPeriod': applicationStartPeriod,
      'hostCountriesIds': hostCountriesIds.map((id) => id.toString()).toList(),
      'studyLevelsIds': studyLevelsIds.map((id) => id.toString()).toList(),
    };
  }
}
