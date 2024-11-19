import 'package:shared/data/taskmanagement/model/task_api_model.dart';
import 'package:shared/data/user_management/model/user_api_model.dart';
import 'package:shared/domain/userManagement/entity/user_entity.dart';

class TaskEntity {
  final int id;
  final String title;
  final String? description;
  final String? report;
  final String taskType;
  final String status;
  final double? longitude;
  final double? latitude;
  final DateTime? dueDate;
  final DateTime createdAt;
  final DateTime? completedAt;
  final int technicianId;
  final String userEmail;
  final UserApiModel? user;

  TaskEntity({
    required this.id,
    required this.title,
    this.description,
    this.report,
    required this.taskType,
    required this.status,
    this.longitude,
    this.latitude,
    this.dueDate,
    required this.createdAt,
    this.completedAt,
    required this.technicianId,
    required this.userEmail,
     this.user,
  });
  factory TaskEntity.fromApiModel(taskApiModel apiModel) {
    return TaskEntity(
      id: apiModel.id,
      title: apiModel.title,
      description: apiModel.description,
      taskType: apiModel.taskType,
      status: apiModel.status,
      report: apiModel.report,
      dueDate: apiModel.dueDate,
      completedAt: apiModel.completedAt,
      createdAt: apiModel.createdAt,
      latitude: apiModel.latitude,
      longitude: apiModel.longitude,
      technicianId: apiModel.technicianId,
      userEmail: apiModel.userEmail,
      user: apiModel.user
      
    );
  }
  taskApiModel toApiModel() {
    return taskApiModel(
      id: id,
      title: title,
      description: description,
     taskType: taskType,
      status: status,
      report: report,
      dueDate: dueDate,
      completedAt: completedAt,
      createdAt: createdAt,
      latitude: latitude,
      longitude: longitude,
      technicianId:technicianId,
      userEmail: userEmail,
      
    );
  }
}
