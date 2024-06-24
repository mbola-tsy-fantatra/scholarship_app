import 'package:equatable/equatable.dart';
import 'package:scholariship/features/connection/domain/entities/profile.dart';

class Friend extends Equatable{
  final String username;
  final Profile profile;

  const Friend({required this.username, required this.profile});

  @override
  List<Object?> get props => [username,profile];

}