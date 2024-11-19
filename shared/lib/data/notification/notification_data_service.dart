import 'package:core/data/local_storage.dart';
import 'package:core/data/local_storage_keys.dart';
import 'package:core/data/network_client.dart';
import 'package:shared/data/authentication/model/authentication_api_model.dart';
import 'package:shared/data/notification/model/notification_api_model.dart';
import 'package:shared/data/room_management/model/room_api_model.dart';
import 'package:shared/data/user_management/model/user_api_model.dart';
import 'package:shared/domain/roomManagement/entity/room_entity.dart';
import 'package:shared/domain/userManagement/entity/user_entity.dart';

class NotificationDataService {
  final NetworkClient _networkClient;
  final LocalStorage _localStorage;

  NotificationDataService(this._networkClient, this._localStorage);

  Future<List<NotificationApiModel>> getNotifications() async {
    try {
      final response = await _networkClient.getRequest("notif/getnotifsbyuserid",
          requiresAuthentication: true);
      final Map<String, dynamic> data = response.data as Map<String, dynamic>;
      final List<dynamic> notifs = data['notifs'] as List<dynamic>;

      // Map each item in the list to a RoomApiModel instance
      return notifs
          .map((json) => NotificationApiModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (error) {
      throw error;
    }
  }
}
