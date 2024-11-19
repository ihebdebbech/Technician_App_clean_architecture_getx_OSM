import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared/domain/authentication/usecase/create_account_usecase.dart';
import 'package:shared/domain/authentication/usecase/login_usecase.dart';
import 'package:shared/domain/userManagement/entity/user_entity.dart';

class createAcountController extends GetxController {
  var isLoading = false.obs;
  final CreateAccountUsecase _CreateAccountUsecase =
      new CreateAccountUsecase(Get.find());
  Future<bool> createAcount(UserEntity user) async {
    isLoading.value = true;
    try {
      final userCreated = await _CreateAccountUsecase.CreateAccount(user);

      isLoading.value = false;
      return true;
    } catch (error) {
      print(error);
      isLoading.value = false;
      return false;
    }
  }
}
