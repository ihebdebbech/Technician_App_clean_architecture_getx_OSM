import 'package:freezed_annotation/freezed_annotation.dart';
part 'notification_api_model.freezed.dart';
part 'notification_api_model.g.dart';

@freezed
class NotificationApiModel with _$NotificationApiModel {
  factory NotificationApiModel({   required int id,
    required String title,
    required String body,
    required String type,
    required int userId,
    
    
    required bool isRead,

    DateTime? createdAt,}) =
      _NotificationApiModel;
  factory NotificationApiModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationApiModelFromJson(json);
}
