
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:scholariship/features/connection/data/request/connection_reply.dart';
import 'package:scholariship/global/utils/map_failure_message.dart';

import '../../../domain/usecases/accept_request_use_case.dart';
import '../../../domain/usecases/reject_request_use_case.dart';

part 'reply_event.dart';
part 'reply_state.dart';

class ReplyBloc extends Bloc<ReplyEvent, ReplyState> {

  final AcceptRequestUseCase acceptRequestUseCase;
  final RejectRequestUseCase rejectRequestUseCase;

  ReplyBloc({required this.acceptRequestUseCase,required this.rejectRequestUseCase}) : super(Empty()) {
    on<AcceptRequest>(_acceptRequest);
    on<RejectRequest>(_rejectRequest);

  }
    Future<void> _acceptRequest(AcceptRequest event,Emitter emit)async{
        emit(Loading());
        final response = await acceptRequestUseCase(ReplyParams(connectionReply: ConnectionReply(action: "ACCEPTED", senderId: event.receiverId)));
        response?.fold((failure){
          emit(ErrorState(message: mapFailureToMessage(failure)));
        }, (res){
          emit(Loaded());
        });
    }
  Future<void> _rejectRequest(RejectRequest event,Emitter emit)async{
        emit(Loading());
        final response  = await rejectRequestUseCase(ReplyParams(connectionReply: ConnectionReply(action: "DECLINED", senderId: event.receiverId)));
        response?.fold((failure){
          emit(ErrorState(message: mapFailureToMessage(failure)));
        }, (res){
          emit(Loaded());
        });
    }
}
