// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$taskApiModelImpl _$$taskApiModelImplFromJson(Map<String, dynamic> json) =>
    _$taskApiModelImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      description: json['description'] as String?,
      report: json['report'] as String?,
      taskType: json['taskType'] as String,
      status: json['status'] as String,
      longitude: (json['longitude'] as num?)?.toDouble(),
      latitude: (json['latitude'] as num?)?.toDouble(),
      dueDate: json['dueDate'] == null
          ? null
          : DateTime.parse(json['dueDate'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
      technicianId: (json['technicianId'] as num).toInt(),
      userEmail: json['userEmail'] as String,
      user: json['user'] == null
          ? null
          : UserApiModel.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$taskApiModelImplToJson(_$taskApiModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'report': instance.report,
      'taskType': instance.taskType,
      'status': instance.status,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'dueDate': instance.dueDate?.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'completedAt': instance.completedAt?.toIso8601String(),
      'technicianId': instance.technicianId,
      'userEmail': instance.userEmail,
      'user': instance.user,
    };
