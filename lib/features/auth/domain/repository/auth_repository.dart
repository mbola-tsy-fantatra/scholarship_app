import 'package:dartz/dartz.dart';
import 'package:scholariship/features/auth/domain/entities/auth_response.dart';

import '../../../../global/error/failure.dart';

abstract class AuthRepository{
  Future<Either<Failure,AuthResponse>> login({required String email,required String password});
  Future<Either<Failure,void>> signup({required String email,required String username,required String password});
}