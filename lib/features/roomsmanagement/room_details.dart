// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_const_constructors

import 'package:core/core.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:greeny_solution_technician/features/create_account/create_account_controller.dart';
import 'package:greeny_solution_technician/features/create_account/widgets/create_account_form.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:greeny_solution_technician/features/home/homepageController.dart';
import 'package:greeny_solution_technician/features/home/nav_menu.dart';
import 'package:greeny_solution_technician/features/roomsmanagement/components/Water_level_circle.dart';
import 'package:greeny_solution_technician/features/roomsmanagement/components/thermometerwidget.dart';
import 'package:greeny_solution_technician/features/roomsmanagement/room_controller.dart';
import 'package:greeny_solution_technician/icons/deseasedetectionicon1.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
import 'package:shared/domain/roomManagement/entity/room_entity.dart';
import 'package:shared/shared.dart';
import 'package:get/get.dart';
import 'package:circular_menu/circular_menu.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class RoomDetails extends GetView<roomController> {
  final int roomIndex;
  RoomEntity room;
  final GlobalKey<FabCircularMenuState> fabKey = GlobalKey();

  RoomDetails({required this.roomIndex, required this.room});
  @override
  Widget build(BuildContext context) {
    int _page = 0;
    GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: context.Heightmedia(0.06),
                      left: context.widthmedia(0.025)),
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: AppColors.primary,
                          size: 20,
                        ),
                        Text(
                          "Back",
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: context.Heightmedia(0.046),
                        left: context.widthmedia(0.13)),
                    child: Center(
                      child: Image.asset(
                        width: context.widthmedia(0.37),
                        'assets/Images/greenycolor.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: context.Heightmedia(0.03)),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: context.widthmedia(0.05)),
                  child: Text(
                    room.name,
                    style: GoogleFonts.poppins(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      color: AppColors.primary,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          color: Colors.white,
                          height: 150,
                          child: Center(
                            child: Column(
                              children: [
                                WaterCyclePopup(
                                  room: room,
                                ),
                                SolutionPopup(room: room),
                                PhdownPopup(room: room),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  icon: Icon(
                    Icons.more_vert,
                    color: AppColors.primary,
                    size: 24.0,
                  ),
                  tooltip: 'Show options',
                ),
              ],
            ),
            SizedBox(height: context.Heightmedia(0.02)),
            Container(
              child: Hero(
                tag: "tagcard" + roomIndex.toString(),
                child: SizedBox(
                  height: context.Heightmedia(0.22),
                  child: Card(
                    elevation: 13,
                    color: AppColors.white,
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: AppColors.primary,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    margin: EdgeInsets.only(
                        left: context.widthmedia(0.05),
                        right: context.widthmedia(0.05),
                        bottom: context.Heightmedia(0.03)),
                    child: Column(
                      children: [
                        const SizedBox(height: 25),
                        Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 120,
                                child: _getRadialGauge(
                                  value: room.latestEc,
                                  endvalue: 100,
                                  startAngle: 160,
                                  endAngle: 24,
                                  annotations: <GaugeAnnotation>[
                                    _GaugeAnnotation(
                                        textdisplayed:
                                            "ec  " + room.latestEc.toString(),
                                        color: AppColors.primary,
                                        angle: 90,
                                        positionFactor: 0.5),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                height: 120,
                                child: _getPhGauge(
                                  value: room.latestPh,
                                  endvalue: 14,
                                  startAngle: 160,
                                  endAngle: 24,
                                  annotations: <GaugeAnnotation>[
                                    _GaugeAnnotation(
                                        textdisplayed:
                                            "Ph  " + room.latestPh.toString(),
                                        color: AppColors.primary,
                                        angle: 90,
                                        positionFactor: 0.5),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Card(
              elevation: 13,
              color: AppColors.white,
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: AppColors.primary,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              margin: EdgeInsets.only(
                  left: context.widthmedia(0.05),
                  right: context.widthmedia(0.05),
                  bottom: context.Heightmedia(0.03)),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 100,
                    child: _getRadialGauge(
                      value: room.latestHumidity,
                      endvalue: 50,
                      startAngle: 160,
                      endAngle: 24,
                      annotations: <GaugeAnnotation>[
                        _GaugeAnnotation(
                            textdisplayed:
                                "Humidity  " + room.latestHumidity.toString(),
                            color: AppColors.primary,
                            angle: 90,
                            positionFactor: 0.8),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            Row(children: [
              SizedBox(
                width: context.widthmedia(0.45),
                height: context.Heightmedia(0.20), // 80% of the screen width
                child: Card(
                  elevation: 13,
                  color: AppColors.white,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color: AppColors.primary,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: EdgeInsets.only(
                    left: context.widthmedia(0.05),
                    bottom: context.Heightmedia(0.03),
                  ),
                  child: Row(
                    children: [
                      Transform.translate(
                        offset:
                            Offset(0, -10), // Adjust x and y offsets as needed
                        child: Container(
                          height: 85,
                          width: 51,
                          child: ThermometerWidget(
                            temperature:
                                room.latestAirTemp, // Current temperature value
                            duration:
                                Duration(seconds: 2), // Animation duration
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Text(
                          room.latestAirTemp.toString() + "°C",
                          style: GoogleFonts.poppins(
                            fontSize: 23,
                            fontWeight: FontWeight.w800,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: context.widthmedia(0.04),
              ),
              SizedBox(
                width: context.widthmedia(0.51),
                height: context.Heightmedia(0.20),
                child: Card(
                  elevation: 13,
                  color: AppColors.white,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color: AppColors.primary,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: EdgeInsets.only(
                      left: context.widthmedia(0.05),
                      right: context.widthmedia(0.05),
                      bottom: context.Heightmedia(0.03)),
                  child: Column(
                    children: [
                      const SizedBox(height: 55),
                      Text(
                        room.latestWaterTemp.toString() + "°C",
                        style: GoogleFonts.poppins(
                          fontSize: 23,
                          fontWeight: FontWeight.w800,
                          color: AppColors.primary,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Water Temperature",
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
            Row(children: [
              SizedBox(
                width: context.widthmedia(0.45),
                height: context.Heightmedia(0.20), // 80% of the screen width
                child: Card(
                  elevation: 13,
                  color: AppColors.white,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color: AppColors.primary,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: EdgeInsets.only(
                    left: context.widthmedia(0.05),
                    bottom: context.Heightmedia(0.03),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 25),
                      Row(
                        children: [
                          SizedBox(
                            height: 100,
                            width: 150,
                            child: _getRadialGauge(
                              value: room.latestCo2,
                              endvalue: 2100,
                              startAngle: 160,
                              endAngle: 24,
                              annotations: <GaugeAnnotation>[
                                _GaugeAnnotation(
                                  textdisplayed:
                                      "Co2  " + room.latestCo2.toString(),
                                  color: AppColors.primary,
                                  angle: 90,
                                  positionFactor: 0.8,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: context.widthmedia(0.04),
              ),
              SizedBox(
                width: context.widthmedia(0.51),
                height: context.Heightmedia(0.20),
                child: Card(
                  elevation: 13,
                  color: AppColors.white,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color: AppColors.primary,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin: EdgeInsets.only(
                    left: context.widthmedia(0.05),
                    right: context.widthmedia(0.05),
                    bottom: context.Heightmedia(0.03),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          SizedBox(
                            width: 12,
                          ),
                          Column(children: [
                            SizedBox(
                              height: 90,
                              width: 90,
                              child: WaterLevelCircle(
                                targetValue: room.latestWaterLevel,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              "Tank Water Level",
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: AppColors.primary,
                              ),
                            ),
                          ]),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      drawer: Drawer(
        width: 350,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              child: Text('notification'),
              decoration: BoxDecoration(
                color: AppColors.primary,
              ),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: const Duration(milliseconds: 1000),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

class SolutionPopup extends GetView<roomController> {
  final RoomEntity room;
  SolutionPopup({super.key, required this.room});
  final _solutionAController = TextEditingController();
  final _solutionBController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pop(context); // Close the current modal
        _showSolutionDialog(context);
        print(_solutionAController.text);
      },
      child: Text("SolA/Sol B"),
    );
  }

  void _showSolutionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Solutions"),
          content: Container(
            height: 100,
            child: Column(
              children: [
                TextField(
                  controller: _solutionAController,
                  decoration: InputDecoration(
                    hintText: "solA",
                  ),
                ),
                TextField(
                  controller: _solutionBController,
                  decoration: InputDecoration(
                    hintText: "solB",
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () async {
                room.quantitySolA = double.parse(_solutionAController.text);
                room.quantitySolB = double.parse(_solutionBController.text);
                await controller.updateSolution(room);
                Navigator.pop(context);
                print(_solutionAController.text);
                // Close the dialog
              },
              child: Text("send"),
            ),
          ],
        );
      },
    );
  }
}

class PhdownPopup extends GetView<roomController> {
  RoomEntity room;
  PhdownPopup({super.key, required this.room});
  final _PhController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pop(context); // Close the current modal
        _showSolutionDialog(context);
      },
      child: Text("PhDown"),
    );
  }

  void _showSolutionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Enter Ph value"),
          content: TextField(
            controller: _PhController,
            decoration: InputDecoration(
              hintText: "Enter value",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () async {
                room.quantityPhDown = double.parse(_PhController.text);
                await controller.updatephDown(room);
                Navigator.pop(context);
                // Close the dialog
              },
              child: Text("send"),
            ),
          ],
        );
      },
    );
  }
}

class WaterCyclePopup extends GetView<roomController> {
  final RoomEntity room;
  WaterCyclePopup({super.key, required this.room});
  final _durationController = TextEditingController();
  final _intervalController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pop(context);
        _showWaterCycleDialog(context);
      },
      child: Text("Set Water Cycle"),
    );
  }

  void _showWaterCycleDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Enter values for the water cycling"),
          content: Container(
            height: 100,
            child: Column(
              children: [
                TextField(
                  controller: _durationController,
                  decoration: InputDecoration(
                    hintText: "Duration",
                  ),
                ),
                TextField(
                  controller: _intervalController,
                  decoration: InputDecoration(
                    hintText: "Interval",
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () async {
                await controller.updateWaterCycle(
                    room, _intervalController.text, _durationController.text);
                Navigator.pop(context); // Close the dialog
              },
              child: Text("Send"),
            ),
          ],
        );
      },
    );
  }
}

Widget _getRadialGauge({
  required double value,
  required double endvalue,
  required double startAngle,
  required double endAngle,
  List<GaugeAnnotation>? annotations,
}) {
  return SfRadialGauge(
    enableLoadingAnimation: true,
    animationDuration: 4000,
    axes: <RadialAxis>[
      RadialAxis(
        minimum: 0,
        maximum: endvalue,
        startAngle: startAngle,
        endAngle: endAngle,
        ranges: <GaugeRange>[
          GaugeRange(
            color: const Color.fromARGB(255, 195, 195, 195),
            startValue: 0,
            endValue: endvalue,
            startWidth: 10,
            endWidth: 10,
          ),
        ],
        pointers: <GaugePointer>[
          RangePointer(
            value: value,
            gradient: const SweepGradient(
              colors: [Color.fromARGB(255, 0, 255, 55), AppColors.primary],
              stops: [0.0, 1.0],
            ),
            width: 0.1,
            sizeUnit: GaugeSizeUnit.factor,
            cornerStyle: CornerStyle.bothCurve,
          ),
        ],
        annotations: annotations,
      ),
    ],
  );
}

Widget _getPhGauge({
  required double value,
  required double endvalue,
  required double startAngle,
  required double endAngle,
  List<GaugeAnnotation>? annotations,
}) {
  return SfRadialGauge(
    enableLoadingAnimation: true,
    animationDuration: 4000,
    axes: <RadialAxis>[
      RadialAxis(
        minimum: 0,
        maximum: 14,
        startAngle: startAngle,
        endAngle: endAngle,
        ranges: <GaugeRange>[
          GaugeRange(
            gradient: const SweepGradient(
              colors: [
                Color.fromARGB(255, 210, 1, 1),
                Color.fromARGB(255, 243, 227, 0),
                Color.fromARGB(255, 18, 175, 0),
                Color.fromARGB(255, 243, 227, 0),
                Color.fromARGB(255, 210, 1, 1)
              ],
              stops: [0.0, 0.3, 0.55, 0.65, 1.0],
            ),
            startValue: 0,
            endValue: endvalue,
            startWidth: 10,
            endWidth: 10,
          ),
        ],
        pointers: <GaugePointer>[
          MarkerPointer(
            value: value,
            color: Color.fromARGB(255, 0, 0, 0),
          )
        ],
        annotations: annotations,
      ),
    ],
  );
}

GaugeAnnotation _GaugeAnnotation({
  required String textdisplayed,
  required Color color,
  required double angle,
  required double positionFactor,
}) {
  return GaugeAnnotation(
    widget: Text(
      textdisplayed,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color),
    ),
    angle: angle,
    positionFactor: positionFactor,
  );
}
