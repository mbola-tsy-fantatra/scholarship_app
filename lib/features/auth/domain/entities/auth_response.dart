import 'package:equatable/equatable.dart';

class AuthResponse extends Equatable{
  final String access_token;
  final String refresh_token;
  final String userId;
  final bool hasProfile;

  const AuthResponse({required this.hasProfile,required this.access_token, required this.refresh_token, required this.userId});

  @override
  List<Object?> get props => [access_token,refresh_token];

}