import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../constants/controllers.dart';
import '../utils/skills_container.dart';

class SkillsWidget extends StatelessWidget {
  const SkillsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      height: height,
      width: width,
      color: Colors.white,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            right: 0.0,
            child: Container(
              height: 400,
              width: 600,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage('assets/images/skills_background.webp'), fit: BoxFit.cover)
              ),
            ),
          ),
          Obx(() => AnimatedPositionedDirectional(
            curve: Curves.linearToEaseOut,
            duration: const Duration(milliseconds: 500),
            end: ResponsiveValue(
              context,
              defaultValue: nameWidgetController.mainScrollOffset.value - height / 0.42,
              valueWhen: [
                Condition.smallerThan(breakpoint: 1500, value: nameWidgetController.mainScrollOffset.value - height / 0.41),
                Condition.smallerThan(breakpoint: 1400, value: nameWidgetController.mainScrollOffset.value - height / 0.40),
                Condition.smallerThan(breakpoint: 1300, value: nameWidgetController.mainScrollOffset.value - height / 0.40),
                Condition.smallerThan(breakpoint: 1200, value: nameWidgetController.mainScrollOffset.value - height / 0.39),
                Condition.smallerThan(breakpoint: 1050, value: nameWidgetController.mainScrollOffset.value - height / 0.39),
              ]
            ).value,
            child: Text(
              "SKILLS", 
              style: TextStyle(
                fontSize: ResponsiveValue(
                  context, 
                  defaultValue: 180.0, 
                  valueWhen: const [
                    Condition.smallerThan(name: DESKTOP, value: 100.0),
                  ]
                ).value,
                fontFamily: 'Avenir-Heavy', 
                fontWeight: FontWeight.w700, 
                color: const Color.fromRGBO(238, 238, 238, 1),
              ),
            ),
          ),),
          Positioned(
            top: 90.0,
            left: 50.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Application Dev Stack
                const Text(
                  "Application Development Stack: ",
                  style: TextStyle(
                    fontSize: 25,
                    color: Color.fromARGB(255, 54, 54, 54),
                    fontFamily: 'Avenir-Book', 
                  ),
                ),
                const SizedBox(height: 30.0),
                Row(
                  children: const [
                    SkillsContainerWidget(asset: 'assets/images/logos/dart.svg', skill: 'Dart'),
                    SizedBox(width: 30.0,),
                    SkillsContainerWidget(asset: 'assets/images/logos/flutter.svg', skill: 'Flutter'),
                    SizedBox(width: 30.0,),
                    SkillsContainerWidget(asset: 'assets/images/logos/javascript.svg', skill: 'JavaScript'),
                    SizedBox(width: 30.0,),
                    SkillsContainerWidget(asset: 'assets/images/logos/react.svg', skill: 'React Native'),
                    SizedBox(width: 30.0,),
                    SkillsContainerWidget(asset: 'assets/images/logos/nodejs.svg', skill: 'NodeJS'),
                    SizedBox(width: 30.0,),
                  ],
                ),
                const SizedBox(height: 25.0),
                Row(
                  children: const [
                    SkillsContainerWidget(asset: 'assets/images/logos/html5.svg', skill: 'HTML5'),
                    SizedBox(width: 30.0,),
                    SkillsContainerWidget(asset: 'assets/images/logos/css3.svg', skill: 'CSS3'),
                    SizedBox(width: 30.0,),
                    SkillsContainerWidget(asset: 'assets/images/logos/typescript.svg', skill: 'TypeScript'),
                    SizedBox(width: 30.0,),
                  ],
                ),
                // High-level Dev Stack
                const SizedBox(height: 65.0,),
                const Text(
                  "High-Level Development Stack: ",
                  style: TextStyle(
                    fontSize: 25,
                    color: Color.fromARGB(255, 54, 54, 54),
                    fontFamily: 'Avenir-Book', 
                  ),
                ),
                const SizedBox(height: 30.0),
                Row(
                  children: const [
                    SkillsContainerWidget(asset: 'assets/images/logos/python.svg', skill: 'Python'),
                    SizedBox(width: 30.0,),
                    SkillsContainerWidget(asset: 'assets/images/logos/cplusplus.svg', skill: 'C++'),
                    SizedBox(width: 30.0,),
                    SkillsContainerWidget(asset: 'assets/images/logos/java.svg', skill: 'Java'),
                    SizedBox(width: 30.0,),
                    SkillsContainerWidget(asset: 'assets/images/logos/php.svg', skill: 'PHP'),
                    SizedBox(width: 30.0,),
                    SkillsContainerWidget(asset: 'assets/images/logos/anaconda.svg', skill: 'Anaconda'),
                    SizedBox(width: 30.0,),
                  ],
                ),
                // Database + Cloud
                const SizedBox(height: 65.0,),
                const Text(
                  "Database + Cloud: ",
                  style: TextStyle(
                    fontSize: 25,
                    color: Color.fromARGB(255, 54, 54, 54),
                    fontFamily: 'Avenir-Book', 
                  ),
                ),
                const SizedBox(height: 30.0),
                Row(
                  children: const [
                    SkillsContainerWidget(asset: 'assets/images/logos/firebase.svg', skill: 'Firebase'),
                    SizedBox(width: 30.0,),
                    SkillsContainerWidget(asset: 'assets/images/logos/mysql.svg', skill: 'MySQL'),
                    SizedBox(width: 30.0,),
                    SkillsContainerWidget(asset: 'assets/images/logos/google-cloud.svg', skill: 'Google Cloud'),
                    SizedBox(width: 30.0,),
                  ],
                ),
              ],
            ),
          ),
          Obx(() => AnimatedPositionedDirectional(
            top: nameWidgetController.skillDisplayed.value == '' ? -50.0 : 50.0,
            curve: Curves.easeInOut,
            duration: const Duration(seconds: 1),
            child: Container(
              height: 50.0,
              width: 300.0,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(color: const Color.fromARGB(255, 74, 74, 74), width: 2.0),
                borderRadius: BorderRadius.circular(6.0)
              ),
              child: Center(
                child: Text(
                  nameWidgetController.skillDisplayed.value,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 54, 54, 54),
                    fontFamily: 'Avenir-Book', 
                  ),
                ),
              ),
            ), 
          ),),
        ],
      ),
    );
  }
}