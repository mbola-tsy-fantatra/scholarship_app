import 'package:equatable/equatable.dart';
import 'connnection_item.dart';

class Connection extends Equatable{
  final int totalCount;
  final int page;
  final int limit;
  final List<ConnectionItem> connections;

  const Connection({required this.connections,required this.totalCount, required this.page, required this.limit});

  @override
  List<Object?> get props => [totalCount, page, limit];
}