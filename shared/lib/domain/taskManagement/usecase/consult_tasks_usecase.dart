import 'package:shared/domain/authentication/authentication_repository.dart';
import 'package:shared/domain/room/room_repository.dart';
import 'package:shared/domain/roomManagement/entity/room_entity.dart';
import 'package:shared/domain/taskManagement/entity/task.dart';
import 'package:shared/domain/taskManagement/task_repository.dart';
import 'package:shared/domain/userManagement/entity/user_entity.dart';

class ConsultTasksUsecase {
  final TaskRepository _repository;

  ConsultTasksUsecase(this._repository);

  Future<List<TaskEntity>> gettasks() async {
    try {
      final tasks = await _repository.gettasksfortechnician();
      print(tasks);
      return tasks.map((task) => TaskEntity.fromApiModel(task)).toList();
    } catch (error) {
      throw error;
    }
  }
}
