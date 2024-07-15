import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:universal_html/html.dart' as html;
import 'dart:async';

import '../../../../core/services/sse_manager.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../global/utils/map_failure_message.dart';
import '../../data/models/notification_model.dart';
import '../../domain/entities/Notification.dart';
import '../../domain/usecases/get_notificatiions.dart';


part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final GetNotificationUseCase usecase;
  final Sse sse;

  NotificationBloc({required this.usecase, required this.sse}) : super(Empty()) {
    on<GetNotificationEvent>(_getNotifications);
    on<NewNotificationEvent>(_handleNewNotification);
    _initSse();
  }

  Future<void> _getNotifications(GetNotificationEvent event, Emitter<NotificationState> emit) async {
    emit(Loading());
    final response = await usecase(NoParams());
    response?.fold((failure) {
      emit(ErrorState(message: mapFailureToMessage(failure)));
    }, (notifications) {
      emit(Loaded(notifications: notifications));
    });
  }

  void _initSse() {
    sse.stream.listen((data) {
      final notification = NotificationModel.fromJson(data);
      add(NewNotificationEvent(notification));
    });
  }

  void _handleNewNotification(NewNotificationEvent event, Emitter<NotificationState> emit) {
    if (state is Loaded) {
      final currentState = state as Loaded;
      final updatedNotifications = List<Notifications>.from(currentState.notifications!)
        ..insert(0, event.notification);
      emit(Loaded(notifications: updatedNotifications));
    }
  }

  @override
  Future<void> close() {
    sse.close();
    return super.close();
  }
}
