// ignore_for_file: non_constant_identifier_names

import 'package:shared/data/authentication/authentication_service.dart';
import 'package:shared/data/authentication/model/authentication_api_model.dart';
import 'package:shared/domain/authentication/authentication_repository.dart';
import 'package:shared/domain/userManagement/entity/user_entity.dart';

class AuthenticationDataRepository implements AuthenticationRepository {
  final AuthenticationService _service;

  AuthenticationDataRepository(this._service);

  @override
  Future<AuthenticationApiModel> login(String email, String password,String fcmtoken) async {
    try {
      final authApiModel = await _service.login(email, password,fcmtoken);

      return authApiModel;
    } catch (error) {
      throw error;
    }
  }

  @override
  void saveToken(String token) {
    _service.saveToken(token);
  }

  @override
  Future<bool> getToken() async {
    try {
      await _service.getToken();
      return true;
    } catch (error) {
      return false;
    }
  }

  @override
  Future<AuthenticationApiModel> CreateAccount(UserEntity user) async {
    try {
      final authApiModel = await _service.CreateAccount(user);

      return authApiModel;
    } catch (error) {
      throw error;
    }
  }
}
