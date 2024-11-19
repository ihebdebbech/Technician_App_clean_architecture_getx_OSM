import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared/domain/room/usecase/consult_rooms_usecase.dart';
import 'package:shared/domain/roomManagement/entity/room_entity.dart';
import 'package:shared/domain/userManagement/entity/user_entity.dart';
import 'package:shared/domain/userManagement/usecase/consult_user_details.dart';

class ProfileController extends GetxController {
  var isLoading = false.obs;
  var user = UserEntity(
          username: '',
          firstname: '',
          lastname: '',
          email: '',
          phonenumber: 0,
          premium: false)
      .obs; // Observable list of RoomEntity

  final ConsultUserDetails _consultUserDetails =
      new ConsultUserDetails(Get.find());
  @override
  Future<void> onInit() async {
    super.onInit();
    await fetchProfileDetails();
  }

  Future<void> fetchProfileDetails() async {
    isLoading.value = true;
    try {
      final userdata = await _consultUserDetails.getUserDetails();
      user.value = userdata;
      // Update the observable list
    } catch (error) {
      print(error);
    } finally {
      isLoading.value = false;
    }
  }
}
