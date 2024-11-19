// ignore_for_file: prefer_interpolation_to_compose_strings

import 'package:core/core.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:greeny_solution_technician/features/CentralAffecting/Qr_code_scanning.dart';
import 'package:greeny_solution_technician/features/DetailsTask/details_task_screen.dart';
import 'package:greeny_solution_technician/features/Profile/profile_screen.dart';
import 'package:greeny_solution_technician/features/TaskList/full_task_screen.dart';
import 'package:greeny_solution_technician/features/create_account/create_account_controller.dart';
import 'package:greeny_solution_technician/features/create_account/widgets/create_account_form.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greeny_solution_technician/features/home/homepageController.dart';
import 'package:greeny_solution_technician/features/home/nav_menu.dart';
import 'package:greeny_solution_technician/features/notification/consult_notification_screen.dart';
import 'package:greeny_solution_technician/features/roomsmanagement/room_details.dart';
import 'package:greeny_solution_technician/icons/deseasedetectionicon1.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:shared/shared.dart';
import 'package:get/get.dart';
import 'package:circular_menu/circular_menu.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class HomePage extends GetView<HomeController> {
  final GlobalKey<FabCircularMenuState> fabKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    int _page = 0;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
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
                  'Welcome Back !',
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
              Icons.perm_identity,
              size: 30,
            ),
            color: AppColors.secondarydark,
            onPressed: () {
              Get.to(ProfileScreen(username: "iheb"));
            },
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(
                top: context.Heightmedia(0.02),
                right: context.widthmedia(0.015)),
            child: Builder(
              builder: (context) => IconButton(
                icon: const Icon(
                  Icons.notifications,
                  size: 30,
                  color: AppColors.secondarydark,
                ),
  onPressed: () => Get.to(NotificationWidget()),              ),
            ),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else if (controller.tasksDisplayed.isEmpty) {
           return RefreshIndicator(
    onRefresh: controller.fetchtasksfortechnician,
    child: ListView(
      physics: const AlwaysScrollableScrollPhysics(), // Ensures the list is scrollable even when empty
      children: [
        const SizedBox(height: 15),
        Center(
          child: Text('No task available'),
        ),
      ],
    ),
  );
        } else {
          var lastillustrationpath = "assets/Images/Delivery-address.svg";
          if (controller.latestTask.value.taskType == "troubleshooting") {
            lastillustrationpath = "assets/Images/troubleshooting.svg";
          } else if (controller.latestTask.value.taskType == "calibration") {
            lastillustrationpath = "assets/Images/calibration.svg";
          }
          return RefreshIndicator(
              onRefresh: controller.fetchtasksfortechnician,
              child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.only(left: context.widthmedia(0.05)),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 30),
                          SizedBox(
                            width: context.widthmedia(0.5),
                            child: Text(
                              "You've got " +
                                  controller.taskPendingTotal.value.toString() +
                                  " tasks Pending",
                              style: GoogleFonts.poppins(
                                fontSize: context.getResponsiveFontSize(0.4),
                                fontWeight: FontWeight.w700,
                                color: const Color.fromARGB(255, 0, 0, 0),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: context.Heightmedia(0.25),
                            width: context.widthmedia(0.99),
                            child: Hero(
                              tag: "lasttask",
                              child: GestureDetector(
                                onTap: () {
                                  // Add your onTap functionality
                                },
                                child: SizedBox(
                                  height: context.Heightmedia(0.27),
                                  width: context.widthmedia(0.75),
                                  child: Card(
                                    elevation: 5,
                                    color: AppColors.primary,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    margin: EdgeInsets.only(
                                      top: context.Heightmedia(0.02),
                                      right: context.widthmedia(0.05),
                                      bottom: context.Heightmedia(0.03),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 20),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    controller
                                                        .latestTask.value.title,
                                                    style: TextStyle(
                                                      color: AppColors.white,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      fontSize: context
                                                          .getResponsiveFontSize(
                                                              0.4),
                                                    ),
                                                  ),
                                                  Text(
                                                    controller.latestTask.value
                                                        .taskType,
                                                    style: TextStyle(
                                                      color:
                                                          AppColors.secondary,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      fontSize: context
                                                          .getResponsiveFontSize(
                                                              0.32),
                                                    ),
                                                  ),
                                                  Text(
                                                    "For " +
                                                        controller
                                                            .latestTask
                                                            .value
                                                            .user!
                                                            .firstname +
                                                        " " +
                                                        controller
                                                            .latestTask
                                                            .value
                                                            .user!
                                                            .lastname,
                                                    style: TextStyle(
                                                      color:
                                                          AppColors.secondary,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontSize: context
                                                          .getResponsiveFontSize(
                                                              0.25),
                                                    ),
                                                  ),
                                                  ElevatedButton(
                                                      onPressed: () {
                                                        Get.to(
                                                            DetailsTaskScreen(),
                                                            arguments:
                                                                controller
                                                                    .latestTask
                                                                    .value);
                                                      },
                                                      child: Text("Read more"))
                                                ],
                                              ),
                                              Column(
                                                children: [
                                                  SvgPicture.asset(
                                                    lastillustrationpath,
                                                    height: context.Heightmedia(
                                                        0.1),
                                                  ),
                                                  Text(
                                                    controller.latestTask.value
                                                            .createdAt.day
                                                            .toString() +
                                                        '/' +
                                                        controller
                                                            .latestTask
                                                            .value
                                                            .createdAt
                                                            .month
                                                            .toString() +
                                                        '/' +
                                                        controller
                                                            .latestTask
                                                            .value
                                                            .createdAt
                                                            .year
                                                            .toString(),
                                                    style: TextStyle(
                                                      color:
                                                          AppColors.secondary,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: context
                                                          .getResponsiveFontSize(
                                                              0.22),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Divider(
                                            color: AppColors.white,
                                            thickness: 3,
                                            // optional: adds spacing before the line
                                            endIndent:
                                                20, // optional: adds spacing after the line
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "My Tasks",
                            style: GoogleFonts.poppins(
                              fontSize: context.getResponsiveFontSize(0.335),
                              fontWeight: FontWeight.w700,
                              color: const Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Column(children: [
                            TaskButtons(),
                            SizedBox(
                              height: context.Heightmedia(0.02),
                            ),
                            SizedBox(
                              height: context.Heightmedia(0.30),
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.tasksDisplayed.length +
                                    1, // Adding +1 for extra card
                                itemBuilder: (context, index) {
                                  // Check if it's the last card (outside ListView.builder)
                                  if (index ==
                                      controller.tasksDisplayed.length) {
                                    return GestureDetector(
                                      onTap: () {
                                        // Add your onTap functionality
                                      },
                                      child: SizedBox(
                                        height: context.Heightmedia(0.27),
                                        width: context.widthmedia(0.35),
                                        child: GestureDetector(
                                          onTap: () {
                                            Get.to(TaskListScreen(
                                              tasks: controller.allTasks,
                                            ));
                                          },
                                          onLongPress: () {
                                            // Handle long press
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                  content: Text(
                                                      'Card long pressed!')),
                                            );
                                          },
                                          child: Card(
                                            elevation: 5,
                                            color: AppColors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            margin: EdgeInsets.only(
                                              top: context.Heightmedia(0.02),
                                              right: context.widthmedia(0.05),
                                              bottom: context.Heightmedia(0.03),
                                            ),
                                            child: Center(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "See All",
                                                    style: TextStyle(
                                                      color: AppColors.primary,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      fontSize: context
                                                          .getResponsiveFontSize(
                                                              0.45),
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons
                                                        .navigate_next_outlined,
                                                    size: context
                                                        .getResponsiveFontSize(
                                                            0.45),
                                                    color: AppColors.primary,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }

                                  var task = controller.tasksDisplayed[index];
                                  var illustrationpath =
                                      "assets/Images/Delivery-address.svg";
                                  if (task.taskType == "troubleshooting") {
                                    illustrationpath =
                                        "assets/Images/troubleshooting.svg";
                                  } else if (task.taskType == "calibration") {
                                    illustrationpath =
                                        "assets/Images/calibration.svg";
                                  }
                                  return Hero(
                                    tag: "tagcard" + index.toString(),
                                    child: GestureDetector(
                                      onTap: () {
                                        // Add your onTap functionality
                                      },
                                      child: SizedBox(
                                        height: context.Heightmedia(0.27),
                                        width: context.widthmedia(0.75),
                                        child: Card(
                                          elevation: 5,
                                          color: AppColors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          margin: EdgeInsets.only(
                                            top: context.Heightmedia(0.02),
                                            right: context.widthmedia(0.05),
                                            bottom: context.Heightmedia(0.03),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.only(left: 20),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceAround,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          task.title,
                                                          style: TextStyle(
                                                            color: AppColors
                                                                .primary,
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            fontSize: context
                                                                .getResponsiveFontSize(
                                                                    0.4),
                                                          ),
                                                        ),
                                                        Text(
                                                          task.taskType,
                                                          style: TextStyle(
                                                            color: AppColors
                                                                .secondarydark,
                                                            fontWeight:
                                                                FontWeight.w800,
                                                            fontSize: context
                                                                .getResponsiveFontSize(
                                                                    0.32),
                                                          ),
                                                        ),
                                                        Text(
                                                          "For " +
                                                              task.user!
                                                                  .firstname +
                                                              " " +
                                                              task.user!
                                                                  .lastname,
                                                          style: TextStyle(
                                                            color: AppColors
                                                                .secondarydark,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            fontSize: context
                                                                .getResponsiveFontSize(
                                                                    0.25),
                                                          ),
                                                        ),
                                                        ElevatedButton(
                                                            onPressed:
                                                                () async {
                                                              if (task.title !=
                                                                  "nothing yet") {
                                                                await controller
                                                                    .updatelatestTask(
                                                                        task);
                                                                Get.to(
                                                                    DetailsTaskScreen(),
                                                                    arguments:
                                                                        task);
                                                              }
                                                            },
                                                            child: Text(
                                                                "Read more"))
                                                      ],
                                                    ),
                                                    Column(
                                                      children: [
                                                        SvgPicture.asset(
                                                          illustrationpath,
                                                          height: context
                                                              .Heightmedia(
                                                                  0.05),
                                                        ),
                                                        Text(
                                                          task.createdAt.day
                                                                  .toString() +
                                                              '/' +
                                                              task.createdAt
                                                                  .month
                                                                  .toString() +
                                                              '/' +
                                                              task.createdAt
                                                                  .year
                                                                  .toString(),
                                                          style: TextStyle(
                                                            color: AppColors
                                                                .secondarydark,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: context
                                                                .getResponsiveFontSize(
                                                                    0.22),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height:
                                                      context.Heightmedia(0.01),
                                                ),
                                                Divider(
                                                  color: AppColors.primary,
                                                  thickness: 3,
                                                  // optional: adds spacing before the line
                                                  endIndent:
                                                      20, // optional: adds spacing after the line
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ])
                        ]),
                  )));
        }
      }),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: context.Heightmedia(0.02)),
        child: SizedBox(
          width: context.getResponsiveFontSize(1.2), // Custom width
          height: context.getResponsiveFontSize(1.2), // Custom height
          child: FloatingActionButton(
            mini: false,
            backgroundColor: AppColors.primary,

            onPressed: () {
              // Action to perform when button is pressed
              Get.to(QrCodeScanner());
              print("Floating button pressed");
            },
            child: Icon(
              Icons.qr_code_2_sharp,
              color: AppColors.white,
              size: context.getResponsiveFontSize(0.8),
            ), // Icon for the button
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      drawer: Drawer(
        width: 350,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              child: Text('notification'),
              decoration: BoxDecoration(
                color: AppColors.primary,
              ),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class TaskButtons extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildButton(context, 'recently', 'Recently'),
        const SizedBox(width: 10),
        _buildButton(context, 'pending', 'Pending'),
        const SizedBox(width: 10),
        _buildButton(context, 'completed', 'Completed'),
      ],
    );
  }

  Widget _buildButton(BuildContext context, String value, String text) {
    return Obx(() {
      bool isSelected = controller.selectedButton.value == value;

      return ElevatedButton(
        onPressed: () {
          controller.selectButton(value);

          if (value == 'recently') {
            controller.getRecentTasks();
          } else if (value == 'pending') {
            controller.getPendingTasks();
          } else if (value == 'completed') {
            controller.getcomptedTasks();
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: isSelected
              ? AppColors.primary
              : AppColors.secondary, // Set the color
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        child: Container(
          height: context.Heightmedia(0.03),
          width: context.widthmedia(0.23),
          child: Center(
            child: Text(
              text,
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: isSelected ? AppColors.white : AppColors.secondarydark,
              ),
            ),
          ),
        ),
      );
    });
  }
}
