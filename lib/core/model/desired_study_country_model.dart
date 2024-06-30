// data/models/desired_study_country_model.dart
import '../entity/desired_study_country.dart';
import 'country_model.dart';

class DesiredStudyCountryModel extends DesiredStudyCountry {
  const DesiredStudyCountryModel({
    required CountryModel country,
  }) : super(
    country: country,
  );

  factory DesiredStudyCountryModel.fromJson(Map<String, dynamic> json) {
    return DesiredStudyCountryModel(
      country: CountryModel.fromJson(json['country']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'country': (country as CountryModel).toJson(),
    };
  }
}
