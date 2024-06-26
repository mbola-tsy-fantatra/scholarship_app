import 'package:equatable/equatable.dart';
import 'package:scholariship/features/scholariship/domain/entities/profile_saved.dart';

import '../../../connection/domain/entities/profile.dart';

class Scholarship extends Equatable{
  final String id;
  // final String title;
  final String name;
  final String description;
  final DateTime applicationStartDate;
  final DateTime applicationEndDate;
  final String officialLink;
  final String organizationName;
  final String coverPhoto;
  final String applicationStartPeriod;
  final String fundingType;
  final List<dynamic>? savedBy;

  const Scholarship({required this.fundingType,required this.applicationStartPeriod,required this.description,required this.id, required this.name, required this.applicationStartDate, required this.applicationEndDate, required this.officialLink, required this.organizationName, required this.coverPhoto,this.savedBy});

  @override
  List<Object?> get props => [id,name,applicationEndDate,savedBy,applicationStartDate,officialLink,organizationName,coverPhoto];

}