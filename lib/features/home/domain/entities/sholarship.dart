import 'package:equatable/equatable.dart';

class Scholarship extends Equatable{
  final String scholarshipId;
  final String title;
  final String name;
  final String requirements;
  final DateTime applicationStartDate;
  final DateTime applicationEndDate;
  final String officialLink;
  final String organizationName;
  final String coverPhotoUrl;

  const Scholarship({required this.scholarshipId, required this.title, required this.name, required this.requirements, required this.applicationStartDate, required this.applicationEndDate, required this.officialLink, required this.organizationName, required this.coverPhotoUrl});

  @override
  List<Object?> get props => [scholarshipId,title,name,requirements,applicationEndDate,applicationStartDate,officialLink,organizationName,coverPhotoUrl];

}