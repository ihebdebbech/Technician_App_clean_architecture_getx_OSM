import 'package:shared/domain/authentication/authentication_repository.dart';
import 'package:shared/domain/room/room_repository.dart';
import 'package:shared/domain/roomManagement/entity/room_entity.dart';
import 'package:shared/domain/userManagement/entity/user_entity.dart';

class consultRoomUsecase {
  final RoomRepository _repository;

  consultRoomUsecase(this._repository);

  Future<List<RoomEntity>> getRooms() async {
    try {
      final rooms = await _repository.getRooms();
      print(rooms);
      return rooms.map((room) => RoomEntity.fromApiModel(room)).toList();
    } catch (error) {
      throw error;
    }
  }
}
