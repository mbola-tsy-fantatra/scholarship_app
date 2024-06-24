import 'package:scholariship/features/connection/domain/entities/connection.dart';

import '../../domain/entities/connnection_item.dart';
import 'connection_item_model.dart';

class ConnectionModel extends Connection {
  const ConnectionModel({
    required List<ConnectionItemModel> connections,
    required int totalCount,
    required int page,
    required int limit,
  }) : super(connections: connections, totalCount: totalCount, page: page, limit: limit);

  factory ConnectionModel.fromJson(Map<String, dynamic> json) {
    return ConnectionModel(
      connections: (json['connections'] as List)
          .map((item) => ConnectionItemModel.fromJson(item))
          .toList(),
      totalCount: json['totalCount'],
      page: json['page'],
      limit: json['limit'],
    );
  }
}