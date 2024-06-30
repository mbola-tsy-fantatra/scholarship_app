import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:scholariship/features/connection/data/request/connection_request.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../../global/error/exeception.dart';
import '../models/connection_model.dart';
import '../models/connection_received_model.dart';
import '../models/connection_sender_model.dart';

abstract class ConnectionRemoteDataSources{
    Future<List<ConnectionSenderModel>> getConnectionSent(int limit,int page);
    Future<List<ConnectionReceivedModel>> getConnectionReceived(int limit,int page);
    Future<ConnectionModel> getConnections(int limit,int page);
    Future<ConnectionSenderModel> sendConnectionRequest(ConnectionRequest connectionRequest );
}

class ConnectionRemoteDataSourceImpl implements ConnectionRemoteDataSources{

  final SharedPreferences sharedPreferences;
  final http.Client client;

  ConnectionRemoteDataSourceImpl({required this.sharedPreferences,required this.client});

  @override
  Future<List<ConnectionReceivedModel>> getConnectionReceived(int limit, int page) async{
    final String? token = sharedPreferences.getString('access_token');
    final url = Uri.parse('${dotenv.env['BASE_URL']!}/connections/request/received');
    final response = await client.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      print(response.body);
      List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((data) => ConnectionReceivedModel.fromJson(data)).toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<ConnectionSenderModel>> getConnectionSent(int limit, int page) async{
    final String? token = sharedPreferences.getString('access_token');
    final url = Uri.parse('${dotenv.env['BASE_URL']!}/connections/request/sent');
    final response = await client.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      print(response.body);
      List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((data) => ConnectionSenderModel.fromJson(data)).toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ConnectionModel> getConnections(int limit, int page) async{
    final String? token = sharedPreferences.getString('access_token');
    final url = Uri.parse('${dotenv.env['BASE_URL']!}/connections');
    final response = await client.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      print(response.body);
      return ConnectionModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ConnectionSenderModel> sendConnectionRequest(ConnectionRequest connectionRequest) async{
    final String? token = sharedPreferences.getString('access_token');
    final url = Uri.parse('${dotenv.env['BASE_URL']!}/connections/request');
    final response = await client.post(
        url,
        headers: {
          'Authorization': 'Bearer $token',
        },
      body: jsonEncode(connectionRequest)
    );
    if (response.statusCode == 200) {
      print(response.body);
      return jsonDecode(response.body);
    } else {
      throw ServerException();
    }
  }

}