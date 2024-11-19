import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greeny_solution_technician/Skeleton_app.dart';
import 'package:greeny_solution_technician/features/home/my_home_page.dart';
import 'package:greeny_solution_technician/features/login/login_page.dart';
import 'package:shared/domain/authentication/authentication_repository.dart';
import 'package:shared/ui/theme/app_color.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  Future<bool> _checkSessionStatus() async {
    final repo = Get.find<AuthenticationRepository>();
    final sessionStatus = await repo.getToken();
    return sessionStatus;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _checkSessionStatus(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return AnimatedSplashScreen(
            duration: 5000,
            splash: Column(
              children: [
                SizedBox(height: context.Heightmedia(0.05)),
                Center(
                  child: Image.asset('assets/Images/greenycolor.png',
                      width: MediaQuery.of(context).size.width * 0.3,
                      fit: BoxFit.contain),
                ),
              ],
            ),
            splashIconSize: 150,
            splashTransition: SplashTransition.fadeTransition,
            pageTransitionType: PageTransitionType.leftToRight,
            backgroundColor: AppColors.white,
            nextScreen: CircularProgressIndicator(), 
          );
        } else if (snapshot.hasError) {
         
          return Center(child: Text("An error occurred"));
        } else {
      
          return snapshot.data == true ? HomePage() : LoginPage();
        }
      },
    );
  }
}
