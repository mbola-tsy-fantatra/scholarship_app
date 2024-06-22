part of 'country_bloc.dart';

abstract class CountryState extends Equatable {
  const CountryState();
}

class Empty extends CountryState {
  @override
  List<Object> get props => [];
}

class Loading extends CountryState {

  @override
  List<Object?> get props => [];
}

class Loaded extends CountryState {
  final Country country;
  const Loaded({required this.country});

  @override
  List<Object?> get props => [country];
}

class ErrorState extends CountryState {
  final String message;
  const ErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}