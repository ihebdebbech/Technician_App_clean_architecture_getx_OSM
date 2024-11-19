// ignore_for_file: prefer_const_constructors

import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:greeny_solution_technician/features/login/login_controler.dart';
import 'package:greeny_solution_technician/features/login/widgets/login_form.dart';
import 'package:shared/shared.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: AppColors.primary,
        resizeToAvoidBottomInset:
            true, // Ensure the layout adjusts when the keyboard appears
        body:Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.topEnd,
            colors: [
              AppColors.primary,   // Start color
               //Color.fromARGB(255, 10, 78, 50)
               Color.fromARGB(255, 12, 87, 56) // End color
            ],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 70,
              left: MediaQuery.of(context).size.width / 2 - 80,
              child: Image.asset(
                'assets/Images/greenywhite.png',
                width: 150,
              ),
            ),
         /*   CustomPaint(
            size: Size(context.widthmedia(0.3), context.Heightmedia(0.2)), // Set the canvas size
            painter: CurvyTrianglePainter(),
          ),*/
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.8,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(60)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: Offset(0, -3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 30),
                        Text(
                          'Welcome Back',
                          style: GoogleFonts.poppins(
                            fontSize: 32,
                            fontWeight: FontWeight.w800,
                            color: AppColors.primary,
                          ),
                        ),
                        SizedBox(height: 20),
                        LoginForm(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }
}
class CurvyTrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    // Define a Path for the triangle
    final path = Path();

    // Starting point (Bottom Right Corner)
    path.moveTo(size.width , size.height);

    // Draw the right side of the triangle with a curve at the corner
    path.quadraticBezierTo(size.width - 0, size.height -50 , 50, size.height - 50);

    // Draw the top side of the triangle with a curve at the corner
    path.quadraticBezierTo(size.width - 200, size.height - 250, 50, size.height - 50);

    // Draw the left side of the triangle with a curve at the corner
    path.quadraticBezierTo(20, size.height - 10, size.width - 50, size.height - 50);

    // Close the path (automatically draws the last line from the last point to the first point)
    path.close();

    // Draw the triangle with curves
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CurvyTrianglePainter oldDelegate) {
    return false;
  }
}
