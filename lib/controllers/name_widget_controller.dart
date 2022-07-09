import 'package:flutter/widgets.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:vignnesh07/model/project_model.dart';

class NameWidgetController extends GetxController {
  static NameWidgetController instance = Get.find();

  RxBool canScrollSentinel = true.obs;
  RxDouble nameScrollOffset = 0.0.obs;
  RxDouble projectScrollOffset = 0.0.obs;

  late ScrollController nestedScrollController;
  late ScrollController projectsScrollController;

  RxInt currentlyDisplayed = 0.obs;
  List<ProjectModel> projectList = [
    ProjectModel(no: 1, name: 'TBSB', role: 'Full Stack Developer', description: 'Provides production insight and real-time inventory tracking', stacks: ['Flutter', 'Firebase'], appType: 'Android App', picUrl: ['assets/images/TBSB/1.png', 'assets/images/TBSB/2.png', 'assets/images/TBSB/3.png', 'assets/images/TBSB/4.png']),
    ProjectModel(no: 2, name: 'PK Retails', role: 'Full Stack Developer', description: 'Tracks goods distributed to multiple vendors and generates personalised invoice', stacks: ['Flutter', 'Firebase'], appType: 'Cross Platform App', picUrl: ['assets/images/PK Retails - 13 Pro/1.png', 'assets/images/PK Retails - 13 Pro/2.png', 'assets/images/PK Retails - 13 Pro/5.png', 'assets/images/PK Retails - 13 Pro/4.png']),
    ProjectModel(no: 3, name: 'The Quadry', role: 'Full Stack Developer', description: 'An e-commerce application that focuses on local retail businesses', stacks: ['Flutter', 'Firebase', 'Stripe'], appType: 'Cross Platform App', picUrl: ['assets/images/Quadry/1.png', 'assets/images/Quadry/2.png', 'assets/images/Quadry/3.png', 'assets/images/Quadry/4.png']),
  ];

  @override
  void onInit() {
    nestedScrollController = ScrollController()
    ..addListener(() {
      nameScrollOffset.value = nestedScrollController.offset;
      debugPrint("Name Offset: ${nameScrollOffset.value}");
    });


    projectsScrollController = ScrollController();
    super.onInit();
  }

  /// Returns true to cancel the notification bubbling.
  bool updateNameOffset(ScrollNotification scrollNotification) {
    if (scrollNotification is ScrollStartNotification){
      canScrollSentinel.value = false;
      nestedScrollController.animateTo(
        1508,
        duration: const Duration(seconds: 1),
        curve: Curves.easeIn,
      );
    }

    else if (scrollNotification is ScrollUpdateNotification) {
      if (scrollNotification.metrics.pixels == scrollNotification.metrics.maxScrollExtent) {
        canScrollSentinel.value = true;
        debugPrint('Reached the bottom');
        nestedScrollController.animateTo(
          nestedScrollController.position.maxScrollExtent,
          duration: const Duration(seconds: 1),
          curve: Curves.easeIn,
        );
      } 
      else if (scrollNotification.metrics.pixels == scrollNotification.metrics.minScrollExtent) {
        canScrollSentinel.value = true;
        debugPrint('Reached the top');
        nestedScrollController.animateTo(
          nestedScrollController.position.minScrollExtent,
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
    debugPrint("Project offset: ${projectScrollOffset.value.toString()}");
    return true;
  }
}