import 'package:scholariship/features/profile/domain/entities/user.dart';

class UserModel extends User{
  const UserModel({required super.updatedAt, required super.createdAt, required super.bio, required super.name, required super.email, required super.profileUrl});

    factory UserModel.fromJson(Map<String,dynamic> json){
    return UserModel(updatedAt: json['updatedAt'],
        createdAt: json['createdAt'], bio: json['bio'],
        name: json['name'], email: json['email'], profileUrl: json['profileUrl']
    );
  }
  Map<String,dynamic> toJson(){
    return {
      'name':name,
      'email':email,
      'profileUrl':profileUrl,
      'bio':bio,
      'createdAt':createdAt,
      'updatedAt':updatedAt
    };
  }


}