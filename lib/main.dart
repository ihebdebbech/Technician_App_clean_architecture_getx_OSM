import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greeny_solution_technician/features/DetailsTask/map_view.dart';
import 'package:greeny_solution_technician/firebase_options.dart';
import 'package:greeny_solution_technician/firebasemessagingservice.dart';
import 'package:greeny_solution_technician/local_notification_service.dart';
import 'package:greeny_solution_technician/spash_creen.dart';

import 'package:greeny_solution_technician/theme/default_theme.dart';
import 'package:greeny_solution_technician/di.dart';
import 'package:permission_handler/permission_handler.dart';

late List<CameraDescription> _cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  
  // this is where the notification service was initialized
  await LocalNotificationService.initialize();
  _cameras = await availableCameras();
  await requestPermissions();

  runApp(const MyApp());
}

Future<void> requestPermissions() async {
  if (!kIsWeb) {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }

    var cameraStatus = await Permission.camera.status;
    var location = await Permission.location.status;
    if (!cameraStatus.isGranted) {
      await Permission.camera.request();
    }
     if (!location.isGranted) {
      await Permission.location.request();
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<void> initFM() async {
    final firebaseMessagingService = FirebaseMessagingService();
    await firebaseMessagingService.grantAppPermission();
    await FirebaseMessagingService.init(); // Call the static method directly
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initFM(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator()); // Loading indicator
        }
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Greeny Solutions',
          theme: DefaultTheme.themeData,
          home: SplashScreen(),
          initialBinding: DI(),
        );
      },
    );
  }
}
