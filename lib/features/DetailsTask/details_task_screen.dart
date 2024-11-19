import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:greeny_solution_technician/features/CentralAffecting/Central_affecting.dart';
import 'package:greeny_solution_technician/features/DetailsTask/Details_task_controller.dart';
import 'package:greeny_solution_technician/features/DetailsTask/map_view.dart';
import 'package:shared/domain/taskManagement/entity/task.dart';
import 'package:shared/ui/theme/app_color.dart';

class DetailsTaskScreen extends StatefulWidget {
  @override
  _DetailsTaskScreenState createState() => _DetailsTaskScreenState();
}

class _DetailsTaskScreenState extends State<DetailsTaskScreen> {
  final TextEditingController reportController = TextEditingController();
  final DetailsTaskController controller = DetailsTaskController();
  late TaskEntity task;

  @override
  void initState() {
    super.initState();
 task = Get.arguments; 
    WidgetsBinding.instance.addPostFrameCallback((_) {
   
if (task != null) {
  showTaskDetails(context, task, reportController, controller);
}
    });
  }

  @override
  Widget build(BuildContext context) {
  

    return Scaffold(
      body: Stack(
        children: [
          mapView(task: task),
          Positioned(
            bottom: context.Heightmedia(
                0.25), // Distance from the bottom of the screen
            right: 12, // Distance from the right of the screen
            child: FloatingActionButton(
              backgroundColor: AppColors.white,
              key: UniqueKey(),
              heroTag: "locationUser",
              onPressed: () async {
                showTaskDetails(context, task, reportController, controller);
              },
              child: const Icon(
                Icons.subject,
                color: AppColors.primary,
              ),
            ),
          ),
          Positioned(
            top: context.Heightmedia(
                0.04), // Distance from the bottom of the screen
            left: 12, // Distance from the right of the screen
            child: FloatingActionButton(
              backgroundColor: AppColors.white,
              onPressed: () async {
                Get.back();
              },
              child: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void showTaskDetails(BuildContext context, TaskEntity task,
    TextEditingController reportController, DetailsTaskController controller) {
  showModalBottomSheet(
    context: context,
    isScrollControlled:
        true, // Allows the bottom sheet to be full-screen if necessary
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (BuildContext context) {
      return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,  
          ),
          child:SingleChildScrollView( // Wrap this in SingleChildScrollView
            child:Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize
              .min, // Makes sure the bottom sheet doesn't take up unnecessary space
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Task Title
            Text(
              'Title: ${task.title}',
              style: GoogleFonts.poppins(
                fontSize: context.getResponsiveFontSize(0.25),
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 10),

            // Task Description
            Text(
              'Description: ${task.description}',
              style: GoogleFonts.poppins(
                fontSize: context.getResponsiveFontSize(0.18),
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
            ),
            const SizedBox(height: 10),

            // Task Status
            Text(
              'Status: ${task.status}',
              style: GoogleFonts.poppins(
                fontSize: context.getResponsiveFontSize(0.18),
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
            ),
            const SizedBox(height: 10),

            // Username
            Text(
              'Client: ${task.user!.firstname + task.user!.lastname}',
              style: GoogleFonts.poppins(
                fontSize: context.getResponsiveFontSize(0.18),
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
            ),
            const SizedBox(height: 10),

            // User Phone Number
            Text(
              'Client Phone Number: ${task.user!.phonenumber}',
              style: GoogleFonts.poppins(
                fontSize: context.getResponsiveFontSize(0.18),
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
            ),
            const SizedBox(height: 20),

            // Conditional rendering based on task status
            if (task.status != "completed") ...[
              // TextField to enter the report
              TextField(
                controller: reportController,
                decoration: const InputDecoration(
                  labelText: 'Report',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: context.widthmedia(0.9),
                height: 40,
                child:Obx(
          () => ElevatedButton(
                  onPressed: () async {
                   var status =  await controller.terminateTask(task.id, reportController.text);
                      if (status) {
                         Get.back();
                Get.snackbar(
                  "Success",
                  "Task completed successfully",
                  snackPosition: SnackPosition.BOTTOM,
                  colorText:  AppColors.primary,
                  duration: const Duration(seconds: 2),
                );
                
              } else {
                 Get.back();
                Get.snackbar(
                  "Failed",
                  "please  try again",
                  colorText: const Color.fromARGB(255, 198, 13, 0),
                  snackPosition: SnackPosition.BOTTOM,
                  duration: const Duration(seconds: 3),
                );
              }
                   
                  },
                  child: controller.isLoading.value
                ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                :  Text(
                    "Submit",
                    style: GoogleFonts.poppins(
                      fontSize: context.getResponsiveFontSize(0.22),
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                ),
              ),
              SizedBox(
                height: 20,
              )
            ] else ...[
              // Show the report if the task is completed
              Text("Report: ${task.report ?? ''}"),
            ],
          ],
        ),
            )
          ),
      );
    },
  );
}
