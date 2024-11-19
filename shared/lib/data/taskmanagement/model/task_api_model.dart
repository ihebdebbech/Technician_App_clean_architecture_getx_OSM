import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shared/data/user_management/model/user_api_model.dart';
part 'task_api_model.freezed.dart';
part 'task_api_model.g.dart';

@freezed
class taskApiModel with _$taskApiModel {
  factory taskApiModel({   required int id,
    required String title,
    String? description,
    String? report,
    required String taskType,
    required String status,
    double? longitude,
    double? latitude,
    DateTime? dueDate,
    required DateTime createdAt,
    DateTime? completedAt,
    required int technicianId,
    required String userEmail,
     UserApiModel? user,}) =
      _taskApiModel;
  factory taskApiModel.fromJson(Map<String, dynamic> json) =>
      _$taskApiModelFromJson(json);
}
