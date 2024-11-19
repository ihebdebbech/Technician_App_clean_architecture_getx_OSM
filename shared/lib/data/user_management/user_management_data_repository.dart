// ignore_for_file: non_constant_identifier_names

import 'package:shared/data/authentication/authentication_service.dart';
import 'package:shared/data/authentication/model/authentication_api_model.dart';
import 'package:shared/data/room_management/model/room_api_model.dart';
import 'package:shared/data/room_management/room_management_service.dart';
import 'package:shared/data/user_management/model/user_api_model.dart';
import 'package:shared/data/user_management/user_managament_service.dart';
import 'package:shared/domain/authentication/authentication_repository.dart';
import 'package:shared/domain/room/room_repository.dart';
import 'package:shared/domain/roomManagement/entity/room_entity.dart';
import 'package:shared/domain/userManagement/entity/user_entity.dart';
import 'package:shared/domain/userManagement/user_repository.dart';

class UserManagementDataRepository implements UserRepository {
  final UserManagamentService _service;

  UserManagementDataRepository(this._service);

  @override
  Future<UserApiModel> getUserDetails() async {
    final userdata = await _service.getUserDetails();
    return userdata;
  }
}
