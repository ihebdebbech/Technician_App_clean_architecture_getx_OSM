import 'package:core/data/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared/data/user_management/model/user_api_model.dart';
import 'package:shared/domain/taskManagement/entity/task.dart';
import 'package:shared/domain/taskManagement/usecase/consult_tasks_usecase.dart';

class HomeController extends GetxController {
  final LocalStorage _localStorage;
  HomeController(this._localStorage);
  var isLoading = false.obs;
  var taskPendingTotal = 0.obs;
  var tasksDisplayed = <TaskEntity>[].obs;
  var allTasks = <TaskEntity>[];
  var recentTasks = <TaskEntity>[];
  var pendingTasks = <TaskEntity>[];
  var completedTasks = <TaskEntity>[];
  var latestTask = TaskEntity(
          id: 0,
          title: "nothing yet",
          taskType: "nothing yet",
          status: "nothing yet",
          createdAt: DateTime.now(),
          technicianId: 0,
          userEmail: "nothing yet",
          user: UserApiModel(
              username: "username",
              firstname: "nobody",
              lastname: "",
              email: "email",
              phonenumber: 57442, premium: false, paymentdate: null))
      .obs;
  var selectedButton = 'recently'.obs;
  final ConsultTasksUsecase _consulttaskUsecase =
      new ConsultTasksUsecase(Get.find());
  @override
  Future<void> onInit() async {
    super.onInit();
    if (allTasks.isEmpty) {
      await fetchtasksfortechnician();
    }
  }

  Future<void> fetchtasksfortechnician() async {
    isLoading.value = true;
    try {
      final fetchedtasks = await _consulttaskUsecase.gettasks();
      allTasks.assignAll(fetchedtasks);
      getRecentTasks();
      calculatePendingTask();
      await findlatestTask();
    } catch (error) {
      print(error);
      allTasks.clear();
      tasksDisplayed.clear();
    } finally {
      // latestTask.value = allTasks[0];

      isLoading.value = false;
    }
  }

  void calculatePendingTask() {
    var sortedtask =
        allTasks.where((task) => task.status == 'pending').toList();
    if (sortedtask.isNotEmpty) {
      print(sortedtask);
      taskPendingTotal.value = sortedtask.length;
    }
  }

  void getPendingTasks() {
    var sortedtask =
        allTasks.where((task) => task.status == 'pending').toList();
    if (sortedtask.isEmpty) {
      tasksDisplayed.value = [
        new TaskEntity(
            id: 0,
            title: "nothing yet",
            taskType: "pending",
            status: "status",
            createdAt: DateTime.now(),
            technicianId: 0,
            userEmail: "nothing",
            user: UserApiModel(
                username: "username",
                firstname: "nobody",
                lastname: "",
                email: "email",
                phonenumber: 57442, premium: false, paymentdate: null))
      ];
    } else {
      tasksDisplayed.value = sortedtask;
    }
  }

  void getcomptedTasks() {
    var sortedtask =
        allTasks.where((task) => task.status == 'completed').toList();
    if (sortedtask.isEmpty) {
      tasksDisplayed.value = [
        new TaskEntity(
            id: 0,
            title: "nothing yet",
            taskType: "completed",
            status: "status",
            createdAt: DateTime.now(),
            technicianId: 0,
            userEmail: "nothing",
            user: UserApiModel(
                username: "username",
                firstname: "nobody",
                lastname: "",
                email: "email",
                phonenumber: 57442, premium: false, paymentdate: null))
      ];
    } else {
      tasksDisplayed.value = sortedtask;
    }
  }

  void getRecentTasks() {
    var sortedTasks = allTasks
      ..sort((a, b) => b.createdAt.compareTo(a.createdAt));

    tasksDisplayed.value = sortedTasks.take(3).toList();
  }

  void selectButton(String value) {
    selectedButton.value = value;
  }

  Future<void> findlatestTask() async {
    try {
      var taskid = await _localStorage.getString("latestTaskId");
      print("taskiddd");
      print(taskid);
      var task = allTasks.firstWhere(
          (task) => task.id == int.parse((taskid as String?) ?? '0'));
      print("taskid2");
      print(task);
      if (!task.isNull) {
        latestTask.value = task;
      }
    } catch (e) {}
  }

  Future<void> updatelatestTask(TaskEntity task) async {
    try {
      var taskid = await _localStorage.setString(
        "latestTaskId",
        task.id.toString(),
      );
      latestTask.value = task;
    } catch (e) {}
  }
}
