import 'package:shared/data/authentication/model/authentication_api_model.dart';
import 'package:shared/data/room_management/model/room_api_model.dart';
import 'package:shared/data/user_management/model/user_api_model.dart';

class RoomEntity {
  final int id;
  final String name;
  final String roomTopic;
  final String Status;
  final String centralUnitUuid;
   String plantName;
   List<double> neededPh;
   List<double> neededEc;
   List<double> neededAirTemp;
   List<double> neededWaterTemp;
   List<double> neededCo2;
   List<double> neededHumidity;
   double? quantitySolA;
   double? quantitySolB;
   double? quantityPhDown;
  final int waterRunningTime;
  final double waterPumpSchedule;
  final double latestPh;
  final double latestEc;
  final double latestAirTemp;
  final double latestWaterTemp;
  final double latestCo2;
  final double latestHumidity;
  final double latestWaterLevel;
  final DateTime? updatedAt;

  RoomEntity({
    required this.id,
    required this.name,
    required this.roomTopic,
    required this.Status,
    required this.centralUnitUuid,
    required this.plantName,
    required this.neededPh,
    required this.neededEc,
    required this.neededAirTemp,
    required this.neededWaterTemp,
    required this.neededCo2,
    required this.neededHumidity,
    this.quantitySolA,
    this.quantitySolB,
    this.quantityPhDown,
    required this.waterRunningTime,
    required this.waterPumpSchedule,
    this.latestPh = 0.0,
    this.latestEc = 0.0,
    this.latestAirTemp = 0.0,
    this.latestWaterTemp = 0.0,
    this.latestCo2 = 0.0,
    this.latestHumidity = 0.0,
    this.latestWaterLevel = 0.0,
    this.updatedAt,
  });

  @override
  String toString() {
    return 'RoomEntity(id: $id, name: $name, roomTopic: $roomTopic, centralUnitUuid: $centralUnitUuid, plantName: $plantName, neededPh: $neededPh, neededEc: $neededEc, neededAirTemp: $neededAirTemp, neededWaterTemp: $neededWaterTemp, neededCo2: $neededCo2, neededHumidity: $neededHumidity, quantitySolA: $quantitySolA, quantitySolB: $quantitySolB, quantityPhDown: $quantityPhDown, waterRunningTime: $waterRunningTime, waterPumpSchedule: $waterPumpSchedule, latestPh: $latestPh, latestEc: $latestEc, latestAirTemp: $latestAirTemp, latestWaterTemp: $latestWaterTemp, latestCo2: $latestCo2, latestHumidity: $latestHumidity, latestWaterLevel: $latestWaterLevel, updatedAt: $updatedAt)';
  }

  factory RoomEntity.fromApiModel(RoomApiModel apiModel) {
    return RoomEntity(
      id: apiModel.id,
      name: apiModel.name,
      Status: apiModel.Status,
      roomTopic: apiModel.roomTopic,
      centralUnitUuid: apiModel.centralUnitUuid,
      plantName: apiModel.plantName,
      neededPh: apiModel.neededPh,
      neededEc: apiModel.neededEc,
      neededAirTemp: apiModel.neededAirTemp,
      neededWaterTemp: apiModel.neededWaterTemp,
      neededCo2: apiModel.neededCo2,
      neededHumidity: apiModel.neededHumidity,
      quantitySolA: apiModel.quantitySolA,
      quantitySolB: apiModel.quantitySolB,
      quantityPhDown: apiModel.quantityPhDown,
      waterRunningTime: apiModel.waterRunningTime,
      waterPumpSchedule: apiModel.waterPumpSchedule,
      latestPh: apiModel.latestPh,
      latestEc: apiModel.latestEc,
      latestAirTemp: apiModel.latestAirTemp,
      latestWaterTemp: apiModel.latestWaterTemp,
      latestCo2: apiModel.latestCo2,
      latestHumidity: apiModel.latestHumidity,
      latestWaterLevel: apiModel.latestWaterLevel,
      updatedAt: apiModel.updatedAt,
    );
  }
   RoomApiModel toApiModel() {
    return RoomApiModel(
      id: id,
      name: name,
      roomTopic: roomTopic,
      Status: Status,
      centralUnitUuid: centralUnitUuid,
      plantName: plantName,
      neededPh: neededPh,
      neededEc: neededEc,
      neededAirTemp: neededAirTemp,
      neededWaterTemp: neededWaterTemp,
      neededCo2: neededCo2,
      neededHumidity: neededHumidity,
      quantitySolA: quantitySolA,
      quantitySolB: quantitySolB,
      quantityPhDown: quantityPhDown,
      waterRunningTime: waterRunningTime,
      waterPumpSchedule: waterPumpSchedule,
      latestPh: latestPh,
      latestEc: latestEc,
      latestAirTemp: latestAirTemp,
      latestWaterTemp: latestWaterTemp,
      latestCo2: latestCo2,
      latestHumidity: latestHumidity,
      latestWaterLevel: latestWaterLevel,
      
    );
  }
}
