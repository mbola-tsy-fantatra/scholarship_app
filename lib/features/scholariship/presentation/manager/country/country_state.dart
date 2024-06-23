part of 'country_bloc.dart';

abstract class CountryState extends Equatable {
  const CountryState();
}

class Empty extends CountryState {
  @override
  List<Object> get props => [];
}

class CountryLoading extends CountryState {

  @override
  List<Object?> get props => [];
}

class CountryLoaded extends CountryState {
  final List<Country> country;
  const CountryLoaded({required this.country});

  @override
  List<Object?> get props => [country];
}

class CountryErrorState extends CountryState {
  final String message;
  const CountryErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}