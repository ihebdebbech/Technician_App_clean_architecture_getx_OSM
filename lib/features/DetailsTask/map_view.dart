import 'dart:async';
import 'dart:math';

import 'package:core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:shared/domain/taskManagement/entity/task.dart';
import 'package:shared/shared.dart';

class mapView extends StatefulWidget {
  TaskEntity task;
  mapView({super.key, required this.task});

  @override
  State<mapView> createState() => _MainExampleState();
}

class _MainExampleState extends State<mapView>
    with OSMMixinObserver, TickerProviderStateMixin {
  late MapController controller;
  late GlobalKey<ScaffoldState> scaffoldKey;
  Key mapGlobalkey = UniqueKey();
  ValueNotifier<bool> zoomNotifierActivation = ValueNotifier(false);
  ValueNotifier<bool> visibilityZoomNotifierActivation = ValueNotifier(false);
  ValueNotifier<bool> visibilityOSMLayers = ValueNotifier(false);
  ValueNotifier<double> positionOSMLayers = ValueNotifier(-200);
  ValueNotifier<GeoPoint?> centerMap = ValueNotifier(null);
  ValueNotifier<bool> trackingNotifier = ValueNotifier(false);
  ValueNotifier<bool> showFab = ValueNotifier(true);
  ValueNotifier<GeoPoint?> lastGeoPoint = ValueNotifier(null);
  ValueNotifier<bool> beginDrawRoad = ValueNotifier(false);
  GeoPoint destination = GeoPoint(latitude: 36.8351214, longitude: 10.2405336);
  List<GeoPoint> pointsRoad = [];
  Timer? timer;
  int x = 0;
  late AnimationController animationController;
  late Animation<double> animation =
      Tween<double>(begin: 0, end: 2 * pi).animate(animationController);
  final ValueNotifier<int> mapRotate = ValueNotifier(0);
  @override
  void initState() {
    super.initState();
    destination = GeoPoint(
        latitude: widget.task.latitude!, longitude: widget.task.longitude!);
    controller = MapController.withPosition(
      initPosition: GeoPoint(
        latitude: 47.4358055,
        longitude: 8.4737324,
      ),
    );

    controller.addObserver(this);
    scaffoldKey = GlobalKey<ScaffoldState>();
    controller.listenerMapLongTapping.addListener(() async {
      if (controller.listenerMapLongTapping.value != null) {
        await controller.moveTo(controller.listenerMapLongTapping.value!);
      }
    });

    controller.listenerMapSingleTapping.addListener(() async {
      if (controller.listenerMapSingleTapping.value != null) {
        debugPrint(controller.listenerMapSingleTapping.value.toString());
        if (beginDrawRoad.value) {
          pointsRoad.add(controller.listenerMapSingleTapping.value!);

          await controller.addMarker(
            controller.listenerMapSingleTapping.value!,
            markerIcon: const MarkerIcon(
              icon: Icon(
                Icons.person_pin_circle,
                color: Color.fromARGB(255, 178, 81, 95),
                size: 48,
              ),
            ),
          );
          if (pointsRoad.length >= 2 && showFab.value && mounted) {
            roadActionBt(context);
          }
        }
      }
    });
    controller.listenerRegionIsChanging.addListener(() async {
      if (controller.listenerRegionIsChanging.value != null) {
        centerMap.value = controller.listenerRegionIsChanging.value!.center;
      }
    });
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 500,
      ),
    );
  }

  Future<void> mapIsInitialized() async {
    await controller.setZoom(zoomLevel: 12);
    await controller.currentLocation();
    /*await controller.setMarkerOfStaticPoint(
      id: "line 2",
      markerIcon: const MarkerIcon(
        icon: Icon(
          Icons.train,
          color: Color.fromARGB(255, 255, 0, 187),
          size: 100,
        ),
      ),
    );*/
    await controller.addMarker(
      destination,
      markerIcon: const MarkerIcon(
        icon: Icon(
          Icons.location_on_sharp,
          color: Color.fromARGB(255, 245, 0, 0),
          size: 48,
        ),
      ),
    );
    /* await controller.setStaticPosition(
      [
        GeoPointWithOrientation.radian(
          latitude: 47.4433594,
          longitude: 8.4680184,
          radianAngle: pi / 4,
        ),
        GeoPointWithOrientation.radian(
          latitude: 47.4517782,
          longitude: 8.4716146,
          radianAngle: pi / 2,
        ),
      ],
      "line 2",
    );*/
  }

  @override
  Future<void> mapIsReady(bool isReady) async {
    if (isReady) {
      await mapIsInitialized();
    }
  }

  @override
  void onRoadTap(RoadInfo road) {
    super.onRoadTap(road);
    debugPrint("road:$road");
    Future.microtask(() => controller.removeRoad(roadKey: road.key));
  }

  @override
  void dispose() {
    if (timer != null && timer!.isActive) {
      timer?.cancel();
    }
    animationController.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      /*appBar: AppBar(
        title: const Text('OSM'),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          Builder(builder: (ctx) {
            return GestureDetector(
              onDoubleTap: () async {
                await controller.clearAllRoads();
              },
              child: IconButton(
                onPressed: () {
                  // beginDrawRoad.value = true;
                  roadActionBt(context);
                },
                icon: const Icon(Icons.route),
              ),
            );
          }),
          IconButton(
            onPressed: () async {
              await controller.toggleLayersVisibility();
            },
            icon: const Icon(Icons.location_on),
          ),
        ],
      ),*/
      body: Stack(
        children: [
          OSMFlutter(
            controller: controller,
            osmOption: OSMOption(
              enableRotationByGesture: true,
              zoomOption: const ZoomOption(
                initZoom: 8,
                minZoomLevel: 3,
                maxZoomLevel: 19,
                stepZoom: 1.0,
              ),
              userLocationMarker: UserLocationMaker(
                  personMarker: MarkerIcon(
                    iconWidget: SizedBox(
                      width: 32,
                      height: 64,
                      child: Image.asset(
                        "assets/Images/directionIcon.png",
                        scale: .3,
                      ),
                    ),
                  ),
                  directionArrowMarker: MarkerIcon(
                    iconWidget: SizedBox(
                      width: 32,
                      height: 64,
                      child: Image.asset(
                        "assets/Images/directionIcon.png",
                        scale: .3,
                      ),
                    ),
                  )),
              staticPoints: [
                StaticPositionGeoPoint(
                  "line 1",
                  const MarkerIcon(
                    icon: Icon(
                      Icons.train,
                      color: Colors.green,
                      size: 32,
                    ),
                  ),
                  [
                    GeoPoint(
                      latitude: 47.4333594,
                      longitude: 8.4680184,
                    ),
                    GeoPoint(
                      latitude: 47.4317782,
                      longitude: 8.4716146,
                    ),
                  ],
                ),
              ],
              roadConfiguration: const RoadOption(
                roadColor: Colors.blueAccent,
              ),
              showContributorBadgeForOSM: true,
              showDefaultInfoWindow: false,
            ),
            mapIsLoading: const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  Text("Map is Loading.."),
                ],
              ),
            ),
            onMapIsReady: (isReady) {
              if (isReady) {
                debugPrint("map is ready");
              }
            },
            onLocationChanged: (myLocation) {
              debugPrint('user location :$myLocation');
            },
            onGeoPointClicked: (geoPoint) async {
              if (geoPoint ==
                  GeoPoint(
                    latitude: 47.442475,
                    longitude: 8.4680389,
                  )) {
                final newGeoPoint = GeoPoint(
                  latitude: 47.4517782,
                  longitude: 8.4716146,
                );
                await controller.changeLocationMarker(
                  oldLocation: geoPoint,
                  newLocation: newGeoPoint,
                  markerIcon: const MarkerIcon(
                    icon: Icon(
                      Icons.bus_alert,
                      color: Colors.blue,
                      size: 24,
                    ),
                  ),
                );
              }
              if (!context.mounted) return;
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    geoPoint.toMap().toString(),
                  ),
                  action: SnackBarAction(
                    onPressed: () =>
                        ScaffoldMessenger.of(context).hideCurrentSnackBar(),
                    label: "hide",
                  ),
                ),
              );
            },
          ),
          Positioned(
            bottom: context.widthmedia(0.02),
            left: 12,
            child: ValueListenableBuilder<bool>(
              valueListenable: zoomNotifierActivation,
              builder: (ctx, isVisible, child) {
                return AnimatedOpacity(
                  opacity: true ? 1.0 : 0.0,
                  onEnd: () {
                    visibilityZoomNotifierActivation.value = isVisible;
                  },
                  duration: const Duration(milliseconds: 500),
                  child: child,
                );
              },
              child: Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            10), // No rounded corners for a rectangle
                      ),
                      // Optional: Adjust padding for button size
                    ),
                    child: const Icon(Icons.add),
                    onPressed: () async {
                      controller.zoomIn();
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            10), // No rounded corners for a rectangle
                      ),
                      // Optional: Adjust padding for button size
                    ),
                    child: const Icon(Icons.remove),
                    onPressed: () async {
                      controller.zoomOut();
                    },
                  ),
                ],
              ),
            ),
          ),
          if (!kIsWeb) ...[
            Positioned(
              bottom: context.Heightmedia(0.2),
              right: 12,
              child: FloatingActionButton(
                backgroundColor: AppColors.white,
                key: UniqueKey(),
                heroTag: "roaddirec",
                onPressed: () async {
                  roadActionBt(context);
                },
                child: AnimatedBuilder(
                  animation: animation,
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: animation.value,
                      child: child!,
                    );
                  },
                  child: const Icon(
                    Icons.directions,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: context.Heightmedia(0.15),
              right: 12,
              child: FloatingActionButton(
                backgroundColor: AppColors.white,
                key: UniqueKey(),
                heroTag: "rotateCamera",
                onPressed: () async {
                  animationController.forward().then((value) {
                    animationController.reset();
                  });
                  mapRotate.value = 0;
                  await controller.rotateMapCamera(mapRotate.value.toDouble());
                },
                child: AnimatedBuilder(
                  animation: animation,
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: animation.value,
                      child: child!,
                    );
                  },
                  child: const Icon(
                    Icons.screen_rotation_alt_outlined,
                  ),
                ),
              ),
            ),
         
       Positioned(
            bottom: context.Heightmedia(0.10), // Distance from the bottom of the screen
            right: 12, // Distance from the right of the screen
            child:  ValueListenableBuilder<bool>(
        valueListenable: showFab,
        builder: (ctx, isShow, child) {
          if (!isShow) {
            return const SizedBox.shrink();
          }
          return child!;
        },
        child: PointerInterceptor(
          child: FloatingActionButton(
            backgroundColor: AppColors.white,
            key: UniqueKey(),
            heroTag: "locationUser",
            onPressed: () async {
              animationController.forward().then((value) {
                animationController.reset();
              });
              mapRotate.value = 0;

              if (!trackingNotifier.value) {
                await controller.currentLocation();
                await controller.enableTracking(
                  enableStopFollow: true,
                  disableUserMarkerRotation: false,
                  anchor: Anchor.left,
                );
                //await controller.zoom(5.0);
              } else {
                //  await controller.disabledTracking();
              }
              // trackingNotifier.value = !trackingNotifier.value;
            },
            child: AnimatedBuilder(
                animation: animation,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: animation.value,
                    child: child!,
                  );
                },
                child: const Icon(
                  Icons.my_location,
                  color: AppColors.primary,
                )),
          ),
        ),
      ),
       ),
        ],
        ],
      ),
    );
  }

  void roadActionBt(BuildContext ctx) async {
    final mylocation = await controller.myLocation();
    await controller.currentLocation();
    try {
      // showFab.value = false;
      ValueNotifier<RoadType> notifierRoadType = ValueNotifier(RoadType.car);

      // showFab.value = true;
      // beginDrawRoad.value = false;

      RoadInfo roadInformation = await controller.drawRoad(
        mylocation,
        destination,
        roadType: notifierRoadType.value,
        //  intersectPoint: pointsRoad.getRange(1, pointsRoad.length - 1).toList(),
        roadOption: const RoadOption(
          roadWidth: 15,
          roadColor: Color.fromARGB(255, 10, 108, 219),
          zoomInto: true,
          roadBorderWidth: 10,
          roadBorderColor: Color.fromARGB(255, 10, 108, 219),
          // isDotted: true,
        ),
      );
      // pointsRoad.clear();

      debugPrint(
          "app duration:${Duration(seconds: roadInformation.duration!.toInt()).inMinutes}");
      debugPrint("app distance:${roadInformation.distance}Km");

      scaffoldKey.currentState!.showBottomSheet(
        (ctx) {
          return RoadInfoWidget(
            distance: roadInformation.distance!.toStringAsFixed(2),
            duration:
                Duration(seconds: roadInformation.duration!.toInt()).inMinutes,
          );
        },
        backgroundColor: Colors.transparent,
      );

      final console = roadInformation.instructions
          .map((e) => e.toString())
          .reduce(
            (value, element) => "$value -> \n $element",
          )
          .toString();
      debugPrint(
        console,
        wrapWidth: console.length,
      );
    } on RoadException catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "${e.errorMessage()}",
          ),
        ),
      );
    }
  }

  @override
  Future<void> mapRestored() async {
    super.mapRestored();
    debugPrint("log map restored");
  }
}

