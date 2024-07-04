part of 'save_bloc.dart';

abstract class SaveState extends Equatable {
  const SaveState();
}

class Empty extends SaveState {
  @override
  List<Object> get props => [];
}
