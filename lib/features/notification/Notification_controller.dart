import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:shared/domain/notification/notification_entity.dart';
import 'package:shared/domain/notification/usecase/consult_notifications.dart'; // Assuming you're using Dio for HTTP requests

class NotificationController extends GetxController {
  // Observable list of notifications
  var notifications = <NotificationEntity>[].obs;
  var isLoading = false.obs;
  final ConsultNotifications _consultnotifUsecase =
      new ConsultNotifications(Get.find());
  // Fetch notifications from your API
  Future<void> fetchNotifications() async {
    try {
      isLoading(true);
      final notifs = await _consultnotifUsecase.getNotifications();

        notifications.value = notifs; 
     
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchNotifications(); // Automatically fetch when controller is initialized
  }
}
