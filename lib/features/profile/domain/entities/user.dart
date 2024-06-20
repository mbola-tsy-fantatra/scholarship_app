import 'package:equatable/equatable.dart';

class User extends Equatable{
  final String name;
  final String email;
  final String profileUrl;
  final String bio;
  final DateTime updatedAt;
  final DateTime createdAt;

  const User({required this.updatedAt, required this.createdAt,required this.bio,required this.name,required this.email,required this.profileUrl});

  @override
  List<Object?> get props => [name,email,profileUrl,bio,name,email,updatedAt,createdAt];

}