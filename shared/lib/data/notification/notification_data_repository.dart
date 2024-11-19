// ignore_for_file: non_constant_identifier_names

import 'package:shared/data/authentication/authentication_service.dart';
import 'package:shared/data/authentication/model/authentication_api_model.dart';
import 'package:shared/data/notification/model/notification_api_model.dart';
import 'package:shared/data/notification/notification_data_service.dart';
import 'package:shared/data/room_management/model/room_api_model.dart';
import 'package:shared/data/room_management/room_management_service.dart';
import 'package:shared/domain/authentication/authentication_repository.dart';
import 'package:shared/domain/notification/Notification_repository.dart';
import 'package:shared/domain/room/room_repository.dart';
import 'package:shared/domain/roomManagement/entity/room_entity.dart';
import 'package:shared/domain/userManagement/entity/user_entity.dart';

class NotificationDataRepository implements NotificationRepository {
  final NotificationDataService _service;

  NotificationDataRepository(this._service);

  @override
  Future<List<NotificationApiModel>> getNotifications() async {
    final notifs = await _service.getNotifications();
    return notifs;
  }
}
