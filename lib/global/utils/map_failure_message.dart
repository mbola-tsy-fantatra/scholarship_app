import '../../features/profile/presentation/manager/profile_bloc.dart';
import '../error/failure.dart';

String mapFailureToMessage(Failure failure){
  switch(failure.runtimeType){
    case ServerFailure :
      return serverFailureMessage;
    case CacheFailure :
      return cacheFailureMessage;
    default:
      return 'Unexpected error';
  }
}