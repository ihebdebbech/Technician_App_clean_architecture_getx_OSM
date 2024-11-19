// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationApiModelImpl _$$NotificationApiModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationApiModelImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      body: json['body'] as String,
      type: json['type'] as String,
      userId: (json['userId'] as num).toInt(),
      isRead: json['isRead'] as bool,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$NotificationApiModelImplToJson(
        _$NotificationApiModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'body': instance.body,
      'type': instance.type,
      'userId': instance.userId,
      'isRead': instance.isRead,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
