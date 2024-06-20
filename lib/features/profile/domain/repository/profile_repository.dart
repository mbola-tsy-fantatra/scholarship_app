import 'package:dartz/dartz.dart';
import 'package:scholariship/global/error/failure.dart';

import '../../data/models/user_model.dart';

abstract class ProfileRepository{
  Future<Either<Failure,UserModel>>? getUserProfileInfo();
}