import 'package:freezed_annotation/freezed_annotation.dart';
part 'room_api_model.freezed.dart';
part 'room_api_model.g.dart';

@freezed
class RoomApiModel with _$RoomApiModel {
  factory RoomApiModel({   required int id,
    required String name,
    required String roomTopic,
    required String centralUnitUuid,
    required String plantName,
    required String Status,
    required List<double> neededPh,
    required List<double> neededEc,
    required List<double> neededAirTemp,
    required List<double> neededWaterTemp,
    required List<double> neededCo2,
    required List<double> neededHumidity,
    double? quantitySolA,
    double? quantitySolB,
    double? quantityPhDown,
    required int waterRunningTime,
    required double waterPumpSchedule,
    required double latestPh,
    required double latestEc,
    required double latestAirTemp,
    required double latestWaterTemp,
    required double latestCo2,
    required double latestHumidity,
    required double latestWaterLevel,
    DateTime? updatedAt,}) =
      _RoomApiModel;
  factory RoomApiModel.fromJson(Map<String, dynamic> json) =>
      _$RoomApiModelFromJson(json);
}
