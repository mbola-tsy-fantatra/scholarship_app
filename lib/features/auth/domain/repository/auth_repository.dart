abstract class AuthRepository{
  Future<String> login({required String email,required String password});
  Future<String> signup({required String email,required String username,required String password});
}