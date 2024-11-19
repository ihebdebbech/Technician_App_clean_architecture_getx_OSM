import 'package:shared/domain/authentication/authentication_repository.dart';
import 'package:shared/domain/room/room_repository.dart';
import 'package:shared/domain/roomManagement/entity/room_entity.dart';
import 'package:shared/domain/userManagement/entity/user_entity.dart';

class UpdateSolutionValuesUsecase {
  final RoomRepository _repository;

  UpdateSolutionValuesUsecase(this._repository);


  Future<bool> UpdateSolutionValues(RoomEntity room) async {
    try {
      final rooms = await _repository.UpdateSolutionValues( room);
      print(rooms);
      return true;
    } catch (error) {
      throw error;
    }
  }
}
