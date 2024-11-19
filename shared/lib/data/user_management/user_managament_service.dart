import 'package:core/data/local_storage.dart';
import 'package:core/data/local_storage_keys.dart';
import 'package:core/data/network_client.dart';
import 'package:shared/data/authentication/model/authentication_api_model.dart';
import 'package:shared/data/room_management/model/room_api_model.dart';
import 'package:shared/data/user_management/model/user_api_model.dart';
import 'package:shared/domain/roomManagement/entity/room_entity.dart';
import 'package:shared/domain/userManagement/entity/user_entity.dart';

class UserManagamentService {
  final NetworkClient _networkClient;
  final LocalStorage _localStorage;

  UserManagamentService(this._networkClient, this._localStorage);

  Future<UserApiModel> getUserDetails() async {
    try {
      final response = await _networkClient
          .getRequest("user/getuserdetailsbyid", requiresAuthentication: true);
      final Map<String, dynamic> data =
          response.data['user'] as Map<String, dynamic>;
      print("details");
      print(response.data["user"]);
      // Map each item in the list to a RoomApiModel instance
      return UserApiModel.fromJson(data);
    } catch (error) {
      throw error;
    }
  }
}
