import 'package:dartz/dartz.dart';
import 'package:scholariship/features/scholariship/data/request/create_scholarship.dart';
import 'package:scholariship/features/scholariship/domain/entities/academic.dart';
import 'package:scholariship/core/entity/studyLevel.dart';
import 'package:scholariship/global/error/failure.dart';

import '../../../../core/entity/country.dart';
import '../entities/sholarship.dart';

abstract class ScholarshipRepository{
  Future<Either<Failure,List<Scholarship>>>? findScholarship(String location,String studyLevel,String studyField);
  Future<Either<Failure,Scholarship>> createScholarship(CreateScholarship createScholarship);
  Future<Either<Failure,List<Academic>>>? getAcademics();
  Future<Either<Failure,List<StudyLevel>>>? getStudyLevels();
  Future<Either<Failure,List<Country>>>? getCountry();
}

