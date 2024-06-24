import 'package:equatable/equatable.dart';
import 'package:scholariship/features/connection/domain/entities/profile.dart';

class Sender extends Equatable{
  final String username;
  final Profile profile;

  const Sender({required this.username,required this.profile});

  @override
  List<Object?> get props => [username,profile];


}