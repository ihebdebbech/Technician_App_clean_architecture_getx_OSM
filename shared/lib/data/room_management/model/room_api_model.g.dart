// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RoomApiModelImpl _$$RoomApiModelImplFromJson(Map<String, dynamic> json) =>
    _$RoomApiModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      roomTopic: json['roomTopic'] as String,
      centralUnitUuid: json['centralUnitUuid'] as String,
      plantName: json['plantName'] as String,
      Status: json['Status'] as String,
      neededPh: (json['neededPh'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      neededEc: (json['neededEc'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      neededAirTemp: (json['neededAirTemp'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      neededWaterTemp: (json['neededWaterTemp'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      neededCo2: (json['neededCo2'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      neededHumidity: (json['neededHumidity'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      quantitySolA: (json['quantitySolA'] as num?)?.toDouble(),
      quantitySolB: (json['quantitySolB'] as num?)?.toDouble(),
      quantityPhDown: (json['quantityPhDown'] as num?)?.toDouble(),
      waterRunningTime: (json['waterRunningTime'] as num).toInt(),
      waterPumpSchedule: (json['waterPumpSchedule'] as num).toDouble(),
      latestPh: (json['latestPh'] as num).toDouble(),
      latestEc: (json['latestEc'] as num).toDouble(),
      latestAirTemp: (json['latestAirTemp'] as num).toDouble(),
      latestWaterTemp: (json['latestWaterTemp'] as num).toDouble(),
      latestCo2: (json['latestCo2'] as num).toDouble(),
      latestHumidity: (json['latestHumidity'] as num).toDouble(),
      latestWaterLevel: (json['latestWaterLevel'] as num).toDouble(),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$RoomApiModelImplToJson(_$RoomApiModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'roomTopic': instance.roomTopic,
      'centralUnitUuid': instance.centralUnitUuid,
      'plantName': instance.plantName,
      'Status': instance.Status,
      'neededPh': instance.neededPh,
      'neededEc': instance.neededEc,
      'neededAirTemp': instance.neededAirTemp,
      'neededWaterTemp': instance.neededWaterTemp,
      'neededCo2': instance.neededCo2,
      'neededHumidity': instance.neededHumidity,
      'quantitySolA': instance.quantitySolA,
      'quantitySolB': instance.quantitySolB,
      'quantityPhDown': instance.quantityPhDown,
      'waterRunningTime': instance.waterRunningTime,
      'waterPumpSchedule': instance.waterPumpSchedule,
      'latestPh': instance.latestPh,
      'latestEc': instance.latestEc,
      'latestAirTemp': instance.latestAirTemp,
      'latestWaterTemp': instance.latestWaterTemp,
      'latestCo2': instance.latestCo2,
      'latestHumidity': instance.latestHumidity,
      'latestWaterLevel': instance.latestWaterLevel,
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
