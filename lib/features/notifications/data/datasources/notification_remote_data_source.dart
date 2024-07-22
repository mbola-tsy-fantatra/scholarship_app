import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:scholariship/features/notifications/data/models/notification_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../../../../global/error/exeception.dart';

abstract class NotificationRemoteDataSource{
  Future<List<NotificationModel>>  getNotificationsList();
}

class NotificationRemoteDataSourceImpl implements NotificationRemoteDataSource{
  final SharedPreferences sharedPreferences;
  final http.Client client;

  NotificationRemoteDataSourceImpl({required this.sharedPreferences,required this.client});

  @override
  Future<List<NotificationModel>> getNotificationsList() async{
    final String? token = sharedPreferences.getString('access_token');
    final url = Uri.parse('${dotenv.env['BASE_URL']!}/notifications/get');
    final response = await client.get(
      url,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((data)=> NotificationModel.fromJson(data)).toList();
    } else {
      throw ServerException();
    }
  }

}

