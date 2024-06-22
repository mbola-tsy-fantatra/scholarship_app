part of 'scholarship_bloc.dart';

abstract class ScholarshipEvent extends Equatable {
  const ScholarshipEvent();
}

class SearchScholarship extends ScholarshipEvent{
  final String country;
  final String studyLevel;
  final String query;

  const SearchScholarship({required this.country, required this.studyLevel, required this.query});
  @override
  List<Object?> get props => [country,studyLevel,query];

}
