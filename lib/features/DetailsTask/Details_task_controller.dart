import 'package:get/get.dart';
import 'package:greeny_solution_technician/features/DetailsTask/map_view.dart';
import 'package:shared/domain/taskManagement/entity/task.dart';
import 'package:shared/domain/taskManagement/usecase/update_central_owner_usecase.dart';

class DetailsTaskController extends GetxController {
  final UpdateCentralOwnerUsecase _updateCentralOwnerUsecase =
      new UpdateCentralOwnerUsecase(Get.find());
        var isLoading = false.obs;
  Future<bool> terminateTask(int taskId, String report) async {
    try {
        isLoading.value = true;
      var status =
          await _updateCentralOwnerUsecase.completeTask(taskId, report);
          isLoading.value = false;
      return true;
    } catch (e) {
      isLoading.value = false;
      return false;
    }
  }
}
