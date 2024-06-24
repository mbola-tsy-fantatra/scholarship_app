import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:scholariship/core/usecases/usecase.dart';
import 'package:scholariship/features/scholariship/domain/entities/academic.dart';
import 'package:scholariship/features/scholariship/domain/repository/scholarship_repository.dart';
import 'package:scholariship/global/error/failure.dart';

class GetAcademics extends UseCase<List<Academic>,NoParams>{

  final ScholarshipRepository scholarshipRepository;

  GetAcademics({required this.scholarshipRepository});

  @override
  Future<Either<Failure, List<Academic>>?> call(NoParams params) async{
    return await scholarshipRepository.getAcademics();
  }

}

class NoParams extends Equatable{
  @override
  List<Object?> get props => [];

}