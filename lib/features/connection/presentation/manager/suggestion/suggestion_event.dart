part of 'suggestion_bloc.dart';

abstract class SuggestionEvent extends Equatable {
  const SuggestionEvent();
}

class GetSuggestionEvent extends SuggestionEvent {
  @override
  List<Object?> get props => [];
}
