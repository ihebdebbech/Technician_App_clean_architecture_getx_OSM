import 'package:core/app_config.dart';
import 'package:core/data/local_storage.dart';
import 'package:core/data/network_client.dart';
import 'package:get/get.dart';
import 'package:greeny_solution_technician/features/CentralAffecting/central_affecting_controller.dart';
import 'package:greeny_solution_technician/features/DetailsTask/Details_task_controller.dart';
import 'package:greeny_solution_technician/features/Profile/profile_controller.dart';
import 'package:greeny_solution_technician/features/home/homepageController.dart';
import 'package:greeny_solution_technician/features/notification/Notification_controller.dart';
import 'package:greeny_solution_technician/features/roomsmanagement/room_controller.dart';
import 'package:shared/data/authentication/authentication_data_repository.dart';

import 'package:shared/data/authentication/authentication_service.dart';
import 'package:shared/data/notification/notification_data_repository.dart';
import 'package:shared/data/notification/notification_data_service.dart';
import 'package:shared/data/room_management/room_management_data_repository.dart';
import 'package:shared/data/room_management/room_management_service.dart';
import 'package:shared/data/taskmanagement/task_management_data_repository.dart';
import 'package:shared/data/taskmanagement/task_management_service.dart';
import 'package:shared/data/user_management/user_managament_service.dart';
import 'package:shared/data/user_management/user_management_data_repository.dart';
import 'package:shared/domain/authentication/authentication_repository.dart';
import 'package:shared/domain/notification/Notification_repository.dart';
import 'package:shared/domain/room/room_repository.dart';
import 'package:shared/domain/room/usecase/consult_rooms_usecase.dart';
import 'package:shared/domain/taskManagement/task_repository.dart';
import 'package:shared/domain/userManagement/usecase/consult_user_details.dart';
import 'package:shared/domain/userManagement/user_repository.dart';

class DI extends Bindings {
  @override
  void dependencies() {
    Get.put<AppConfig>(ProdConfiguration());
    Get.put<LocalStorage>(LocalStorage(Get.find()));
    Get.put<NetworkClient>(NetworkClient(Get.find(), Get.find()));
    Get.lazyPut<AuthenticationService>(
        () => AuthenticationService(Get.find(), Get.find()));
    Get.put<AuthenticationRepository>(AuthenticationDataRepository(Get.find()));
    Get.lazyPut<RoomManagementService>(
        () => RoomManagementService(Get.find(), Get.find()));
        Get.lazyPut<taskManagementService>(
        () => taskManagementService(Get.find(), Get.find()));
    Get.put<RoomRepository>(RoomManagementDataRepository(Get.find()));
    Get.put<TaskRepository>(taskManagementDataRepository(Get.find()));
    Get.lazyPut<HomeController>(() => HomeController(Get.find()));
    Get.put<CentralAffectingController>(CentralAffectingController());
    Get.lazyPut<consultRoomUsecase>(() => consultRoomUsecase(Get.find()));
    Get.lazyPut<roomController>(() => roomController());
     Get.lazyPut<DetailsTaskController>(() => DetailsTaskController());
     Get.lazyPut<NotificationDataService>(
        () => NotificationDataService(Get.find(), Get.find()));
    Get.put<NotificationRepository>(NotificationDataRepository(Get.find()));
       Get.put<NotificationController>(NotificationController());
       Get.lazyPut<UserManagamentService>(
        () => UserManagamentService(Get.find(), Get.find()),
        fenix: true);
    Get.lazyPut<UserRepository>(() => UserManagementDataRepository(Get.find()),
        fenix: true);

    Get.lazyPut<ConsultUserDetails>(() => ConsultUserDetails(Get.find()),
        fenix: true);
    Get.lazyPut<ProfileController>(() => ProfileController(), fenix: true);
 
  }
}
