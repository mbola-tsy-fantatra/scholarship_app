import 'package:dartz/dartz.dart';
import 'package:scholariship/features/home/data/datasources/scholarship_remote_data_source.dart';
import 'package:scholariship/features/home/domain/entities/sholarship.dart';
import 'package:scholariship/features/home/domain/repository/scholarship_repository.dart';
import 'package:scholariship/global/error/exeception.dart';
import 'package:scholariship/global/error/failure.dart';

class ScholarshipRepositoryImpl implements ScholarshipRepository{
  final ScholarshipRemoteDataSource remoteDataSource;

  ScholarshipRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Scholarship>>>? findScholarship(String location, String studyLevel, String studyField) async{
    try{
      final scholarships = await remoteDataSource.findScholarship(location, studyLevel, studyField);
      return Right(scholarships);
    }on ServerException{
      return Left(ServerFailure());
    }
  }

}