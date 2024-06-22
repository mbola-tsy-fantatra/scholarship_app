import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:scholariship/core/usecases/usecase.dart';
import 'package:scholariship/global/error/failure.dart';

import '../entities/sholarship.dart';
import '../repository/scholarship_repository.dart';

class FindScholarship extends UseCase<List<Scholarship>,Params>{
  final ScholarshipRepository scholarshipRepository;

  FindScholarship({required this.scholarshipRepository});
  @override
  Future<Either<Failure, List<Scholarship>>?> call(Params params) async{
      return await scholarshipRepository.findScholarship(params.location, params.studyLevel, params.studyField);
  }

}

class Params extends Equatable{
  final String location;
  final String studyLevel;
  final String studyField;

  const Params({required this.location, required this.studyLevel, required this.studyField});

  @override
  List<Object?> get props => [location,studyField,studyLevel];

}