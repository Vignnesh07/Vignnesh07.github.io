import 'package:flutter/widgets.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:vignnesh07/model/project_model.dart';

class NameWidgetController extends GetxController {
  static NameWidgetController instance = Get.find();

  RxDouble nameScrollOffset = 0.0.obs;
  RxDouble projectScrollOffset = 0.0.obs;
  late ScrollController scrollController;
  RxInt currentlyDisplayed = 0.obs;
  List<ProjectModel> projectList = [
    ProjectModel(no: 1, name: 'TBSB', role: 'Full Stack Developer', description: 'Provides production insight and real-time inventory tracking', stacks: ['Flutter', 'Firebase'], appType: 'Android App', picUrl: ['assets/images/TBSB/1.png', 'assets/images/TBSB/2.png', 'assets/images/TBSB/3.png', 'assets/images/TBSB/4.png']),
    ProjectModel(no: 2, name: 'PK Retails', role: 'Full Stack Developer', description: 'Provides production insight and real-time inventory tracking', stacks: ['Flutter', 'Firebase'], appType: 'Cross Platform App', picUrl: ['assets/images/PK Retails - 13 Pro/1.png', 'assets/images/PK Retails - 13 Pro/2.png', 'assets/images/PK Retails - 13 Pro/5.png', 'assets/images/PK Retails - 13 Pro/4.png']),
    ProjectModel(no: 3, name: 'The Quadry', role: 'Full Stack Developer', description: 'Provides production insight and real-time inventory tracking', stacks: ['Flutter', 'Firebase', 'Stripe'], appType: 'Cross Platform App', picUrl: ['assets/images/Quadry/1.png', 'assets/images/Quadry/2.png', 'assets/images/Quadry/3.png', 'assets/images/Quadry/4.png']),
  ];

  @override
  void onInit() {
    scrollController = ScrollController()
    ..addListener(() {
      nameScrollOffset.value = scrollController.offset;
      print("Name Offset: ${nameScrollOffset.value}");
    });
    
    super.onInit();
  }

  /// Returns true to cancel the notification bubbling.
  bool updateNameOffset(ScrollNotification scrollNotification) {
    // if (scrollNotification.metrics.pixels >= 1577) {
      projectScrollOffset.value = scrollNotification.metrics.pixels;
      print("Project: ${projectScrollOffset.value}");
    // }
    
    // print("Offset: ${nameWidgetOffset.value}");
    // print("Metrics: ${scrollNotification.metrics.pixels}");
    return true;
  }
}