import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:scholariship/features/profile/domain/entities/profile.dart';
import '../../../../core/dto/profile/create_profile_dto.dart';
import '../../../../global/utils/map_failure_message.dart';
import '../../../connection/domain/entities/user_profile.dart';
import '../../domain/usecases/create_user_profile.dart';
import '../../domain/usecases/get_user_profile.dart';
import '../../domain/usecases/upate_user_profile.dart';

part 'profile_event.dart';
part 'profile_state.dart';


const String serverFailureMessage = 'Server failure';
const String cacheFailureMessage = 'Cache failure';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {

  final GetUserProfile getUserProfile;
  final CreateUserProfile createUserProfile;
  final UpdateUserProfile updateUserProfile;

  ProfileBloc({required this.getUserProfile,required this.createUserProfile,required this.updateUserProfile}) : super(Empty()) {
    on<GetUserProfileEvent>(_getUserProfile);
    on<CreateUserProfileEvent>(_createUserProfile);
    on<UpdateUserProfileEvent>(_updateUserProfile);
  }


  Future<void> _getUserProfile(GetUserProfileEvent event, Emitter<ProfileState> emit) async {
    emit(Loading());
    final response = await getUserProfile(Params( userId: event.userId));
    response?.fold((failure) {
      emit(ErrorState(message: mapFailureToMessage(failure)));
    }, (profile) {
      emit(Loaded(user: profile));
    }
    );
  }

  Future<void> _createUserProfile(CreateUserProfileEvent event, Emitter<ProfileState> emit) async {
    emit(Loading());
    final response = await createUserProfile(CreateParams(profileDto: event.profileDto));
    response?.fold((failure) {
      emit(ErrorState(message: mapFailureToMessage(failure)));
    }, (user) {
      emit(Loaded(user: user));
    });
  }

  Future<void> _updateUserProfile(UpdateUserProfileEvent event, Emitter<ProfileState> emit) async {
    // emit(Loading());
    // final response = await updateUserProfile(UpdateParams(profileDto: event.profileDto));
    // response?.fold((failure) {
    //   emit(ErrorState(message: mapFailureToMessage(failure)));
    // }, (user) {
    //   emit(Loaded(user: user));
    // });
  }
}