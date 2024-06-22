part of 'academic_bloc.dart';

abstract class AcademicState extends Equatable {
  const AcademicState();
}

class Empty extends AcademicState {
  @override
  List<Object> get props => [];
}

class Loading extends AcademicState {

  @override
  List<Object?> get props => [];
}

class Loaded extends AcademicState {
  final Academic academic;
  const Loaded({required this.academic});

  @override
  List<Object?> get props => [academic];
}

class ErrorState extends AcademicState {
  final String message;
  const ErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
