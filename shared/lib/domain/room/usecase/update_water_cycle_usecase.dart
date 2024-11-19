import 'package:shared/domain/authentication/authentication_repository.dart';
import 'package:shared/domain/room/room_repository.dart';
import 'package:shared/domain/roomManagement/entity/room_entity.dart';
import 'package:shared/domain/userManagement/entity/user_entity.dart';

class UpdateWaterCycleUsecase {
  final RoomRepository _repository;

  UpdateWaterCycleUsecase(this._repository);

  Future<bool> UpdateWaterCycle(RoomEntity room,String interval,String duration) async {
    try {
      final rooms = await _repository.UpdateWaterCycle( room, interval, duration);
      print(rooms);
      return true;
    } catch (error) {
      throw error;
    }
  }
}
