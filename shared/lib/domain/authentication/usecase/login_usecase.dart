import 'package:shared/domain/authentication/authentication_repository.dart';
import 'package:shared/domain/userManagement/entity/user_entity.dart';

class LoginUsecase {
  final AuthenticationRepository _repository;

  LoginUsecase(this._repository);

  Future<bool> login(String email, String password,String fcmtoken) async {
    try {
      final auth = await _repository.login(email, password,fcmtoken);
      _repository.saveToken(auth.token);
      return true;
    } catch (error) {
      throw error;
    }
  }
}
