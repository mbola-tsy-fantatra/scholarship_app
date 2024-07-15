import 'package:equatable/equatable.dart';

import 'from.dart';

class Notifications extends Equatable{

  final String id;
  final String type;
  final String sourceId;
  final bool isRead;
  final String content;
  final String fromId;
  final String toId;
  final DateTime createdAt;
  final From from;

  const Notifications({ required this.content,required this.type,required this.id, required this.fromId,required this.from,required this.createdAt,required this.isRead,required this.sourceId,required this.toId});

  @override
  List<Object?> get props => [id, from, createdAt, isRead, sourceId, toId,type,fromId];
}