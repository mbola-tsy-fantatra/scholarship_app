import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:scholariship/core/usecases/usecase.dart';
import 'package:scholariship/features/scholariship/domain/entities/studyLevel.dart';
import 'package:scholariship/features/scholariship/domain/repository/scholarship_repository.dart';
import 'package:scholariship/global/error/failure.dart';

class GetStudyLevels extends UseCase<List<StudyLevel>,NoParams>{

  final ScholarshipRepository scholarshipRepository;

  GetStudyLevels({required this.scholarshipRepository});

  @override
  Future<Either<Failure, List<StudyLevel>>?> call(NoParams params) async{
    return await scholarshipRepository.getStudyLevels();
  }

}

class NoParams extends Equatable{
  @override
  List<Object?> get props => [];

}