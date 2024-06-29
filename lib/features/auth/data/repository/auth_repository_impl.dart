import 'package:dartz/dartz.dart';
import 'package:scholariship/core/services/websocket_manager.dart';
import 'package:scholariship/features/auth/domain/repository/auth_repository.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../global/error/failure.dart';
import '../../domain/entities/auth_response.dart';
import '../datasources/auth_remote_data_source.dart';
import 'package:scholariship/core/config/injection_container.dart' as di;
class AuthRepositoryImpl implements AuthRepository{
  final http.Client client;
  final SharedPreferences sharedPreferences;
  final AuthRemoteDataSource remoteDataSource;
  AuthRepositoryImpl({required this.client, required this.sharedPreferences, required this.remoteDataSource});

  @override
  Future<Either<Failure,AuthResponse>> login ({required String email, required String password}) async{
    try{
      final authResponse =  await remoteDataSource.login(email, password);
       await sharedPreferences.remove('access_token');
       await sharedPreferences.remove('refresh_token');
       await sharedPreferences.remove('user_id');
       await sharedPreferences.setString('access_token', authResponse.access_token);
       await sharedPreferences.setString('refresh_token', authResponse.refresh_token);
       await sharedPreferences.setString('user_id', authResponse.userId);
       await di.sl<SocketManager>().updateAccessToken(authResponse.access_token);
      return Right(authResponse);
    }on ServerFailure{
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure,void>> signup({required String email, required String username, required String password}) async {
    try{
        final authResponse = await remoteDataSource.register(email, username, password);
        return right(authResponse);
    }on ServerFailure{
      return Left(ServerFailure());
    }
  }
}