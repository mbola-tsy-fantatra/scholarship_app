import 'package:equatable/equatable.dart';

class User extends Equatable{
  final String id;
  final String username;
  final DateTime createdAt;
  final DateTime updatedAt;

  User({
    required this.id,
    required this.username,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [id,username,createdAt,updatedAt];
}
