import 'package:freezed_annotation/freezed_annotation.dart';
part 'authentication_api_model.freezed.dart';
part 'authentication_api_model.g.dart';

@freezed
class AuthenticationApiModel with _$AuthenticationApiModel {
  factory AuthenticationApiModel({required String token}) =
      _AuthenticationApiModel;
  factory AuthenticationApiModel.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationApiModelFromJson(json);
}
