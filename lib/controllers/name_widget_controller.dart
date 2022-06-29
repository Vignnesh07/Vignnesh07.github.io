import 'package:flutter/widgets.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';
import 'package:vignnesh07/model/project_model.dart';

class NameWidgetController extends GetxController {
  static NameWidgetController instance = Get.find();

  RxDouble nameWidgetOffset = 0.0.obs;
  late ScrollController scrollController;
  List<ProjectModel> projectList = [
    ProjectModel(no: 01, name: 'TBSB', role: 'Full Stack Developer', description: 'Provides production insight and real-time inventory tracking', stacks: ['Flutter', 'Firebase'], appType: 'Android App', picUrl: ['assets/images/TBSB/1.png', 'assets/images/TBSB/2.png', 'assets/images/TBSB/3.png', 'assets/images/TBSB/4.png']),
    ProjectModel(no: 02, name: 'PK Retails', role: 'Full Stack Developer', description: 'Provides production insight and real-time inventory tracking', stacks: ['Flutter', 'Firebase'], appType: 'Cross Platform App', picUrl: ['assets/images/PK Retails - 13 Pro/1.png', 'assets/images/PK Retails - 13 Pro/2.png', 'assets/images/PK Retails - 13 Pro/3.png', 'assets/images/PK Retails - 13 Pro/4.png']),
    ProjectModel(no: 03, name: 'The Quadry', role: 'Full Stack Developer', description: 'Provides production insight and real-time inventory tracking', stacks: ['Flutter', 'Firebase', 'Stripe'], appType: 'Cross Platform App', picUrl: ['assets/images/Quadry/1.png', 'assets/images/Quadry/2.png', 'assets/images/Quadry/3.png', 'assets/images/Quadry/4.png']),
  ];

  @override
  void onInit() {
    scrollController = ScrollController();
    super.onInit();
  }

  /// Returns true to cancel the notification bubbling.
  bool updateNameOffset(ScrollNotification scrollNotification) {
    nameWidgetOffset.value = scrollNotification.metrics.pixels;
    // print(nameWidgetOffset.value);
    return true;
  }
}