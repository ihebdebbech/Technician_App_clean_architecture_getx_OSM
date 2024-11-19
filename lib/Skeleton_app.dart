// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:greeny_solution_technician/features/Copilot/copiot_screen.dart';
// import 'package:greeny_solution_technician/features/Profile/profile_screen.dart';
// import 'package:greeny_solution_technician/features/deseaseDetection/camera_view.dart';
// import 'package:greeny_solution_technician/features/home/my_home_page.dart';
// import 'package:greeny_solution_technician/icons/deseasedetectionicon1.dart';
// import 'package:shared/ui/theme/app_color.dart';
// // Import your navigation bar widget

// class SkeletonApp extends StatefulWidget {
//   @override
//   _SkeletonAppState createState() => _SkeletonAppState();
// }

// class _SkeletonAppState extends State<SkeletonApp> {
//   int previousindex = 0;
//   int _selectedIndex = 0;
//   GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
//   void _onItemTapped(int index) {
//     if (index == 1) {
//       // Navigate to CameraView using Get.to()
//       index = previousindex;
//       Get.to(() => CameraView());
//     } else if (index == 3) {
//       index = previousindex;
//       Get.to(() => CopiotScreen());
//     } else {
//       setState(() {
//         _selectedIndex = index;
//         previousindex = index;
//       });
//     }
//     // Handle navigation
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _getPage(_selectedIndex), // Update body based on selected index
//       bottomNavigationBar: CurvedNavigationBar(
//         key: _bottomNavigationKey,
//         index: _selectedIndex,
//         items: <Widget>[
//           const Icon(
//             Icons.home_rounded,
//             size: 30,
//             color: AppColors.primary,
//           ),
//           const Icon(
//              Icons.qr_code_2_rounded,
//             size: 30,
//             color: AppColors.primary,
//           ),
//           const Icon(
//             Icons.task_alt_rounded,
//             size: 30,
//             color: AppColors.primary,
//           ),
         
//           const Icon(
//             Icons.perm_identity,
//             size: 30,
//             color: AppColors.primary,
//           ),
//         ],
//         color: Colors.white,
//         buttonBackgroundColor: Colors.white,
//         backgroundColor: AppColors.primary,
//         animationCurve: Curves.easeInOut,
//         animationDuration: const Duration(milliseconds: 600),
//         onTap: (index) {
//           _onItemTapped(index);
//         },
//         letIndexChange: (index) => true,
//       ),
//     );
//   }

//   Widget _getPage(int index) {
//     switch (index) {
//       case 0:
//         return HomePage();
//       case 1:
//         return CameraView();
//       case 2:
//         return Container(color: Colors.red);
//       case 3:
//         return CopiotScreen();
//       case 4:
//         return ProfileScreen(
//           username: 'iheb',
//         );

//       default:
//         return HomePage();
//     }
//   }
// }
