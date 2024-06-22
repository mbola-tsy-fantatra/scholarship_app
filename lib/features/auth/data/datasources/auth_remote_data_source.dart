import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../models/auth_response_model.dart';

abstract class AuthRemoteDataSource{
    Future<AuthResponseModel> login(String email,String password);
    Future<void> register( String email, String username, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{
  final http.Client client;



  AuthRemoteDataSourceImpl({required this.client});
  @override
  Future<AuthResponseModel> login(String email, String password) async{
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
      return AuthResponseModel.fromJson(jsonDecode(response.body));
    }else{
      throw Exception('Failed to sign up');
    }

  }

  @override
  Future<void> register(String email, String username, String password) async {
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

    } else {
      throw Exception('Failed to sign up');
    }
  }

}