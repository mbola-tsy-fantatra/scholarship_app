import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/user.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ExampleBloc extends Bloc<ProfileEvent, ProfileState> {
  ExampleBloc() : super(Empty()) {
    on<ProfileEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
