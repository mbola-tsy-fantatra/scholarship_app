import 'package:equatable/equatable.dart';
import 'package:scholariship/features/notifications/domain/entities/notificatoion_profile.dart';

class From extends Equatable{
    final String id;
    final NotificationProfile profile;
    const From({required this.id,required this.profile});

  @override
  List<Object?> get props => [id, profile];
}