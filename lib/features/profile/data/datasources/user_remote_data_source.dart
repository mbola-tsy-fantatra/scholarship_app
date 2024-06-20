import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:scholariship/global/error/exeception.dart';
import '../models/user_model.dart';
import 'package:http/http.dart' as http;

abstract class UserRemoteDataSource{
  Future<UserModel>? getUserProfileInfo();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource{
  final http.Client client;

  UserRemoteDataSourceImpl({required this.client});
  @override
  Future<UserModel>? getUserProfileInfo() async{
    final url =Uri.http('${dotenv.env['BASE_URL']}/user/profile');
    const token ='';
    final response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    if(response.statusCode == 200){
      return UserModel.fromJson(json.decode(response.body));
    }
    throw ServerException();
  }
}