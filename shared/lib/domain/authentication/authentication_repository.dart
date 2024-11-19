import 'package:shared/data/authentication/model/authentication_api_model.dart';
import 'package:shared/domain/userManagement/entity/user_entity.dart';

abstract class AuthenticationRepository {
  Future<AuthenticationApiModel> login(String email, String password,String fcmtoken);
  Future<AuthenticationApiModel> CreateAccount(UserEntity user);
  void saveToken(String token);
   Future<bool> getToken();
}
