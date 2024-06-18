import 'package:scholariship/features/auth/domain/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository{
  @override
  Future<String> login({required String email, required String password}) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<String> signup({required String email, required String username, required String password}) {
    // TODO: implement signup
    throw UnimplementedError();
  }

}