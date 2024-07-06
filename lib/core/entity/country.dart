import 'package:equatable/equatable.dart';

class Country extends Equatable{
  final int countryId;
  final String name;

  const Country({required this.countryId, required this.name});

  @override
  List<Object?> get props => [countryId,name];

}