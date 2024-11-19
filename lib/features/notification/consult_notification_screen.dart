import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greeny_solution_technician/features/notification/Notification_controller.dart';
import 'package:shared/ui/theme/app_color.dart';
// Import the NotificationController

class NotificationWidget extends GetView<NotificationController> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 239, 239, 239),
      appBar: AppBar(
        toolbarHeight: context.Heightmedia(0.08),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        shadowColor: const Color(0xFF17233D),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                color: Color.fromARGB(40, 0, 0, 0),
                offset: Offset(0, 3),
                spreadRadius: 0,
              )
            ],
          ),
          child: const FlexibleSpaceBar(
            titlePadding: EdgeInsets.only(top: 30),
            title: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(bottom: 2.0),
                child: Text(
                  'Notifications',
                  style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w800,
                      fontSize: 25),
                ),
              ),
            ),
          ),
        ),
        leading: Padding(
          padding: EdgeInsets.only(
              top: context.Heightmedia(0.02), left: context.widthmedia(0.015)),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 30,
            ),
            color: AppColors.primary,
            onPressed: () {
              Get.back();
            },
          ),
        ),
        
      ),
      body:  Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (controller.notifications.isEmpty) {
  return RefreshIndicator(
    onRefresh: controller.fetchNotifications,
    child: ListView(
      physics: const AlwaysScrollableScrollPhysics(), // Ensures the list is scrollable even when empty
      children: [
        const SizedBox(height: 15),
        Center(
          child: Text('No notifications available'),
        ),
      ],
    ),
  );
}

        return RefreshIndicator(
              onRefresh: controller.fetchNotifications,
              child: ListView.builder(
          itemCount: controller.notifications.length,
          itemBuilder: (context, index) {
            var notification = controller.notifications[index];
            return Card(
              color: AppColors.white,
              child: ListTile(
                leading: Icon(Icons.notifications),
                title: Text(notification.title ?? 'No Title'),
                subtitle: Text(notification.body ?? 'No Description'),
                trailing: Text(notification.createdAt.toString() ?? DateTime.now().toString()),
              ),
            );
          },
              ),
        );
      
      }),
    );
  }
}
