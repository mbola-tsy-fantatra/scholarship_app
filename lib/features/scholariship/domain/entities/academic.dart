import 'package:equatable/equatable.dart';

class Academic extends Equatable{
  final int id;
  final String key;
  final String title;

  const Academic({required this.id, required this.key, required this.title});


  @override
  List<Object?> get props => [id,key,title];
}