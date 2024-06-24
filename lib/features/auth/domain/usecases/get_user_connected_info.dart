import 'package:dartz/dartz.dart';
import 'package:scholariship/core/usecases/usecase.dart';
import 'package:scholariship/global/error/failure.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../entities/user_connected.dart';


class GetUserConnectedInfo extends UseCase<UserConnected,NoParams>{

  final SharedPreferences sharedPreferences;

  GetUserConnectedInfo({required this.sharedPreferences});

  @override
  Future<Either<Failure, UserConnected>?> call(params) {
    throw UnimplementedError();
  }

}