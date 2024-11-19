import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:shared/data/user_management/model/user_api_model.dart';
import 'package:shared/domain/taskManagement/entity/task.dart';
import 'package:shared/domain/taskManagement/usecase/consult_tasks_usecase.dart';
import 'package:shared/domain/taskManagement/usecase/update_central_owner_usecase.dart';

class CentralAffectingController extends GetxController {
  var latitude = 0.0;
  var longitude = 0.0;
  var isLoading = false.obs;
  final UpdateCentralOwnerUsecase _updateCentralOwnerUsecase =
      new UpdateCentralOwnerUsecase(Get.find());
  @override
  Future<void> onInit() async {
    super.onInit();
    await _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    // Request location permission
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied.');
    }

    // Get the current position
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    latitude = position.latitude;
    longitude = position.longitude;
    print("Latitude: ${position.latitude}, Longitude: ${position.longitude}");
  }

  Future<bool> updateCentralUnit(String email, String uuid) async {
    try {
        isLoading.value = true;
      final status = await _updateCentralOwnerUsecase.updateCentralOwner(
          email, uuid, latitude, longitude);
            isLoading.value = false;
      print(status);
      return status;
    } catch (error) {
      print(error);
      return false;
    } finally {}
  }
}
