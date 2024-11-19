// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authentication_api_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AuthenticationApiModel _$AuthenticationApiModelFromJson(
    Map<String, dynamic> json) {
  return _AuthenticationApiModel.fromJson(json);
}

/// @nodoc
mixin _$AuthenticationApiModel {
  String get token => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthenticationApiModelCopyWith<AuthenticationApiModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationApiModelCopyWith<$Res> {
  factory $AuthenticationApiModelCopyWith(AuthenticationApiModel value,
          $Res Function(AuthenticationApiModel) then) =
      _$AuthenticationApiModelCopyWithImpl<$Res, AuthenticationApiModel>;
  @useResult
  $Res call({String token});
}

/// @nodoc
class _$AuthenticationApiModelCopyWithImpl<$Res,
        $Val extends AuthenticationApiModel>
    implements $AuthenticationApiModelCopyWith<$Res> {
  _$AuthenticationApiModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
  }) {
    return _then(_value.copyWith(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthenticationApiModelImplCopyWith<$Res>
    implements $AuthenticationApiModelCopyWith<$Res> {
  factory _$$AuthenticationApiModelImplCopyWith(
          _$AuthenticationApiModelImpl value,
          $Res Function(_$AuthenticationApiModelImpl) then) =
      __$$AuthenticationApiModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String token});
}

/// @nodoc
class __$$AuthenticationApiModelImplCopyWithImpl<$Res>
    extends _$AuthenticationApiModelCopyWithImpl<$Res,
        _$AuthenticationApiModelImpl>
    implements _$$AuthenticationApiModelImplCopyWith<$Res> {
  __$$AuthenticationApiModelImplCopyWithImpl(
      _$AuthenticationApiModelImpl _value,
      $Res Function(_$AuthenticationApiModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
  }) {
    return _then(_$AuthenticationApiModelImpl(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthenticationApiModelImpl implements _AuthenticationApiModel {
  _$AuthenticationApiModelImpl({required this.token});

  factory _$AuthenticationApiModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthenticationApiModelImplFromJson(json);

  @override
  final String token;

  @override
  String toString() {
    return 'AuthenticationApiModel(token: $token)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenticationApiModelImpl &&
            (identical(other.token, token) || other.token == token));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, token);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthenticationApiModelImplCopyWith<_$AuthenticationApiModelImpl>
      get copyWith => __$$AuthenticationApiModelImplCopyWithImpl<
          _$AuthenticationApiModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthenticationApiModelImplToJson(
      this,
    );
  }
}

abstract class _AuthenticationApiModel implements AuthenticationApiModel {
  factory _AuthenticationApiModel({required final String token}) =
      _$AuthenticationApiModelImpl;

  factory _AuthenticationApiModel.fromJson(Map<String, dynamic> json) =
      _$AuthenticationApiModelImpl.fromJson;

  @override
  String get token;
  @override
  @JsonKey(ignore: true)
  _$$AuthenticationApiModelImplCopyWith<_$AuthenticationApiModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
