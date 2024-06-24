import 'package:dartz/dartz.dart';
import 'package:scholariship/features/scholariship/data/request/create_scholarship.dart';
import 'package:scholariship/features/scholariship/domain/entities/academic.dart';
import 'package:scholariship/features/scholariship/domain/entities/country.dart';
import 'package:scholariship/features/scholariship/domain/entities/studyLevel.dart';
import 'package:scholariship/global/error/exeception.dart';
import 'package:scholariship/global/error/failure.dart';
import '../../domain/entities/sholarship.dart';
import '../../domain/repository/scholarship_repository.dart';
import '../datasources/scholarship_remote_data_source.dart';

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

  @override
  Future<Either<Failure, List<Academic>>>? getAcademics() async{
    try{
      final academics = await remoteDataSource.getAcademics();
      return Right(academics);
    }on ServerException{
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<Country>>>? getCountry() async{
    try{
      final countries = await remoteDataSource.getCountry();
      return Right(countries);
    }on ServerException{
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<StudyLevel>>>? getStudyLevels() async{
    try{
      final studyLevels = await remoteDataSource.getStudyLevel();
      return Right(studyLevels);
    }on ServerException{
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Scholarship>> createScholarship(CreateScholarship createScholarship) async{
    try{
      final scholarship = await remoteDataSource.createScholarship(createScholarship);
      return Right(scholarship);
    }on ServerException{
      return Left(ServerFailure());
    }
  }

}