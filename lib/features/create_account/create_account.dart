// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:greeny_solution_technician/features/create_account/create_account_controller.dart';
// import 'package:greeny_solution_technician/features/create_account/widgets/create_account_form.dart';

// import 'package:shared/shared.dart';
// import 'package:get/get.dart';

// class CreateAccountPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.primary,
//       resizeToAvoidBottomInset: true,
//       body: Stack(
//         children: [
//           Positioned(
//             top: 58,
//             left: MediaQuery.of(context).size.width / 2 - 80,
//             child: Image.asset(
//               'assets/Images/greenywhite.png',
//               width: 150,
//             ),
//           ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Container(
//               width: double.infinity,
//               height: MediaQuery.of(context).size.height * 0.822,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.vertical(top: Radius.circular(60)),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.1),
//                     spreadRadius: 5,
//                     blurRadius: 10,
//                     offset: Offset(0, -3),
//                   ),
//                 ],
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(20.0),
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       SizedBox(height: 20),
//                       Text(
//                         'Get Started',
//                         style: GoogleFonts.poppins(
//                           fontSize: 32,
//                           fontWeight: FontWeight.w800,
//                           color: AppColors.primary,
//                         ),
//                       ),
//                       SizedBox(height: 15),
//                       CreateAccountForm(),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
