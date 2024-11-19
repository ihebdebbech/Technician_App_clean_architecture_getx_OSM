import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared/domain/room/usecase/consult_rooms_usecase.dart';
import 'package:shared/domain/room/usecase/update_phdown_usecase.dart';
import 'package:shared/domain/room/usecase/update_solution_values_usecase.dart';
import 'package:shared/domain/room/usecase/update_water_cycle_usecase.dart';
import 'package:shared/domain/roomManagement/entity/room_entity.dart';

class roomController extends GetxController {
  var isLoading = false.obs;
  var rooms = <RoomEntity>[].obs; // Observable list of RoomEntity
  RxDouble _opacityThermometer = 0.0.obs;
  final UpdatePhdownUsecase _updatePhdownUsecase =
      new UpdatePhdownUsecase(Get.find());
  final UpdateSolutionValuesUsecase _updateSolutionValuesUsecase =
      new UpdateSolutionValuesUsecase(Get.find());
  final UpdateWaterCycleUsecase _updateWaterCycleUsecase =
      new UpdateWaterCycleUsecase(Get.find());

  Future<void> updateSolution(RoomEntity room) async {
    try {
      final solutions =
          await _updateSolutionValuesUsecase.UpdateSolutionValues(room);
    } catch (error) {
      print(error);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updatephDown(RoomEntity room) async {
    try {
      final updatedphdown = await _updatePhdownUsecase.UpdatePhdown(room);
    } catch (error) {
      print(error);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> updateWaterCycle(
      RoomEntity room, String intervale, String duration) async {
    try {
      final updatedwatercycle = await _updateWaterCycleUsecase.UpdateWaterCycle( room, intervale, duration);
    } catch (error) {
      print(error);
    } finally {
      isLoading.value = false;
    }
  }
}
