import 'dart:ffi';

import 'package:shared/data/authentication/model/authentication_api_model.dart';
import 'package:shared/data/taskmanagement/model/task_api_model.dart';
import 'package:shared/domain/userManagement/entity/user_entity.dart';

abstract class TaskRepository {
  Future<List<taskApiModel>> gettasksfortechnician();
   Future<bool> updateCentralOwner(String email,String uuid,double latitude,double longitude);
      Future<bool> completeTask(int taskId,String report);

}
