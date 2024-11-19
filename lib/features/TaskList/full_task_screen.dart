import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared/domain/taskManagement/entity/task.dart'; // Adjust the import as necessary
import 'package:greeny_solution_technician/features/DetailsTask/details_task_screen.dart'; // Adjust import as necessary
import 'package:shared/ui/theme/app_color.dart';

class TaskListScreen extends StatelessWidget {
  final List<TaskEntity> tasks; // List of TaskEntities

  TaskListScreen({required this.tasks});

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
                  'All Tasks',
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
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              itemCount: tasks.length,
              shrinkWrap: true,
              physics:
                  NeverScrollableScrollPhysics(), // Prevents scrolling conflict
              itemBuilder: (context, index) {
                return TaskCard(task: tasks[index], context: context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class TaskCard extends StatelessWidget {
  final TaskEntity task;
  final BuildContext context;

  TaskCard({required this.task, required this.context});
  var illustrationpath = "assets/Images/Delivery-address.svg";

  @override
  Widget build(BuildContext context) {
    if (task.taskType == "troubleshooting") {
      illustrationpath = "assets/Images/troubleshooting.svg";
    } else if (task.taskType == "calibration") {
      illustrationpath = "assets/Images/calibration.svg";
    }
    return Padding(
          padding: EdgeInsets.only(
            left: context.widthmedia(0.05),  
          ),
          child: SizedBox(
      height: context.Heightmedia(0.25),
      width: context.widthmedia(0.99),
      child:  GestureDetector(
          onTap: () {
            Get.to(DetailsTaskScreen(), arguments: task);
          },
          child: SizedBox(
            height: context.Heightmedia(0.27),
            width: context.widthmedia(0.75),
            child: Card(
              elevation: 5,
              color: AppColors.white,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              task.title,
                              style: TextStyle(
                                color: AppColors.primary,
                                fontWeight: FontWeight.w800,
                                fontSize: context.getResponsiveFontSize(0.4),
                              ),
                            ),
                            Text(
                              task.taskType,
                              style: TextStyle(
                                color: AppColors.secondarydark,
                                fontWeight: FontWeight.w800,
                                fontSize: context.getResponsiveFontSize(0.32),
                              ),
                            ),
                            Text(
                              "For ${task.user!.firstname} ${task.user!.lastname}",
                              style: TextStyle(
                                color: AppColors.secondarydark,
                                fontWeight: FontWeight.w700,
                                fontSize: context.getResponsiveFontSize(0.25),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Get.to(DetailsTaskScreen(), arguments: task);
                              },
                              child: Text("Read more"),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            // Replace with your illustration asset
                            SvgPicture.asset(
                              illustrationpath,
                              height:
                                  context.Heightmedia(0.1), // Adjust the height
                            ),
                            Text(
                              "${task.createdAt.day}/${task.createdAt.month}/${task.createdAt.year}",
                              style: TextStyle(
                                color: AppColors.secondary,
                                fontWeight: FontWeight.w500,
                                fontSize: context.getResponsiveFontSize(0.22),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Divider(
                      color: AppColors.primary,
                      thickness: 3,
                      endIndent: 20,
                    ),
                  ],
                ),
              ),
            ),
            ),
          ),
        
      ),
    );
  }
}
