// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_api_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

taskApiModel _$taskApiModelFromJson(Map<String, dynamic> json) {
  return _taskApiModel.fromJson(json);
}

/// @nodoc
mixin _$taskApiModel {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get report => throw _privateConstructorUsedError;
  String get taskType => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  DateTime? get dueDate => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;
  int get technicianId => throw _privateConstructorUsedError;
  String get userEmail => throw _privateConstructorUsedError;
  UserApiModel? get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $taskApiModelCopyWith<taskApiModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $taskApiModelCopyWith<$Res> {
  factory $taskApiModelCopyWith(
          taskApiModel value, $Res Function(taskApiModel) then) =
      _$taskApiModelCopyWithImpl<$Res, taskApiModel>;
  @useResult
  $Res call(
      {int id,
      String title,
      String? description,
      String? report,
      String taskType,
      String status,
      double? longitude,
      double? latitude,
      DateTime? dueDate,
      DateTime createdAt,
      DateTime? completedAt,
      int technicianId,
      String userEmail,
      UserApiModel? user});

  $UserApiModelCopyWith<$Res>? get user;
}

/// @nodoc
class _$taskApiModelCopyWithImpl<$Res, $Val extends taskApiModel>
    implements $taskApiModelCopyWith<$Res> {
  _$taskApiModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? report = freezed,
    Object? taskType = null,
    Object? status = null,
    Object? longitude = freezed,
    Object? latitude = freezed,
    Object? dueDate = freezed,
    Object? createdAt = null,
    Object? completedAt = freezed,
    Object? technicianId = null,
    Object? userEmail = null,
    Object? user = freezed,
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
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      report: freezed == report
          ? _value.report
          : report // ignore: cast_nullable_to_non_nullable
              as String?,
      taskType: null == taskType
          ? _value.taskType
          : taskType // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      dueDate: freezed == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      technicianId: null == technicianId
          ? _value.technicianId
          : technicianId // ignore: cast_nullable_to_non_nullable
              as int,
      userEmail: null == userEmail
          ? _value.userEmail
          : userEmail // ignore: cast_nullable_to_non_nullable
              as String,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserApiModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserApiModelCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserApiModelCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$taskApiModelImplCopyWith<$Res>
    implements $taskApiModelCopyWith<$Res> {
  factory _$$taskApiModelImplCopyWith(
          _$taskApiModelImpl value, $Res Function(_$taskApiModelImpl) then) =
      __$$taskApiModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String? description,
      String? report,
      String taskType,
      String status,
      double? longitude,
      double? latitude,
      DateTime? dueDate,
      DateTime createdAt,
      DateTime? completedAt,
      int technicianId,
      String userEmail,
      UserApiModel? user});

  @override
  $UserApiModelCopyWith<$Res>? get user;
}

/// @nodoc
class __$$taskApiModelImplCopyWithImpl<$Res>
    extends _$taskApiModelCopyWithImpl<$Res, _$taskApiModelImpl>
    implements _$$taskApiModelImplCopyWith<$Res> {
  __$$taskApiModelImplCopyWithImpl(
      _$taskApiModelImpl _value, $Res Function(_$taskApiModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? report = freezed,
    Object? taskType = null,
    Object? status = null,
    Object? longitude = freezed,
    Object? latitude = freezed,
    Object? dueDate = freezed,
    Object? createdAt = null,
    Object? completedAt = freezed,
    Object? technicianId = null,
    Object? userEmail = null,
    Object? user = freezed,
  }) {
    return _then(_$taskApiModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      report: freezed == report
          ? _value.report
          : report // ignore: cast_nullable_to_non_nullable
              as String?,
      taskType: null == taskType
          ? _value.taskType
          : taskType // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      dueDate: freezed == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      technicianId: null == technicianId
          ? _value.technicianId
          : technicianId // ignore: cast_nullable_to_non_nullable
              as int,
      userEmail: null == userEmail
          ? _value.userEmail
          : userEmail // ignore: cast_nullable_to_non_nullable
              as String,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserApiModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$taskApiModelImpl implements _taskApiModel {
  _$taskApiModelImpl(
      {required this.id,
      required this.title,
      this.description,
      this.report,
      required this.taskType,
      required this.status,
      this.longitude,
      this.latitude,
      this.dueDate,
      required this.createdAt,
      this.completedAt,
      required this.technicianId,
      required this.userEmail,
      this.user});

  factory _$taskApiModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$taskApiModelImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String? description;
  @override
  final String? report;
  @override
  final String taskType;
  @override
  final String status;
  @override
  final double? longitude;
  @override
  final double? latitude;
  @override
  final DateTime? dueDate;
  @override
  final DateTime createdAt;
  @override
  final DateTime? completedAt;
  @override
  final int technicianId;
  @override
  final String userEmail;
  @override
  final UserApiModel? user;

  @override
  String toString() {
    return 'taskApiModel(id: $id, title: $title, description: $description, report: $report, taskType: $taskType, status: $status, longitude: $longitude, latitude: $latitude, dueDate: $dueDate, createdAt: $createdAt, completedAt: $completedAt, technicianId: $technicianId, userEmail: $userEmail, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$taskApiModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.report, report) || other.report == report) &&
            (identical(other.taskType, taskType) ||
                other.taskType == taskType) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.technicianId, technicianId) ||
                other.technicianId == technicianId) &&
            (identical(other.userEmail, userEmail) ||
                other.userEmail == userEmail) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      description,
      report,
      taskType,
      status,
      longitude,
      latitude,
      dueDate,
      createdAt,
      completedAt,
      technicianId,
      userEmail,
      user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$taskApiModelImplCopyWith<_$taskApiModelImpl> get copyWith =>
      __$$taskApiModelImplCopyWithImpl<_$taskApiModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$taskApiModelImplToJson(
      this,
    );
  }
}

abstract class _taskApiModel implements taskApiModel {
  factory _taskApiModel(
      {required final int id,
      required final String title,
      final String? description,
      final String? report,
      required final String taskType,
      required final String status,
      final double? longitude,
      final double? latitude,
      final DateTime? dueDate,
      required final DateTime createdAt,
      final DateTime? completedAt,
      required final int technicianId,
      required final String userEmail,
      final UserApiModel? user}) = _$taskApiModelImpl;

  factory _taskApiModel.fromJson(Map<String, dynamic> json) =
      _$taskApiModelImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String? get description;
  @override
  String? get report;
  @override
  String get taskType;
  @override
  String get status;
  @override
  double? get longitude;
  @override
  double? get latitude;
  @override
  DateTime? get dueDate;
  @override
  DateTime get createdAt;
  @override
  DateTime? get completedAt;
  @override
  int get technicianId;
  @override
  String get userEmail;
  @override
  UserApiModel? get user;
  @override
  @JsonKey(ignore: true)
  _$$taskApiModelImplCopyWith<_$taskApiModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
