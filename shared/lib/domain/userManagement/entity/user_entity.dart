import 'package:shared/data/authentication/model/authentication_api_model.dart';
import 'package:shared/data/user_management/model/user_api_model.dart';

class UserEntity {
  final String username;
  final String firstname;
  final String lastname;
  final String? birthdate;
  final String email;
  final int phonenumber;
  final String? password;
    final bool premium;
       DateTime? paymentdate;

  UserEntity(
      {required this.username,
      required this.firstname,
      required this.lastname,
      this.birthdate,
      required this.email,
      required this.phonenumber,
      required this.premium,
       DateTime? paymentdate,
      this.password});

  @override
  String toString() {
    return 'UserEntity(username: $username, firstname: $firstname, lastname: $lastname, birthdate: $birthdate, email: $email, phonenumber: $phonenumber)';
  }

  factory UserEntity.fromApiModel(UserApiModel apiModel) {
    return UserEntity(
      username: apiModel.username,
      firstname: apiModel.firstname,
      lastname: apiModel.lastname,
      birthdate: apiModel.birthdate,
      email: apiModel.email,
      phonenumber: apiModel.phonenumber,
      premium: apiModel.premium,
      paymentdate: apiModel.paymentdate
    );
  }
}
