// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserApiModelImpl _$$UserApiModelImplFromJson(Map<String, dynamic> json) =>
    _$UserApiModelImpl(
      username: json['username'] as String,
      firstname: json['firstname'] as String,
      lastname: json['lastname'] as String,
      birthdate: json['birthdate'] as String?,
      email: json['email'] as String,
      phonenumber: (json['phonenumber'] as num).toInt(),
      premium: json['premium'] as bool,
      paymentdate: json['paymentdate'] == null
          ? null
          : DateTime.parse(json['paymentdate'] as String),
    );

Map<String, dynamic> _$$UserApiModelImplToJson(_$UserApiModelImpl instance) =>
    <String, dynamic>{
      'username': instance.username,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'birthdate': instance.birthdate,
      'email': instance.email,
      'phonenumber': instance.phonenumber,
      'premium': instance.premium,
      'paymentdate': instance.paymentdate?.toIso8601String(),
    };
