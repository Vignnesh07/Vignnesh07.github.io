import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../constants/controllers.dart';
import 'contact.dart';
import 'name_and_about.dart';
import 'projects.dart';
import 'skills.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() => SingleChildScrollView(
        physics: nameWidgetController.canScrollSentinel.value ? const ScrollPhysics() : const NeverScrollableScrollPhysics(),
        controller: nameWidgetController.mainScrollController,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            NameAndAboutWidget(),
            ProjectsWidget(),
            SkillsWidget(),
            ContactWidget(),
          ]
        )
      )),
    );
  }
}