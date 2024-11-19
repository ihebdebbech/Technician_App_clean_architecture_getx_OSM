// ignore_for_file: non_constant_identifier_names

import 'dart:ffi';

import 'package:shared/data/authentication/authentication_service.dart';
import 'package:shared/data/authentication/model/authentication_api_model.dart';
import 'package:shared/data/taskmanagement/model/task_api_model.dart';
import 'package:shared/data/taskmanagement/task_management_service.dart';
import 'package:shared/domain/authentication/authentication_repository.dart';
import 'package:shared/domain/taskManagement/task_repository.dart';
import 'package:shared/domain/userManagement/entity/user_entity.dart';

class taskManagementDataRepository implements TaskRepository {
  final taskManagementService _service;

  taskManagementDataRepository(this._service);

  @override
  Future<List<taskApiModel>> gettasksfortechnician() async {
    final tasks = await _service.gettasksfortechnician();
    return tasks;
  }
  
  @override
  Future<bool> updateCentralOwner(String email, String uuid, double latitude, double longitude) async {
    try{
   final status = await _service.updateCentralOwner(email,uuid,latitude,longitude);
    return true;
    }catch(err){
      return false;
    }
  }
  
  @override
  Future<bool> completeTask(int taskId, String report) async {
   try{
   final status = await _service.completeTask(taskId,report);
    return true;
    }catch(err){
      return false;
    }
  }

  

  

 
}
