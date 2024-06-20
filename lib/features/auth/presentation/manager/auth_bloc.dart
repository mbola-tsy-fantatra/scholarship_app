import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc(this.authRepository) : super(Empty()) {
    on<Login>(_onLogin);
    on<Register>(_onRegister);
  }

  Future<void> _onLogin(Login event, Emitter<AuthState> emit)async {
      emit(Loading());

  }

  Future<void> _onRegister(Register event, Emitter<AuthState> emit)async {

  }
}
