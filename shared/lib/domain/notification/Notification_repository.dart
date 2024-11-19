import 'dart:ffi';

import 'package:shared/data/authentication/model/authentication_api_model.dart';
import 'package:shared/data/notification/model/notification_api_model.dart';
import 'package:shared/data/room_management/model/room_api_model.dart';
import 'package:shared/domain/room/usecase/update_phdown_usecase.dart';
import 'package:shared/domain/room/usecase/update_solution_values_usecase.dart';
import 'package:shared/domain/room/usecase/update_water_cycle_usecase.dart';
import 'package:shared/domain/roomManagement/entity/room_entity.dart';
import 'package:shared/domain/userManagement/entity/user_entity.dart';

abstract class NotificationRepository {
  Future<List<NotificationApiModel>> getNotifications();
   
}
