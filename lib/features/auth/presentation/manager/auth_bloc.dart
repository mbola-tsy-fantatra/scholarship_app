import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../global/utils/map_failure_message.dart';
import '../../domain/repository/auth_repository.dart';

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
      final response = await authRepository.login(email: event.email, password: event.password);
      response.fold((failure){
        emit(ErrorState(message:mapFailureToMessage(failure) ));
      }, (authResponse) async {
        emit(Loaded());
      });
  }

  Future<void> _onRegister(Register event, Emitter<AuthState> emit)async {
    emit(Loading());
    final response = await authRepository.signup(email: event.email, username: event.username, password:event.password);
    response.fold((failure){
      emit(ErrorState(message:mapFailureToMessage(failure) ));
    }, (right){
      emit(Loaded());
    });
  }
}
