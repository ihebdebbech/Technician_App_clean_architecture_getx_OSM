// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:greeny_solution_technician/Skeleton_app.dart';
// import 'package:greeny_solution_technician/features/create_account/create_account_controller.dart';
// import 'package:greeny_solution_technician/features/home/my_home_page.dart';
// import 'package:greeny_solution_technician/features/login/login_page.dart';
// import 'package:shared/domain/userManagement/entity/user_entity.dart';
// import 'package:shared/shared.dart';
// import 'package:get/get.dart';

// class CreateAccountForm extends StatefulWidget {
//   @override
//   _CreateAccountFormState createState() => _CreateAccountFormState();
// }

// class _CreateAccountFormState extends State<CreateAccountForm> {
//   RxBool screenIndex = true.obs;
//   final _emailController = TextEditingController();
//   final _phoneNumberController = TextEditingController();
//   final _firstnameController = TextEditingController();
//   final _lastnameController = TextEditingController();
//   final _usernameController = TextEditingController();
//   final _birthDateController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _confirmPasswordController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//   createAcountController createAcountControllerC = new createAcountController();
//   Future<void> _selectBirthDate(BuildContext context) async {
//     final DateTime? selectedDate = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(1900),
//       lastDate: DateTime.now(),
//     );

//     if (selectedDate != null && selectedDate != DateTime.now()) {
//       setState(() {
//         _birthDateController.text = "${selectedDate.toLocal()}".split(' ')[0];
//       });
//     }
//   }

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _phoneNumberController.dispose();
//     _firstnameController.dispose();
//     _lastnameController.dispose();
//     _usernameController.dispose();
//     _birthDateController.dispose();
//     _passwordController.dispose();
//     _confirmPasswordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Obx(() => Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               screenIndex.value
//                   ? Column(children: [
//                       Text(
//                         'firstname',
//                         style: GoogleFonts.poppins(
//                           fontSize: 13,
//                           fontWeight: FontWeight.w700,
//                           color: AppColors.primary,
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       TextFormField(
//                         controller: _firstnameController,
//                         decoration: InputDecoration(
//                           filled: false,
//                           fillColor: AppColors.secondary,
//                           labelText: 'firstname',
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(15.0),
//                             borderSide: const BorderSide(
//                               color: Color.fromARGB(255, 91, 235, 175),
//                               width: 1,
//                             ),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(15.0),
//                             borderSide: const BorderSide(
//                               color: AppColors.primary,
//                             ),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(15.0),
//                             borderSide: const BorderSide(
//                               color: AppColors.primary,
//                             ),
//                           ),
//                         ),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter your firstname';
//                           }
//                           return null;
//                         },
//                       ),
//                       const SizedBox(height: 10),
//                       Text(
//                         'lastname',
//                         style: GoogleFonts.poppins(
//                           fontSize: 13,
//                           fontWeight: FontWeight.w700,
//                           color: AppColors.primary,
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       TextFormField(
//                         controller: _lastnameController,
//                         decoration: InputDecoration(
//                           filled: false,
//                           fillColor: AppColors.secondary,
//                           labelText: 'lastname',
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(15.0),
//                             borderSide: const BorderSide(
//                               color: Color.fromARGB(255, 91, 235, 175),
//                               width: 1,
//                             ),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(15.0),
//                             borderSide: const BorderSide(
//                               color: AppColors.primary,
//                             ),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(15.0),
//                             borderSide: const BorderSide(
//                               color: AppColors.primary,
//                             ),
//                           ),
//                         ),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter your lastname';
//                           }
//                           return null;
//                         },
//                       ),
//                       const SizedBox(height: 10),
//                       Text(
//                         'Username',
//                         style: GoogleFonts.poppins(
//                           fontSize: 13,
//                           fontWeight: FontWeight.w700,
//                           color: AppColors.primary,
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       TextFormField(
//                         controller: _usernameController,
//                         decoration: InputDecoration(
//                           filled: false,
//                           fillColor: AppColors.secondary,
//                           labelText: 'Username',
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(15.0),
//                             borderSide: const BorderSide(
//                               color: Color.fromARGB(255, 91, 235, 175),
//                               width: 1,
//                             ),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(15.0),
//                             borderSide: const BorderSide(
//                               color: AppColors.primary,
//                             ),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(15.0),
//                             borderSide: const BorderSide(
//                               color: AppColors.primary,
//                             ),
//                           ),
//                         ),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter your username';
//                           }
//                           return null;
//                         },
//                       ),
//                       const SizedBox(height: 10),
//                       Text(
//                         'BirthDate',
//                         style: GoogleFonts.poppins(
//                           fontSize: 13,
//                           fontWeight: FontWeight.w700,
//                           color: AppColors.primary,
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       GestureDetector(
//                         onTap: () => _selectBirthDate(context),
//                         child: AbsorbPointer(
//                           child: TextFormField(
//                             controller: _birthDateController,
//                             decoration: InputDecoration(
//                               filled: false,
//                               fillColor: AppColors.secondary,
//                               labelText: 'BirthDate',
//                               border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(15.0),
//                                 borderSide: const BorderSide(
//                                   color: Color.fromARGB(255, 91, 235, 175),
//                                   width: 1,
//                                 ),
//                               ),
//                               focusedBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(15.0),
//                                 borderSide: const BorderSide(
//                                   color: AppColors.primary,
//                                 ),
//                               ),
//                               enabledBorder: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(15.0),
//                                 borderSide: const BorderSide(
//                                   color: AppColors.primary,
//                                 ),
//                               ),
//                             ),
//                             validator: (value) {
//                               if (value == null || value.isEmpty) {
//                                 return 'Please enter your birth date';
//                               }
//                               return null;
//                             },
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       Text(
//                         'Phone number',
//                         style: GoogleFonts.poppins(
//                           fontSize: 13,
//                           fontWeight: FontWeight.w700,
//                           color: AppColors.primary,
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       TextFormField(
//                         controller: _phoneNumberController,
//                         decoration: InputDecoration(
//                           filled: false,
//                           fillColor: AppColors.secondary,
//                           labelText: 'Phone number',
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(15.0),
//                             borderSide: const BorderSide(
//                               color: Color.fromARGB(255, 91, 235, 175),
//                               width: 1,
//                             ),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(15.0),
//                             borderSide: const BorderSide(
//                               color: AppColors.primary,
//                             ),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(15.0),
//                             borderSide: const BorderSide(
//                               color: AppColors.primary,
//                             ),
//                           ),
//                         ),
//                         keyboardType: TextInputType.phone,
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter a valid phone number';
//                           } else if (value.length != 8) {
//                             return 'Phone number should be 8 digits';
//                           }
//                           return null;
//                         },
//                       ),
//                       const SizedBox(height: 10),
//                       ElevatedButton(
//                         onPressed: () {
//                           if (_formKey.currentState!.validate()) {
//                             screenIndex.value = !screenIndex.value;
//                           }
//                         },
//                         child: Text(
//                           'Next',
//                           style: GoogleFonts.poppins(
//                             fontSize: 14,
//                             fontWeight: FontWeight.w600,
//                             color: const Color.fromARGB(255, 255, 255, 255),
//                           ),
//                         ),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: AppColors.primary,
//                           minimumSize: const Size(double.infinity, 50),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(15.0),
//                             side: const BorderSide(
//                               color: Colors.white,
//                               width: 2,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ])
//                   : Column(children: [
//                       const SizedBox(height: 10),
//                       Text(
//                         'Email',
//                         style: GoogleFonts.poppins(
//                           fontSize: 13,
//                           fontWeight: FontWeight.w700,
//                           color: AppColors.primary,
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       TextFormField(
//                         controller: _emailController,
//                         decoration: InputDecoration(
//                           filled: false,
//                           fillColor: AppColors.secondary,
//                           labelText: 'Email',
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(15.0),
//                             borderSide: const BorderSide(
//                               color: Color.fromARGB(255, 91, 235, 175),
//                               width: 1,
//                             ),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(15.0),
//                             borderSide: const BorderSide(
//                               color: AppColors.primary,
//                             ),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(15.0),
//                             borderSide: const BorderSide(
//                               color: AppColors.primary,
//                             ),
//                           ),
//                         ),
//                         keyboardType: TextInputType.emailAddress,
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter a unique valid email';
//                           } else if (!RegExp(
//                                   r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
//                               .hasMatch(value)) {
//                             return 'Please enter a valid email address';
//                           }
//                           return null;
//                         },
//                       ),
//                       const SizedBox(height: 10),
//                       Text(
//                         'Password',
//                         style: GoogleFonts.poppins(
//                           fontSize: 13,
//                           fontWeight: FontWeight.w700,
//                           color: AppColors.primary,
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       TextFormField(
//                         controller: _passwordController,
//                         obscureText: true,
//                         decoration: InputDecoration(
//                           filled: false,
//                           fillColor: AppColors.secondary,
//                           labelText: 'Password',
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(15.0),
//                             borderSide: const BorderSide(
//                               color: Color.fromARGB(255, 91, 235, 175),
//                               width: 1,
//                             ),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(15.0),
//                             borderSide: const BorderSide(
//                               color: AppColors.primary,
//                             ),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(15.0),
//                             borderSide: const BorderSide(
//                               color: AppColors.primary,
//                             ),
//                           ),
//                         ),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter your password';
//                           }
//                           return null;
//                         },
//                       ),
//                       const SizedBox(height: 10),
//                       Text(
//                         'Confirm Password',
//                         style: GoogleFonts.poppins(
//                           fontSize: 13,
//                           fontWeight: FontWeight.w700,
//                           color: AppColors.primary,
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       TextFormField(
//                         controller: _confirmPasswordController,
//                         obscureText: true,
//                         decoration: InputDecoration(
//                           filled: false,
//                           fillColor: AppColors.secondary,
//                           labelText: 'Confirm Password',
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(15.0),
//                             borderSide: const BorderSide(
//                               color: Color.fromARGB(255, 91, 235, 175),
//                               width: 1,
//                             ),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(15.0),
//                             borderSide: const BorderSide(
//                               color: AppColors.primary,
//                             ),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(15.0),
//                             borderSide: const BorderSide(
//                               color: AppColors.primary,
//                             ),
//                           ),
//                         ),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please confirm your password';
//                           } else if (value != _passwordController.text) {
//                             return 'Passwords do not match';
//                           }
//                           return null;
//                         },
//                       ),
//                       const SizedBox(height: 10),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           IconButton(
//                               icon: const Icon(Icons.arrow_back,
//                                   color: AppColors.primary, size: 25),
//                               onPressed: () {
//                                 screenIndex.value = !screenIndex.value;
//                               })
//                         ],
//                       ),
//                       const SizedBox(height: 20),
//                       Obx(
//                         () => ElevatedButton(
//                           onPressed: () async {
//                             if (_formKey.currentState!.validate()) {
//                               var userData = UserEntity(
//                                   username: _usernameController.value.text,
//                                   firstname: _firstnameController.value.text,
//                                   lastname: _lastnameController.value.text,
//                                   email: _emailController.value.text,
//                                   phonenumber: int.parse(
//                                       _phoneNumberController.value.text),
//                                   birthdate: _birthDateController.value.text,
//                                   password: _passwordController.value.text);
//                               final status = await createAcountControllerC
//                                   .createAcount(userData);
//                               if (status) {
//                                 Get.snackbar(
//                                   "Success",
//                                   "welcome To Greeny Solution ",
//                                   snackPosition: SnackPosition.BOTTOM,
//                                   colorText:
//                                       const Color.fromARGB(255, 0, 190, 92),
//                                   duration: const Duration(seconds: 3),
//                                 );
//                                 Get.to(SkeletonApp());
//                               } else {
//                                 Get.snackbar(
//                                   "Failed to create an account",
//                                   "please  check your email and password",
//                                   colorText:
//                                       const Color.fromARGB(255, 198, 13, 0),
//                                   snackPosition: SnackPosition.BOTTOM,
//                                   duration: const Duration(seconds: 3),
//                                 );
//                               }
//                             }
//                           },
//                           child: createAcountControllerC.isLoading.value
//                               ? const CircularProgressIndicator(
//                                   color: Colors.white,
//                                 )
//                               : Text(
//                                   'Sign In',
//                                   style: GoogleFonts.poppins(
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w600,
//                                     color: const Color.fromARGB(
//                                         255, 255, 255, 255),
//                                   ),
//                                 ),
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: AppColors.primary,
//                             minimumSize: const Size(double.infinity, 50),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(15.0),
//                               side: const BorderSide(
//                                 color: Colors.white,
//                                 width: 2,
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                           height: MediaQuery.of(context).size.height * 0.05),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             'have an Account?',
//                             style: GoogleFonts.poppins(
//                               fontSize: 13,
//                               fontWeight: FontWeight.w500,
//                               color: AppColors.secondarydark,
//                             ),
//                           ),
//                           TextButton(
//                             onPressed: () {
//                               Get.to(LoginPage());
//                             },
//                             child: Text(
//                               'Sign up',
//                               style: GoogleFonts.poppins(
//                                 fontSize: 12,
//                                 fontWeight: FontWeight.w800,
//                                 color: AppColors.primary,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ]),
//             ],
//           ),
//         ));
//   }
// }
