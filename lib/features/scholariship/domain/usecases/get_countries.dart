import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:scholariship/core/usecases/usecase.dart';
import 'package:scholariship/features/scholariship/domain/repository/scholarship_repository.dart';
import 'package:scholariship/global/error/failure.dart';

import '../../../../core/entity/country.dart';

class GetCountries extends UseCase<List<Country>,NoParams>{

  final ScholarshipRepository scholarshipRepository;

  GetCountries({required this.scholarshipRepository});

  @override
  Future<Either<Failure, List<Country>>?> call(NoParams params) async{
    return await scholarshipRepository.getCountry();
  }

}

class NoParams extends Equatable{
  @override
  List<Object?> get props => [];

}