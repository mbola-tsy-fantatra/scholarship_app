import 'package:scholariship/features/auth/domain/entities/user_connected.dart';

class UserConnectedModel extends UserConnected{
  const UserConnectedModel({required super.email, required super.id, required super.username, required super.coverPhoto});


  factory UserConnectedModel.fromJson(Map<String,dynamic> json){
    return UserConnectedModel(email: json['email'], id: json['id'], username: json['username'], coverPhoto: json['coverPhoto']);
  }

  Map<String,dynamic> toJson(){
    return {
      'id':id,
      'username':username,
      'coverPhoto':coverPhoto,
      'email':email,
  };
  }

}