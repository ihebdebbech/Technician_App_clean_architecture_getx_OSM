// ignore_for_file: non_constant_identifier_names

import 'package:shared/data/authentication/authentication_service.dart';
import 'package:shared/data/authentication/model/authentication_api_model.dart';
import 'package:shared/data/room_management/model/room_api_model.dart';
import 'package:shared/data/room_management/room_management_service.dart';
import 'package:shared/domain/authentication/authentication_repository.dart';
import 'package:shared/domain/room/room_repository.dart';
import 'package:shared/domain/roomManagement/entity/room_entity.dart';
import 'package:shared/domain/userManagement/entity/user_entity.dart';

class RoomManagementDataRepository implements RoomRepository {
  final RoomManagementService _service;

  RoomManagementDataRepository(this._service);

  @override
  Future<List<RoomApiModel>> getRooms() async {
    final rooms = await _service.getRooms();
    return rooms;
  }

  @override
  Future<bool> UpdatePhdown(RoomEntity room) async {
    try{
    final status = await _service.publishphdown(room);
    return status;
    }catch(err){
      print(err);
      return false;
    }
  }

  @override
  Future<bool> UpdateSolutionValues(RoomEntity room) async {
    try{
 final status = await _service.publishSolution(room);
    return status;
     }catch(err){
      print(err);
      return false;
    }
  }

  @override
  Future<bool> UpdateWaterCycle(RoomEntity room,String interval, String duration) async {
    try{
    final status = await _service.publishWatercycle(room,interval,duration);
    return status;
     }catch(err){
      print(err);
      return false;
    }
  }
}
