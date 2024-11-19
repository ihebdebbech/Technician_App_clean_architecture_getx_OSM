import 'dart:ffi';

import 'package:core/data/local_storage.dart';
import 'package:core/data/local_storage_keys.dart';
import 'package:core/data/network_client.dart';
import 'package:shared/data/authentication/model/authentication_api_model.dart';
import 'package:shared/data/taskmanagement/model/task_api_model.dart';
import 'package:shared/data/user_management/model/user_api_model.dart';
import 'package:shared/domain/taskManagement/usecase/update_central_owner_usecase.dart';
import 'package:shared/domain/userManagement/entity/user_entity.dart';

class taskManagementService {
  final NetworkClient _networkClient;
  final LocalStorage _localStorage;

  taskManagementService(this._networkClient, this._localStorage);

  Future<List<taskApiModel>> gettasksfortechnician() async {
    try {
      

      final response =
          await _networkClient.getRequest("task/gettasksbytechnicianid",requiresAuthentication: true);
 final Map<String, dynamic> data = response.data as Map<String, dynamic>;
    final List<dynamic> tasks = data['tasks'] as List<dynamic>;

      // Map each item in the list to a taskApiModel instance
      return tasks.map((json) => taskApiModel.fromJson(json as Map<String, dynamic>)).toList();
    } catch (error) {
      throw error;
    }
  }
  Future<bool> updateCentralOwner(String email, String uuid, double latitude, double longitude) async {
    try {
      final Map<String, dynamic> requestData = {
        "uuid": uuid,
        "email": email,
        "latitude": latitude,
        "longitude": longitude,
        
      };

      final response =
          await _networkClient.putRequest("central-unit/updatecentralowner",requestData,requiresAuthentication: true);
 final Map<String, dynamic> data = response.data as Map<String, dynamic>;
   

       return true;
    } catch (error) {
      throw error;
    }
  }
   
     Future<bool> completeTask(int taskId, String report) async {
    try {
      final Map<String, dynamic> requestData = {
        "taskid": taskId,
        "report": report,
   };

      final response =
          await _networkClient.putRequest("task/completetask",requestData,requiresAuthentication: true);
 final Map<String, dynamic> data = response.data as Map<String, dynamic>;
   

       return true;
    } catch (error) {
      throw error;
    }
  }

}
