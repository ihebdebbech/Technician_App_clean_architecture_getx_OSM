import 'package:core/data/local_storage.dart';
import 'package:core/data/local_storage_keys.dart';
import 'package:core/data/network_client.dart';
import 'package:shared/data/authentication/model/authentication_api_model.dart';
import 'package:shared/data/room_management/model/room_api_model.dart';
import 'package:shared/data/user_management/model/user_api_model.dart';
import 'package:shared/domain/roomManagement/entity/room_entity.dart';
import 'package:shared/domain/userManagement/entity/user_entity.dart';

class RoomManagementService {
  final NetworkClient _networkClient;
  final LocalStorage _localStorage;

  RoomManagementService(this._networkClient, this._localStorage);

  Future<List<RoomApiModel>> getRooms() async {
    try {
      

      final response =
          await _networkClient.getRequest("room/roomsbyownerid",requiresAuthentication: true);
 final Map<String, dynamic> data = response.data as Map<String, dynamic>;
    final List<dynamic> rooms = data['rooms'] as List<dynamic>;

      // Map each item in the list to a RoomApiModel instance
      return rooms.map((json) => RoomApiModel.fromJson(json as Map<String, dynamic>)).toList();
    } catch (error) {
      throw error;
    }
  }
  Future<bool> publishphdown(RoomEntity room) async {
    try {
      

           final Map<String, dynamic> requestData = {
        "uuid": room.centralUnitUuid,
        "roomId": room.id,
        "roomTopic": room.roomTopic,
        "quantity": room.quantityPhDown,
        
      };

      final response =
          await _networkClient.postRequest("room/commandph", requestData,requiresAuthentication: true);
      return true;
    } catch (error) {
      throw error;
    }
  }
  Future<bool> publishSolution(RoomEntity room) async {
    try {
      

           final Map<String, dynamic> requestData = {
        "uuid": room.centralUnitUuid,
        "roomId": room.id,
        "roomTopic": room.roomTopic,
        "quantityA": room.quantitySolA,
         "quantityB": room.quantitySolB,
        
      };

      final response =
          await _networkClient.postRequest("room/commandsol", requestData,requiresAuthentication: true);
      return true;
    } catch (error) {
      throw error;
    }
  }
    Future<bool> publishWatercycle(RoomEntity room,String interval, String duration) async {
    try {
      

      final Map<String, dynamic> requestData = {
        "uuid": room.centralUnitUuid,
        "roomId": room.id,
        "roomTopic": room.roomTopic,
        "intervale": interval,
        "duration": duration,
        
      };

      final response =
          await _networkClient.postRequest("room/commandwatercycle", requestData,requiresAuthentication: true);
      return true;
    } catch (error) {
      throw error;
      
    }
  }

}
