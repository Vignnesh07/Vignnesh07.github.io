import 'dart:convert';
import 'package:flutter/foundation.dart' show defaultTargetPlatform;


import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart' as http;

import '../model/project_model.dart';

class NameWidgetController extends GetxController with GetSingleTickerProviderStateMixin{
  static NameWidgetController instance = Get.find();

  // URLs
  String githubUrl = 'https://github.com/Vignnesh07';
  String linkedinUrl = 'https://www.linkedin.com/in/vignnesh-ravindran-1559271a9';

  // Observable variables for about me page
  RxDouble mainScrollOffset = 0.0.obs;

  // Observable variables for projects page
  RxInt currentlyDisplayed = 0.obs;
  RxBool canScrollSentinel = true.obs;
  RxDouble projectScrollOffset = 0.0.obs;
  List<ProjectModel> projectList = [
    ProjectModel(no: 1, name: 'TBSB', role: 'Full Stack Developer', description: 'Provides production insight and real-time inventory tracking', stacks: ['Flutter', 'Firebase'], appType: 'Android App', picUrl: ['assets/images/TBSB/1.png', 'assets/images/TBSB/2.png', 'assets/images/TBSB/3.png', 'assets/images/TBSB/4.png'], appUrl: 'https://play.google.com/store/apps/details?id=com.project.TBSB'),
    ProjectModel(no: 2, name: 'PK Retails', role: 'Full Stack Developer', description: 'Tracks goods distributed to multiple vendors and generates personalised invoice', stacks: ['Flutter', 'Firebase'], appType: 'Cross Platform App', picUrl: ['assets/images/PK Retails/1.png', 'assets/images/PK Retails/2.png', 'assets/images/PK Retails/5.png', 'assets/images/PK Retails/4.png'], appUrl: 'https://play.google.com/store/apps/details?id=com.pkretails.android'),
    ProjectModel(no: 3, name: 'The Quadry', role: 'Full Stack Developer', description: 'An e-commerce application that focuses on local retail businesses', stacks: ['Flutter', 'Firebase', 'Stripe'], appType: 'Cross Platform App', picUrl: ['assets/images/Quadry/1.png', 'assets/images/Quadry/2.png', 'assets/images/Quadry/3.png', 'assets/images/Quadry/4.png'], appUrl: ''),
  ];

  // Observable variables for skills page
  RxString skillDisplayed = ''.obs;

  // Observable variables for contact page
  RxString hoveredContact = ''.obs;

  // Scroll controllers for main scrollview and project scrollview
  late ScrollController mainScrollController;
  late ScrollController projectsScrollController;
  late AnimationController contactAnimationController;

  // Keys and controllers for contact page
  final GlobalKey<FormState> contactFormKey = GlobalKey<FormState>();
  late final TextEditingController nameCtrl;
  late final TextEditingController emailCtrl;
  late final TextEditingController messageCtrl;
  
  @override
  void onInit() {
    mainScrollController = ScrollController()
    ..addListener(() {
      mainScrollOffset.value = mainScrollController.offset;
      debugPrint("Main Scroll Offset: ${mainScrollOffset.value}");
      mainScrollController.offset > 2500 ? contactAnimationController.forward() : contactAnimationController.reverse();
    });

    projectsScrollController = ScrollController();

    contactAnimationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 700));

    nameCtrl = TextEditingController();
    emailCtrl = TextEditingController();
    messageCtrl = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      checkPlatform();
    });
    super.onReady();
  }

  @override
  void onClose() {
    mainScrollController.dispose();
    projectsScrollController.dispose();
    super.onClose();
  }

  // Mobile optimisation notice
  void checkPlatform(){
    if (defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.android) {
      Get.defaultDialog(
        title: "Optimisation Notice", 
        content: const Text(
          "This web is currently under optimisation for mobile platforms.\nPlease use Google Chrome on your desktop for the best experience. Have a great day! 😁",
          style: TextStyle(fontFamily: 'Avenir-Book', color: Color.fromARGB(255, 54, 54, 54), fontSize: 14.0),
          textAlign: TextAlign.center,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        titleStyle: const TextStyle(fontFamily: 'Avenir-Book', color: Color.fromARGB(255, 54, 54, 54), fontWeight: FontWeight.bold, fontSize: 16.0),
        backgroundColor: Colors.white,
        titlePadding: const EdgeInsets.symmetric(vertical: 20.0),
      );
    }
  }

  // Enables bounce animation uniquely in skills widget  
  void onSkillsHovered(String skill) {
    skillDisplayed.value = skill;
  }

  // Enables bounce animation uniquely in contact widget  
  void onContactHovered(String contact) {
    hoveredContact.value = contact;
  }

  // Send email using http POST method
  Future submitContactForm() async {
    if (contactFormKey.currentState!.validate()) {
      const String serviceID = "service_zooajai";
      const String templateID = "template_lihiwmh";
      const String userID = "FZDPTXzit2Dz9LwJU";
      Uri url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");

      await http.post(
        url,
        headers: {
          'origin': 'http://localhost',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'service_id': serviceID,
          'template_id': templateID,
          'user_id': userID,
          'template_params': {
            'user_name': nameCtrl.text,
            'user_email': emailCtrl.text,
            'user_message': messageCtrl.text,
          },
        },),
      );

      Get.snackbar(
        "Completed", 
        "Successfully sent email to Vignnesh", 
        animationDuration: const Duration(seconds: 3),
        backgroundColor: Colors.white12,
        snackPosition: SnackPosition.BOTTOM,
        dismissDirection: DismissDirection.horizontal, 
      );
    }
  }

  /// Returns true to cancel the notification bubbling.
  bool updateNameOffset(ScrollNotification scrollNotification) {
    if (scrollNotification is ScrollStartNotification){
      canScrollSentinel.value = false;
      mainScrollController.animateTo(
        Get.context!.size!.height * 2,
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