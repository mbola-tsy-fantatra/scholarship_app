import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:scholariship/core/usecases/usecase.dart';
import 'package:scholariship/features/scholariship/data/request/create_scholarship.dart';
import 'package:scholariship/features/scholariship/domain/entities/sholarship.dart';
import 'package:scholariship/features/scholariship/domain/repository/scholarship_repository.dart';
import 'package:scholariship/global/error/failure.dart';

class CreateScholarshipCase extends UseCase<Scholarship,CreateParams>{

  final ScholarshipRepository scholarshipRepository;

  CreateScholarshipCase({required  this.scholarshipRepository});

  @override
  Future<Either<Failure, Scholarship>?> call(CreateParams params) async{
    return await scholarshipRepository.createScholarship(params.createScholarship);
  }
  
}

class CreateParams extends Equatable{

  final CreateScholarship createScholarship;

  const CreateParams(this.createScholarship);

  @override
  List<Object?> get props => [createScholarship];

}