import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:greeny_solution_technician/features/CentralAffecting/central_affecting_controller.dart';
import 'package:shared/ui/theme/app_color.dart';

class CentralAffecting extends GetView<CentralAffectingController> {
  final String uuid;

  CentralAffecting({required this.uuid});
  @override
  Widget build(BuildContext context) {
    print(controller.latitude.toString());
    int _page = 0;
    final _emailController = TextEditingController();
    return Container(
      height: context.Heightmedia(0.4),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.0), // Rounded top corners
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: context.Heightmedia(0.02)),
            Text(
              "Affect this central to its new owner",
              style: GoogleFonts.poppins(
                fontSize: context.getResponsiveFontSize(0.3),
                fontWeight: FontWeight.w800,
                color: AppColors.primary,
              ),
            ),
            SizedBox(height: context.Heightmedia(0.02)),
            Container(
              alignment: Alignment.center,
              child: SizedBox(
                  height: context.Heightmedia(0.1),
                  child: Image.asset("assets/Images/uuid.png")),
            ),
            SizedBox(height: context.Heightmedia(0.03)),
            SizedBox(
              width: context.widthmedia(0.7),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Owner Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(
                      color: AppColors.primary,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(
                      color: AppColors.primary,
                    ),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            SizedBox(height: context.Heightmedia(0.02)),
            SizedBox(
              width: context.widthmedia(0.7),
              height: 50,
              child: Obx(
          () => ElevatedButton(
                onPressed: () async {
                  print(_emailController.text);
                  var status = await controller.updateCentralUnit(
                    _emailController.text,
                    uuid,
                  );
                  if (status) {
                    print("ddddddddddddddddddd");
                     Get.back();
                     Get.back();
                    Get.snackbar(
                      "Success",
                      "User Affected",
                      snackPosition: SnackPosition.BOTTOM,
                      colorText: AppColors.primary,
                      duration: const Duration(seconds: 2),
                    );
                   
                  } else {
                    Get.back();
                    Get.snackbar(
                      " Failed",
                      "please  try again",
                      colorText: const Color.fromARGB(255, 198, 13, 0),
                      snackPosition: SnackPosition.BOTTOM,
                      duration: const Duration(seconds: 2),
                    );
                   
                  }
                },
                child: controller.isLoading.value
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : Text(
                        "Affect",
                        style: GoogleFonts.poppins(
                          fontSize: context.getResponsiveFontSize(0.25),
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
          ],
        ),
      ),
    );
    /*
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primary,
        body: Padding(
          padding: EdgeInsets.only(
              left: context.widthmedia(0.03),
              top: context.Heightmedia(0.03),
              right: context.widthmedia(0.03),
              bottom: context.Heightmedia(0.03)),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30), bottom: Radius.circular(30)),
            ),
            height: context.Heightmedia(0.92),
            width: context.widthmedia(0.95),
            child: Column(
              children: [
                SizedBox(height: context.Heightmedia(0.02),),
                Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      color: AppColors.primary,
                      iconSize: context.getResponsiveFontSize(0.4),
                      icon: Icon(Icons.arrow_back_ios_new_outlined),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )),
                SizedBox(
                  height: context.Heightmedia(0.02),
                ),
                Text(
                  "Affect this central to it's new owner ",
                  style: GoogleFonts.poppins(
                    fontSize: context.getResponsiveFontSize(0.4),
                    fontWeight: FontWeight.w800,
                    color: AppColors.primary,
                  ),
                ),
                SizedBox(
                  height: context.Heightmedia(0.05),
                ),
                Container(
                  alignment: Alignment.center,
                  child: SizedBox(
                      height: context.Heightmedia(0.5),
                      child: Image.asset(
                          "assets/Images/uuid.png")), // Display the image once it's ready
                ),
                SizedBox(
                  height: context.Heightmedia(0.045),
                ),

                // Text(
                //   "The scanned central is  : " + uuid,
                //   style: TextStyle(fontSize: 15),
                // ),
                //   SizedBox(
                //   height: context.Heightmedia(0.05),
                // ),
                SizedBox(
                  width: context.widthmedia(0.75),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      filled: false,
                      fillColor: AppColors.secondary,
                      labelText: 'Owner Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(
                          color: Color.fromARGB(255, 91, 235, 175),
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(
                          color: AppColors.primary,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                SizedBox(
                  height: context.Heightmedia(0.035),
                ),
                SizedBox(
                  width: context.widthmedia(0.75),
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      print(_emailController.value.text.toString());
                    },
                    child: Text(
                      "Affect",
                      style: GoogleFonts.poppins(
                        fontSize: context.getResponsiveFontSize(0.25),
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );*/
  }
}
