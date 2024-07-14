import 'package:equatable/equatable.dart';

class StudyLevel extends Equatable{
  final int id;
  final String name;

  const StudyLevel({required this.id, required this.name});

  @override
  List<Object?> get props => [id,name];

}