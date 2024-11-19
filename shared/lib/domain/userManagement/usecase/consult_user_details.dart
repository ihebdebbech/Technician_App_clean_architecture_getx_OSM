import 'package:shared/domain/authentication/authentication_repository.dart';
import 'package:shared/domain/room/room_repository.dart';
import 'package:shared/domain/roomManagement/entity/room_entity.dart';
import 'package:shared/domain/userManagement/entity/user_entity.dart';
import 'package:shared/domain/userManagement/user_repository.dart';

class ConsultUserDetails {
  final UserRepository _repository;

  ConsultUserDetails(this._repository);

  Future<UserEntity> getUserDetails() async {
    try {
      final user = await _repository.getUserDetails();
      
      return UserEntity.fromApiModel(user);
    } catch (error) {
      throw error;
    }
  }
}
