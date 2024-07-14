
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'save_event.dart';
part 'save_state.dart';

class SaveBloc extends Bloc<SaveEvent, SaveState> {
  SaveBloc() : super(Empty()) {
    on<SaveEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
