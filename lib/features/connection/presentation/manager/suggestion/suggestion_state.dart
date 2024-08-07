part of 'suggestion_bloc.dart';

abstract class SuggestionState extends Equatable {
  const SuggestionState();

  @override
  List<Object?> get props => [];
}

class Empty extends SuggestionState {}

class Loading extends SuggestionState {}

class Loaded extends SuggestionState {
  final List<UserProfile> profiles;

  const Loaded({required this.profiles});

  @override
  List<Object> get props => [profiles];
}

class ErrorState extends SuggestionState {
  final String message;

  const ErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
