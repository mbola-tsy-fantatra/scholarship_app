import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:scholariship/features/auth/domain/auth_repository.dart';
import 'package:http/http.dart' as http;

class AuthRepositoryImpl implements AuthRepository{
  final http.Client client;
  AuthRepositoryImpl(this.client);
  @override
  Future<String> login ({required String email, required String password}) async{
    final url= Uri.parse('${dotenv.env['BASE_URL']!}/login');
    final response = await client.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );
    if(response.statusCode == 200){
       return response.body;
    }else{
      throw Exception('Failed to sign up');
    }
  }

  @override
  Future<String> signup({required String email, required String username, required String password}) async {
    final url= Uri.parse('${dotenv.env['BASE_URL']!}/register');
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
        'username': username,
      }),
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to sign up');
    }
  }

}