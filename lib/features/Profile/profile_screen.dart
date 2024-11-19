import 'package:core/data/local_storage.dart';
import 'package:core/utils/media_query_height.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:greeny_solution_technician/features/Profile/profile_controller.dart';
import 'package:greeny_solution_technician/features/login/login_page.dart';
import 'package:shared/ui/theme/app_color.dart';

class ProfileScreen extends GetView<ProfileController> {
  final String username;

  ProfileScreen({required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        toolbarHeight: context.Heightmedia(0.08),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        shadowColor: const Color(0xFF17233D),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                color: Color.fromARGB(40, 0, 0, 0),
                offset: Offset(0, 3),
                spreadRadius: 0,
              )
            ],
          ),
          child:  FlexibleSpaceBar(
            titlePadding: EdgeInsets.only(top: 30),
            title: Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(bottom: 2.0),
                child: Text(
                  'Profile Page'.tr,
                  style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w800,
                      fontSize: 25),
                ),
              ),
            ),
          ),
        ),
        
       
      ),
      body: Obx(
      () {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else  {
          return  RefreshIndicator(
  onRefresh: controller.fetchProfileDetails,
  child: ListView(
    children: [   
                Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SizedBox(
                height: 200,
                width: context.widthmedia(1),
                child: FarmerImageWidget(150, false),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: AppColors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 20,
                      offset: Offset(5, 5),
                    ),
                  ],
                ),
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: CircleAvatar(
                    radius: 50,
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.white,
                    foregroundImage: const AssetImage(
                      "assets/Images/farmer.jpg",
                    ),
                  ),
                ),
              ),
            ],
          ), Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
        child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        
        children: [
          SizedBox(height: context.Heightmedia(0.02)),
          Row( children: [
SizedBox(child: 
          const Icon(
                FontAwesomeIcons.userTie,
                size: 25,
                color: AppColors.primary,
              ),
),
SizedBox(width: context.widthmedia(0.05)),
SizedBox(child: 
        Text(
          controller.user.value.firstname + " " + controller.user.value.lastname,
          style: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: const Color.fromARGB(255, 145, 145, 145),
          ),
        ),
),
          ],),
           
         SizedBox(height: context.Heightmedia(0.007)),
        Divider(),
         SizedBox(height: context.Heightmedia(0.007)),
                Row( children: [
SizedBox(child: 
          const Icon(
                FontAwesomeIcons.phone,
                size: 25,
                color: AppColors.primary,
              ),
),
SizedBox(width: context.widthmedia(0.05)),
SizedBox(child: 
        Text(
          controller.user.value.phonenumber.toString(),
          style: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: const Color.fromARGB(255, 145, 145, 145),
          ),
        ),
),
          ],),
           
         SizedBox(height: context.Heightmedia(0.007)),
        Divider(),
         SizedBox(height: context.Heightmedia(0.007)),
                    Row( children: [
SizedBox(child: 
          const Icon(
                Icons.cake_outlined,
                size: 25,
                color: AppColors.primary,
              ),
),
SizedBox(width: context.widthmedia(0.05)),
SizedBox(child: 
        Text(
          controller.user.value.birthdate.toString(),
          style: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: const Color.fromARGB(255, 145, 145, 145),
          ),
        ),
),
          ],),
            SizedBox(height: context.Heightmedia(0.007)),
        Divider(),
         SizedBox(height: context.Heightmedia(0.007)),
                Row( children: [
SizedBox(child: 
          const Icon(
                Icons.email_outlined,
                size: 25,
                color: AppColors.primary,
              ),
),
SizedBox(width: context.widthmedia(0.05)),
SizedBox(child: 
        Text(
          controller.user.value.email,
          style: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: const Color.fromARGB(255, 145, 145, 145),
          ),
        ),
),
          ],),
            SizedBox(height: context.Heightmedia(0.01)),
        Divider(),
              Row( children: [
SizedBox(child: 
          const Icon(
               Icons.workspace_premium,
                size: 25,
                color: AppColors.primary,
              ),
),
SizedBox(width: context.widthmedia(0.05)),
SizedBox(child: 
        Text( controller.user.value.premium
          ? "Premium Account".tr
                : "Standard Account".tr,
          style: GoogleFonts.poppins(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: const Color.fromARGB(255, 145, 145, 145),
          ),
        ),
),
          ],),
           
         SizedBox(height: context.Heightmedia(0.003)),
        Divider(),
        
           SizedBox(height: context.Heightmedia(0.03)),
          SizedBox(
            width: context.widthmedia(0.92), // Set width as needed (e.g., 80% of the screen width)
            child: ElevatedButton(
              onPressed: () {
               
              
              },
              style: ElevatedButton.styleFrom(
                elevation: 2,
                backgroundColor: AppColors.primary,
                minimumSize: const Size(double.infinity, 40), // Minimum height
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Text('App Language'.tr, style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.white,
              ),),
            ),
          ),
          SizedBox(height: context.Heightmedia(0.01)),
          
          // Wrap the ElevatedButton in a SizedBox to control width
          SizedBox(
            width: context.widthmedia(0.92), // Set width as needed (e.g., 80% of the screen width)
            child: ElevatedButton(
              onPressed: () {
                _logout();
              },
              style: ElevatedButton.styleFrom(
                elevation: 2,
                backgroundColor: AppColors.secondary,
                minimumSize: const Size(double.infinity, 40), // Minimum height
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Text('Log out'.tr, style: GoogleFonts.poppins(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),),
            ),
          ),

         
        ],
      ),
      ),
        ],
      )
    ],
          )
          );
        }
      },
      ),
    );
  }

  void _logout() {
    final LocalStorage _localStorage = Get.find();
    // Your logout logic here, for example:
    _localStorage.clear();
    Get.to(LoginPage());
    // Navigate back to login screen and clear the navigation stack
  }
}

