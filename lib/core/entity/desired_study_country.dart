import 'package:equatable/equatable.dart';

import 'country.dart';

class DesiredStudyCountry extends Equatable{
  final Country country;

  const DesiredStudyCountry({
    required this.country,
  });

  @override
  List<Object?> get props => [country];
}
