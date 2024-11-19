import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:greeny_solution_technician/Skeleton_app.dart';
import 'package:greeny_solution_technician/features/create_account/create_account.dart';
import 'package:greeny_solution_technician/features/home/my_home_page.dart';
import 'package:greeny_solution_technician/features/login/login_controler.dart';
import 'package:shared/shared.dart';
import 'package:get/get.dart';

class LoginForm extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  LoginController loginControllerC = new LoginController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email',
          style: GoogleFonts.poppins(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _emailController,
          decoration: InputDecoration(
            filled: false,
            fillColor: AppColors.secondary,
            labelText: 'Email',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 91, 235, 175),
                width: 2,
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
        const SizedBox(height: 20),
        Text(
          'Password',
          style: GoogleFonts.poppins(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _passwordController,
          decoration: InputDecoration(
            filled: false,
            fillColor: AppColors.secondary,
            labelText: 'Password',
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
          obscureText: true,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                'Forgot Password ?',
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                  color: AppColors.primary,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Obx(
          () => ElevatedButton(
            onPressed: () async {
              final status = await loginControllerC.login(
                  _emailController.value.text.toString(),
                  _passwordController.value.text.toString());
              if (status) {
                Get.snackbar(
                  "Success",
                  "welcome Back ",
                  snackPosition: SnackPosition.BOTTOM,
                  colorText: const Color.fromARGB(255, 0, 190, 92),
                  duration: const Duration(seconds: 2),
                );
                Get.to(HomePage());
              } else {
                Get.snackbar(
                  "Login Failed",
                  "please  try again",
                  colorText: const Color.fromARGB(255, 198, 13, 0),
                  snackPosition: SnackPosition.BOTTOM,
                  duration: const Duration(seconds: 3),
                );
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
                side: const BorderSide(
                  color: Colors.white,
                  width: 2,
                ),
              ),
            ),
            child: loginControllerC.isLoading.value
                ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                : Text(
                    'Sign up',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.105),
       
      ],
    );
  }
}
