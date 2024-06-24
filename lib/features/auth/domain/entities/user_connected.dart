import 'package:equatable/equatable.dart';

class UserConnected extends Equatable{
  final String email;
  final String id;
  final String username;
  final String coverPhoto;

  const UserConnected({required this.email,required this.id,required this.username,required this.coverPhoto});

  @override
  List<Object?> get props => [email,id,username,coverPhoto];

}