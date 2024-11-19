import 'dart:ffi';

import 'package:shared/data/authentication/model/authentication_api_model.dart';
import 'package:shared/data/room_management/model/room_api_model.dart';
import 'package:shared/domain/room/usecase/update_phdown_usecase.dart';
import 'package:shared/domain/room/usecase/update_solution_values_usecase.dart';
import 'package:shared/domain/room/usecase/update_water_cycle_usecase.dart';
import 'package:shared/domain/roomManagement/entity/room_entity.dart';
import 'package:shared/domain/userManagement/entity/user_entity.dart';

abstract class RoomRepository {
  Future<List<RoomApiModel>> getRooms();
   Future<bool> UpdatePhdown(RoomEntity room);
   Future<bool> UpdateSolutionValues(RoomEntity room);
  Future<bool> UpdateWaterCycle(RoomEntity room,String interval,String duration);
}
