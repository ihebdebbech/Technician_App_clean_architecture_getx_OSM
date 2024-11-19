import 'dart:ffi';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_api_model.freezed.dart';
part 'user_api_model.g.dart';

@freezed
class UserApiModel with _$UserApiModel {
  factory UserApiModel(
      {required String username,
      required String firstname,
      required String lastname,
      String? birthdate,
      required String email,
      required int phonenumber,
      required bool premium,
      required DateTime? paymentdate,
      }) = _UserApiModel;

  factory UserApiModel.fromJson(Map<String, dynamic> json) =>
      _$UserApiModelFromJson(json);
}
