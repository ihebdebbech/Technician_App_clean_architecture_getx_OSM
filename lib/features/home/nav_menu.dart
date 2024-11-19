// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:greeny_solution_technician/features/create_account/create_account_controller.dart';
import 'package:greeny_solution_technician/features/create_account/widgets/create_account_form.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greeny_solution_technician/icons/deseasedetectionicon1.dart'; // Adjust the import path
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:shared/shared.dart';
import 'package:get/get.dart';
import 'package:circular_menu/circular_menu.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavMenu extends StatelessWidget {
  final GlobalKey<FabCircularMenuState> fabKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return FabCircularMenu(
      key: fabKey,
      alignment: Alignment.bottomRight,
      ringColor: Colors.white.withAlpha(25),
      ringDiameter: 300.0,
      ringWidth: 100.0,
      fabSize: 64.0,
      fabElevation: 8.0,
      fabIconBorder: CircleBorder(),
      fabColor: Colors.white,
      fabOpenIcon: Icon(Icons.menu, color: AppColors.primary),
      fabCloseIcon: Icon(Icons.close, color: AppColors.primary),
      fabMargin: const EdgeInsets.all(25.0),
      animationDuration: const Duration(milliseconds: 800),
      animationCurve: Curves.easeInOutCirc,
      onDisplayChange: (isOpen) {
        //       _showSnackBar(context, "The menu is ${isOpen ? "open" : "closed"}");
      },
      children: <Widget>[
        Material(
          shape: CircleBorder(),
          elevation: 6.0,
          color: Colors.white,
          child: RawMaterialButton(
            onPressed: () {
              //      _showSnackBar(context, "You pressed 1");
            },
            shape: CircleBorder(),
            padding: const EdgeInsets.all(14.0),
            child: Icon(MyFlutterApp.deseaseicon2,
                color: AppColors.primary, size: 30),
          ),
        ),
        Material(
          shape: CircleBorder(),
          elevation: 6.0,
          color: Colors.white,
          child: RawMaterialButton(
              onPressed: () {
                //   _showSnackBar(context, "You pressed 3. This one closes the menu on tap");
                // fabKey.currentState?.close();
              },
              shape: CircleBorder(),
              padding: const EdgeInsets.all(14.0),
              child: Icon(
                Icons.add,
                color: AppColors.primary,
                size: 34,
              )),
        ),
        Material(
          shape: CircleBorder(),
          elevation: 6.0,
          color: Colors.white,
          child: RawMaterialButton(
            onPressed: () {
              //   _showSnackBar(context, "You pressed 2");
            },
            shape: CircleBorder(),
            padding: const EdgeInsets.all(14.0),
            child: SvgPicture.asset(
              'assets/Images/chatboticon1.svg',
              color: AppColors.primary,
              width: 25,
              height: 25,
            ),
          ),
        ),
      ],
    );
  }
}
