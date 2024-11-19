import 'dart:ffi';

import 'package:shared/domain/authentication/authentication_repository.dart';
import 'package:shared/domain/room/room_repository.dart';
import 'package:shared/domain/roomManagement/entity/room_entity.dart';
import 'package:shared/domain/userManagement/entity/user_entity.dart';

class UpdatePhdownUsecase {
  final RoomRepository _repository;

  UpdatePhdownUsecase(this._repository);

  Future<bool> UpdatePhdown(RoomEntity room) async {
    try {
      final rooms = await _repository.UpdatePhdown( room);
      print(rooms);
      return true;
    } catch (error) {
      throw error;
    
    }
  }
}
