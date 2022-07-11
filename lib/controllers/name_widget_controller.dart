import 'package:flutter/widgets.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';

import '../model/project_model.dart';

class NameWidgetController extends GetxController with GetSingleTickerProviderStateMixin{
  static NameWidgetController instance = Get.find();

  // Observable variables for about me page
  RxDouble mainScrollOffset = 0.0.obs;

  // Observable variables for projects page
  RxInt currentlyDisplayed = 0.obs;
  RxBool canScrollSentinel = true.obs;
  RxDouble projectScrollOffset = 0.0.obs;
  List<ProjectModel> projectList = [
    ProjectModel(no: 1, name: 'TBSB', role: 'Full Stack Developer', description: 'Provides production insight and real-time inventory tracking', stacks: ['Flutter', 'Firebase'], appType: 'Android App', picUrl: ['assets/images/TBSB/1.png', 'assets/images/TBSB/2.png', 'assets/images/TBSB/3.png', 'assets/images/TBSB/4.png']),
    ProjectModel(no: 2, name: 'PK Retails', role: 'Full Stack Developer', description: 'Tracks goods distributed to multiple vendors and generates personalised invoice', stacks: ['Flutter', 'Firebase'], appType: 'Cross Platform App', picUrl: ['assets/images/PK Retails/1.png', 'assets/images/PK Retails/2.png', 'assets/images/PK Retails/5.png', 'assets/images/PK Retails/4.png']),
    ProjectModel(no: 3, name: 'The Quadry', role: 'Full Stack Developer', description: 'An e-commerce application that focuses on local retail businesses', stacks: ['Flutter', 'Firebase', 'Stripe'], appType: 'Cross Platform App', picUrl: ['assets/images/Quadry/1.png', 'assets/images/Quadry/2.png', 'assets/images/Quadry/3.png', 'assets/images/Quadry/4.png']),
  ];

  // Observable variables for skills page
  RxString skillDisplayed = ''.obs;

  // Scroll controllers for main scrollview and project scrollview
  late ScrollController mainScrollController;
  late ScrollController projectsScrollController;

  
  @override
  void onInit() {
    mainScrollController = ScrollController()
    ..addListener(() {
      mainScrollOffset.value = mainScrollController.offset;
      debugPrint("Name Offset: ${mainScrollOffset.value}");
    });

    projectsScrollController = ScrollController();
    super.onInit();
  }

  @override
  void onClose() {
    mainScrollController.dispose();
    projectsScrollController.dispose();
    super.onClose();
  }

  // Enables bounce animation uniquely in skills widget  
  void onEntered(String skill) {
    skillDisplayed.value = skill;
  }

  /// Returns true to cancel the notification bubbling.
  bool updateNameOffset(ScrollNotification scrollNotification) {
    if (scrollNotification is ScrollStartNotification){
      canScrollSentinel.value = false;
      mainScrollController.animateTo(
        1508,
        duration: const Duration(seconds: 1),
        curve: Curves.easeIn,
      );
    }

    else if (scrollNotification is ScrollUpdateNotification) {
      if (scrollNotification.metrics.pixels == scrollNotification.metrics.maxScrollExtent) {
        canScrollSentinel.value = true;
        debugPrint('Reached the bottom');
        mainScrollController.animateTo(
          mainScrollController.position.maxScrollExtent,
          duration: const Duration(seconds: 1),
          curve: Curves.easeIn,
        );
      } 
      else if (scrollNotification.metrics.pixels == scrollNotification.metrics.minScrollExtent) {
        canScrollSentinel.value = true;
        debugPrint('Reached the top');
        mainScrollController.animateTo(
          mainScrollController.position.minScrollExtent,
          duration: const Duration(seconds: 1),
          curve: Curves.easeIn,
        );
      }
      else if (scrollNotification.metrics.pixels < 914) {
        currentlyDisplayed.value = 0;
      }
      else if (scrollNotification.metrics.pixels < 1684){
        currentlyDisplayed.value = 1;
      }
      else if (scrollNotification.metrics.pixels > 1684){
        currentlyDisplayed.value = 2;
      }
    }
    projectScrollOffset.value = scrollNotification.metrics.pixels;
    return true;
  }
}