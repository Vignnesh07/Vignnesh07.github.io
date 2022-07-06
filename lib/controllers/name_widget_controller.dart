import 'package:flutter/widgets.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:vignnesh07/model/project_model.dart';

class NameWidgetController extends GetxController {
  static NameWidgetController instance = Get.find();

  RxDouble nameScrollOffset = 0.0.obs;
  RxDouble projectScrollOffset = 0.0.obs;

  late ScrollController nestedScrollController;
  late ScrollController projectsScrollController;

  RxInt currentlyDisplayed = 0.obs;
  List<ProjectModel> projectList = [
    ProjectModel(no: 1, name: 'TBSB', role: 'Full Stack Developer', description: 'Provides production insight and real-time inventory tracking', stacks: ['Flutter', 'Firebase'], appType: 'Android App', picUrl: ['assets/images/TBSB/1.png', 'assets/images/TBSB/2.png', 'assets/images/TBSB/3.png', 'assets/images/TBSB/4.png']),
    ProjectModel(no: 2, name: 'PK Retails', role: 'Full Stack Developer', description: 'Provides production insight and real-time inventory tracking', stacks: ['Flutter', 'Firebase'], appType: 'Cross Platform App', picUrl: ['assets/images/PK Retails - 13 Pro/1.png', 'assets/images/PK Retails - 13 Pro/2.png', 'assets/images/PK Retails - 13 Pro/5.png', 'assets/images/PK Retails - 13 Pro/4.png']),
    ProjectModel(no: 3, name: 'The Quadry', role: 'Full Stack Developer', description: 'Provides production insight and real-time inventory tracking', stacks: ['Flutter', 'Firebase', 'Stripe'], appType: 'Cross Platform App', picUrl: ['assets/images/Quadry/1.png', 'assets/images/Quadry/2.png', 'assets/images/Quadry/3.png', 'assets/images/Quadry/4.png']),
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

  @override
  void onReady() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      
      // nameScrollOffset.listen((offset) {
      //   if (offset >= 1188) {
      //     debugPrint('working');
      //     nestedScrollController.jumpTo(nestedScrollController.position.maxScrollExtent);
      //     // nestedScrollController.animateTo(nestedScrollController.position.maxScrollExtent, duration: const Duration(seconds: 1), curve: Curves.easeIn);
      //   }
      // });

      projectScrollOffset.listen((offset) {
        if (offset >= 130) {
          currentlyDisplayed.value = 0;
        }
        else if (offset >= 940){
          currentlyDisplayed.value = 1;
        }
        else if (offset >= 1710){
          currentlyDisplayed.value = 1;
        }
        else {
          currentlyDisplayed.value = 0;
        }
      });

      debugPrint(currentlyDisplayed.value.toString());

    });
  }

  alterCurrentDisplayedProject(){
    if (projectScrollOffset.value >= 130.00){
      currentlyDisplayed.value = 0;
    }

    else if (projectScrollOffset.value >= 2437.00){
      currentlyDisplayed.value = 1;
    }

    else if (projectScrollOffset.value >= 1720.00){
      currentlyDisplayed.value = 2;
    }

    else {
      currentlyDisplayed.value = 0;
    }
    debugPrint("Currently Displayed: ${currentlyDisplayed.value}");
  }

  /// Returns true to cancel the notification bubbling.
  bool updateNameOffset(ScrollNotification scrollNotification) {
    // projectScrollOffset.value = scrollNotification.metrics.pixels;
    // alterCurrentDisplayedProject(projectScrollOffset.value);
    // print("Project Offset: ${projectScrollOffset.value}");
    // print("Currently Displayed: ${currentlyDisplayed.value}");
    // return true;

    if (scrollNotification is ScrollUpdateNotification) {
      if (scrollNotification.metrics.pixels == scrollNotification.metrics.maxScrollExtent) {
        debugPrint('Reached the bottom');
        nestedScrollController.animateTo(
          nestedScrollController.position.maxScrollExtent,
          duration: const Duration(seconds: 1),
          curve: Curves.easeIn,
        );
      } 
      else if (scrollNotification.metrics.pixels == scrollNotification.metrics.minScrollExtent) {
        debugPrint('Reached the top');
        nestedScrollController.animateTo(
          nestedScrollController.position.minScrollExtent,
          duration: const Duration(seconds: 1),
          curve: Curves.easeIn,
        );
      }
    }
    projectScrollOffset.value = scrollNotification.metrics.pixels;
    alterCurrentDisplayedProject();
    debugPrint("Project offset: ${projectScrollOffset.value.toString()}");
    return true;
  }
}