import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:scholariship/features/profile/domain/repository/profile_repository.dart';

import '../../../../global/error/failure.dart';
import '../../domain/entities/user.dart';

part 'profile_event.dart';
part 'profile_state.dart';


const String serverFailureMessage = 'Server failure';
const String cacheFailureMessage = 'Cache failure';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository profileRepository;
  ProfileBloc(this.profileRepository) : super(Empty()) {
    on<ProfileEvent>(_getUserProfile);
  }



  Future<void>_getUserProfile(ProfileEvent event,Emitter<ProfileState> emit)async {
      emit(Loading());
      final response = await profileRepository.getUserProfileInfo();
      response?.fold((failure){
          emit(ErrorState(message:_mapFailureToMessage(failure) ));
      }, (profile){
          emit(Loaded(user: profile));
      }
      );
  }
  String _mapFailureToMessage(Failure failure){
    switch(failure.runtimeType){
      case ServerFailure :
        return serverFailureMessage;
      case CacheFailure :
        return cacheFailureMessage;
      default:
        return 'Unexpected error';
    }
  }

}
