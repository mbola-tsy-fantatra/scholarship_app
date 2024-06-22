import 'package:scholariship/features/auth/domain/entities/auth_response.dart';

class AuthResponseModel extends AuthResponse{
  const AuthResponseModel({required super.access_token, required super.refresh_token});
  factory AuthResponseModel.fromJson(Map<String,dynamic> json){
    return AuthResponseModel(access_token: json['access_token'], refresh_token: json['refresh_token']);
  }

  Map<String,dynamic> toJson(){
    return {
      'access_token':access_token,
      'refresh_token':refresh_token,
    };
  }
}