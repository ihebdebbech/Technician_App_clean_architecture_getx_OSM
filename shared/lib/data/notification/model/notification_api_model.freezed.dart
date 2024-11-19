// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_api_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NotificationApiModel _$NotificationApiModelFromJson(Map<String, dynamic> json) {
  return _NotificationApiModel.fromJson(json);
}

/// @nodoc
mixin _$NotificationApiModel {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  bool get isRead => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationApiModelCopyWith<NotificationApiModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationApiModelCopyWith<$Res> {
  factory $NotificationApiModelCopyWith(NotificationApiModel value,
          $Res Function(NotificationApiModel) then) =
      _$NotificationApiModelCopyWithImpl<$Res, NotificationApiModel>;
  @useResult
  $Res call(
      {int id,
      String title,
      String body,
      String type,
      int userId,
      bool isRead,
      DateTime? createdAt});
}

/// @nodoc
class _$NotificationApiModelCopyWithImpl<$Res,
        $Val extends NotificationApiModel>
    implements $NotificationApiModelCopyWith<$Res> {
  _$NotificationApiModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? body = null,
    Object? type = null,
    Object? userId = null,
    Object? isRead = null,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationApiModelImplCopyWith<$Res>
    implements $NotificationApiModelCopyWith<$Res> {
  factory _$$NotificationApiModelImplCopyWith(_$NotificationApiModelImpl value,
          $Res Function(_$NotificationApiModelImpl) then) =
      __$$NotificationApiModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String body,
      String type,
      int userId,
      bool isRead,
      DateTime? createdAt});
}

/// @nodoc
class __$$NotificationApiModelImplCopyWithImpl<$Res>
    extends _$NotificationApiModelCopyWithImpl<$Res, _$NotificationApiModelImpl>
    implements _$$NotificationApiModelImplCopyWith<$Res> {
  __$$NotificationApiModelImplCopyWithImpl(_$NotificationApiModelImpl _value,
      $Res Function(_$NotificationApiModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? body = null,
    Object? type = null,
    Object? userId = null,
    Object? isRead = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$NotificationApiModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationApiModelImpl implements _NotificationApiModel {
  _$NotificationApiModelImpl(
      {required this.id,
      required this.title,
      required this.body,
      required this.type,
      required this.userId,
      required this.isRead,
      this.createdAt});

  factory _$NotificationApiModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationApiModelImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String body;
  @override
  final String type;
  @override
  final int userId;
  @override
  final bool isRead;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'NotificationApiModel(id: $id, title: $title, body: $body, type: $type, userId: $userId, isRead: $isRead, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationApiModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.isRead, isRead) || other.isRead == isRead) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, body, type, userId, isRead, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationApiModelImplCopyWith<_$NotificationApiModelImpl>
      get copyWith =>
          __$$NotificationApiModelImplCopyWithImpl<_$NotificationApiModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationApiModelImplToJson(
      this,
    );
  }
}

abstract class _NotificationApiModel implements NotificationApiModel {
  factory _NotificationApiModel(
      {required final int id,
      required final String title,
      required final String body,
      required final String type,
      required final int userId,
      required final bool isRead,
      final DateTime? createdAt}) = _$NotificationApiModelImpl;

  factory _NotificationApiModel.fromJson(Map<String, dynamic> json) =
      _$NotificationApiModelImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get body;
  @override
  String get type;
  @override
  int get userId;
  @override
  bool get isRead;
  @override
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$NotificationApiModelImplCopyWith<_$NotificationApiModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
