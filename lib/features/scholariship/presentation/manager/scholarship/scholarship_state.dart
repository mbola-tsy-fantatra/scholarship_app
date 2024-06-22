part of 'scholarship_bloc.dart';

abstract class ScholarshipState extends Equatable {
  const ScholarshipState();
}

class Empty extends ScholarshipState {
  @override
  List<Object> get props => [];
}

class Loading extends ScholarshipState {

  @override
  List<Object?> get props => [];
}

class Loaded extends ScholarshipState {
  final List<Scholarship> scholarships;
  const Loaded({required this.scholarships});

  @override
  List<Object?> get props => [scholarships];
}

class ErrorState extends ScholarshipState {
  final String message;
  const ErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}