class FarmerImageWidget extends StatefulWidget {
  final double height; // Use this instead of _height
  final bool showIcon;

  const FarmerImageWidget(this.height, this.showIcon, {Key? key})
      : super(key: key);

  @override
  State<FarmerImageWidget> createState() => _FarmerImageWidgetState();
}

class _FarmerImageWidgetState extends State<FarmerImageWidget> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        ClipPath(
          clipper: ShapeClipper([
            Offset(width / 5, widget.height), // Use widget.height here
            Offset(width / 10 * 5, widget.height - 60),
            Offset(width / 5 * 4, widget.height + 20), // Adjust based on height
            Offset(width, widget.height - 18),
          ]),
          child: Container(
            height: widget.height + 20, // Slightly larger to avoid clipping
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                    AppColors.primary,   // Start color
               //Color.fromARGB(255, 10, 78, 50)
               AppColors.secondary 
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 0.0),
                stops: const [0.0, 1.0],
                tileMode: TileMode.clamp,
              ),
            ),
          ),
        ),
        ClipPath(
          clipper: ShapeClipper([
            Offset(width / 3, widget.height + 20), // Use widget.height
            Offset(width / 10 * 8, widget.height - 60),
            Offset(width / 5 * 4, widget.height - 60),
            Offset(width, widget.height - 20),
          ]),
          child: Container(
            height: widget.height + 20, // Match the height
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.primary,   // Start color
               //Color.fromARGB(255, 10, 78, 50)
               AppColors.secondary 
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(1.0, 0.0),
                stops: const [0.0, 1.0],
                tileMode: TileMode.clamp,
              ),
            ),
          ),
        ),
        ClipPath(
          clipper: ShapeClipper([
            Offset(width / 5, widget.height), // Use widget.height
            Offset(width / 2, widget.height - 40),
            Offset(width / 5 * 4, widget.height - 80),
            Offset(width, widget.height - 20),
          ]),
          child: Container(
            height: widget.height + 20, // Match the height
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.primary,   // Start color
               //Color.fromARGB(255, 10, 78, 50)
               Color.fromARGB(255, 12, 87, 56) 
                ],
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(0.95, 0.0),
                stops: [0, 0.9],
                tileMode: TileMode.clamp,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ShapeClipper extends CustomClipper<Path> {
  final List<Offset> offsets;

  ShapeClipper(this.offsets);

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 20);

    // Create the curves using the provided offsets
    path.quadraticBezierTo(
      offsets[0].dx,
      offsets[0].dy,
      offsets[1].dx,
      offsets[1].dy,
    );
    path.quadraticBezierTo(
      offsets[2].dx,
      offsets[2].dy,
      offsets[3].dx,
      offsets[3].dy,
    );

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}