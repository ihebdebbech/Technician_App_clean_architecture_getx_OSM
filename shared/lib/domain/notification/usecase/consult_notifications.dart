import 'package:shared/domain/authentication/authentication_repository.dart';
import 'package:shared/domain/notification/Notification_repository.dart';
import 'package:shared/domain/notification/notification_entity.dart';
import 'package:shared/domain/room/room_repository.dart';
import 'package:shared/domain/roomManagement/entity/room_entity.dart';
import 'package:shared/domain/userManagement/entity/user_entity.dart';

class ConsultNotifications {
  final NotificationRepository _repository;

  ConsultNotifications(this._repository);

  Future<List<NotificationEntity>> getNotifications() async {
    try {
      final rooms = await _repository.getNotifications();
      print(rooms);
      return rooms.map((notif) => NotificationEntity.fromApiModel(notif)).toList();
    } catch (error) {
      throw error;
    }
  }
}