class RoadInfoWidget extends StatelessWidget {
  final duration;
  final distance;

  const RoadInfoWidget(
      {super.key, required this.duration, required this.distance});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: PopScope(
            canPop: false,
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    height: context.Heightmedia(0.15),
                    width: context.widthmedia(1),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: 50, // Width of the line
                          height: 5, // Height of the line (thickness)
                          margin: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.grey[400], // Line color
                            borderRadius: BorderRadius.all(
                                Radius.circular(10)), // Rounded edges
                          ),
                        ),
                        SizedBox(
                          height: context.Heightmedia(0.005),
                        ),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: context.widthmedia(0.05),
                              ),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "ROAD INFO ",
                                      style: GoogleFonts.poppins(
                                          color: Colors.black,
                                          fontSize: context
                                              .getResponsiveFontSize(0.32),
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            duration.toString() + "  min   ",
                                            style: GoogleFonts.poppins(
                                                color: AppColors.secondarydark,
                                                fontSize: context
                                                    .getResponsiveFontSize(
                                                        0.32),
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            "(" +
                                                distance.toString() +
                                                "km" +
                                                ")",
                                            style: GoogleFonts.poppins(
                                                color: const Color.fromARGB(
                                                    255, 220, 218, 218),
                                                fontSize: context
                                                    .getResponsiveFontSize(
                                                        0.32),
                                                fontWeight: FontWeight.w500),
                                          )
                                        ]),
                                    Text(
                                      "Best Route now based to traffic conditions",
                                      style: GoogleFonts.poppins(
                                          color: AppColors.secondarydark,
                                          fontSize: context
                                              .getResponsiveFontSize(0.2),
                                          fontWeight: FontWeight.w400),
                                    )
                                  ]),
                              SizedBox(
                                width: context.widthmedia(0.05),
                              ),
                              Icon(
                                Icons.drive_eta_rounded,
                                color: AppColors.primary,
                                size: context.Heightmedia(0.1),
                              ),
                            ]),
                      ],
                    )))));
  }
}
