import 'package:dartz/dartz.dart';
import 'package:scholariship/global/error/failure.dart';

import '../entities/sholarship.dart';

abstract class ScholarshipRepository{
  Future<Either<Failure,List<Scholarship>>>? findScholarship(String location,String studyLevel,String studyField);
}

