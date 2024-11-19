import 'package:shared/data/authentication/model/authentication_api_model.dart';
import 'package:shared/data/notification/model/notification_api_model.dart';
import 'package:shared/data/user_management/model/user_api_model.dart';

class NotificationEntity {
  final String title;
  final String body;
  final String type;
  final int userId;
  final bool isRead;

  final DateTime createdAt;

  NotificationEntity({required this.title, required this.body, required this.type, required this.userId, required this.isRead,required this.createdAt}
      );

  @override
  String toString() {
    return 'notificationEntity(title: $title, body: $body)';
  }

  factory NotificationEntity.fromApiModel(NotificationApiModel apiModel) {
    return NotificationEntity(
      title: apiModel.title,
      body: apiModel.body,
      type: apiModel.type,
      userId: apiModel.userId,
      isRead: apiModel.isRead,
      createdAt: apiModel.createdAt!,
    );
  }
}
