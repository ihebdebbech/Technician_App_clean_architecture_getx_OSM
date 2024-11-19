import 'dart:ffi';

import 'package:shared/domain/authentication/authentication_repository.dart';
import 'package:shared/domain/room/room_repository.dart';
import 'package:shared/domain/roomManagement/entity/room_entity.dart';
import 'package:shared/domain/taskManagement/entity/task.dart';
import 'package:shared/domain/taskManagement/task_repository.dart';
import 'package:shared/domain/userManagement/entity/user_entity.dart';

class UpdateCentralOwnerUsecase {
  final TaskRepository _repository;

  UpdateCentralOwnerUsecase(this._repository);

  Future<bool> updateCentralOwner(
      String email, String uuid, double latitude, double longitude) async {
    try {
      final status = await _repository.updateCentralOwner(
          email, uuid, latitude, longitude);
      
      return status;
    } catch (error) {
    
      return false;
    }
  }
  Future<bool> completeTask(
      int taskId, String report) async {
    try {
      final status = await _repository.completeTask(
          taskId,report);
      
      return status;
    } catch (error) {
  
      return false;
    }
  }
}
