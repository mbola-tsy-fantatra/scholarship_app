import '../models/connection_model.dart';
import '../models/connection_received_model.dart';
import '../models/connection_sender_model.dart';

abstract class ConnectionRemoteDataSources{
    Future<ConnectionSenderModel> getConnectionSent(int limit,int page);
    Future<ConnectionReceivedModel> getConnectionReceived(int limit,int page);
    Future<ConnectionModel> getConnections(int limit,int page);
}

class ConnectionRemoteDataSourceImpl implements ConnectionRemoteDataSources{
  @override
  Future<ConnectionReceivedModel> getConnectionReceived(int limit, int page) {
    // TODO: implement getConnectionReceived
    throw UnimplementedError();
  }

  @override
  Future<ConnectionSenderModel> getConnectionSent(int limit, int page) {
    // TODO: implement getConnectionSent
    throw UnimplementedError();
  }

  @override
  Future<ConnectionModel> getConnections(int limit, int page) {
    // TODO: implement getConnections
    throw UnimplementedError();
  }

}