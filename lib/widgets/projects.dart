import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../constants/controllers.dart';

class ProjectsWidget extends StatelessWidget {
  const ProjectsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          fit: FlexFit.loose,
          child: SizedBox(
            height: height,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 4,
                  child: SizedBox(
                    height: height,
                    child: SingleChildScrollView(
                      primary: false,
                      physics: const NeverScrollableScrollPhysics(),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(minHeight: height, maxHeight: height),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Obx(() => Container(
                              alignment: Alignment.topLeft,
                              padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50),
                              child: Text(
                                nameWidgetController.projectList[nameWidgetController.currentlyDisplayed.value].no.toString().padLeft(2, '0'),
                                textHeightBehavior: const TextHeightBehavior(applyHeightToFirstAscent: true),
                                style: TextStyle(
                                  height: 0.5,
                                  fontSize: 25,
                                  color: Colors.black.withOpacity(1.0),
                                  fontFamily: 'Avenir-Heavy',
                                  fontWeight: FontWeight.w900
                                ),
                              ),
                            ),),
                            const SizedBox(height: 60.0),
                            Obx(() => Container(
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.symmetric(horizontal: 65.0),
                              child: Text(
                                nameWidgetController.projectList[nameWidgetController.currentlyDisplayed.value].name,
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  fontSize: 70,
                                  color: Color.fromARGB(255, 54, 54, 54),
                                  fontFamily: 'Avenir-Heavy', 
                                ),
                              ),
                            ),),
                            const SizedBox(height: 30.0),
                            Obx(() => Container(
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.symmetric(horizontal: 65.0),
                              child: Text(
                                nameWidgetController.projectList[nameWidgetController.currentlyDisplayed.value].role,
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  fontSize: 25,
                                  color: Color.fromARGB(255, 54, 54, 54),
                                  fontFamily: 'Avenir-Medium', 
                                ),
                              ),
                            ),),
                            const SizedBox(height: 15.0),
                            Obx(() => Container(
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.symmetric(horizontal: 65.0),
                              child: Text(
                                nameWidgetController.projectList[nameWidgetController.currentlyDisplayed.value].description,
                                textAlign: TextAlign.left,
                                softWrap: true,
                                style: const TextStyle(
                                  fontSize: 25,
                                  color: Color.fromARGB(255, 54, 54, 54),
                                  fontFamily: 'Avenir-Book', 
                                ),
                              ),
                            ),),
                            const Spacer(),
                            Obx(() => Container(
                              alignment: Alignment.bottomLeft,
                              padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
                              child: Text(
                                nameWidgetController.projectList[nameWidgetController.currentlyDisplayed.value].appType.toUpperCase(),
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                  fontSize: 25,
                                  color: Color.fromARGB(255, 54, 54, 54),
                                  fontFamily: 'Avenir-Heavy', 
                                ),
                              ),
                            ),),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: NotificationListener<ScrollNotification>(
                    onNotification: nameWidgetController.updateNameOffset,
                    child: SingleChildScrollView(
                      primary: false,
                      child: SizedBox(
                        height: height * (nameWidgetController.projectList.length + 1.0),
                        child: ListView.separated(
                          shrinkWrap: true,
                          controller: nameWidgetController.projectsScrollController,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.all(0),
                          separatorBuilder: (_, __) => const SizedBox(height: 0.0), 
                          itemCount: nameWidgetController.projectList.length,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              height: index == 1 ? height / 2 * (index + 1) : index == 2 ? height / 7 * (index + 1) : height * (index + 1),
                              child: Stack(
                                clipBehavior: Clip.none,
                                alignment: Alignment.topCenter,
                                children: [
                                  Obx(() => AnimatedPositionedDirectional(
                                    curve: Curves.linearToEaseOut,
                                    duration: const Duration(milliseconds: 500),
                                    start: -30.0,
                                    bottom: index == 0 ? nameWidgetController.projectScrollOffset.value - height * (index + 1.42) : index == 1 ? nameWidgetController.projectScrollOffset.value - height * (index + 1.45) : nameWidgetController.projectScrollOffset.value - height * (index + 2.10),
                                    child: Container(
                                      height: height / 1.55,
                                      width: 500,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(image: AssetImage(nameWidgetController.projectList[index].picUrl[2]), fit: BoxFit.scaleDown)
                                      ),
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(sigmaX: 0.3, sigmaY: 0.3),
                                        child: Container(
                                          decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
                                        ),
                                      ),
                                    ),
                                  ),),
                                  Obx(() => AnimatedPositionedDirectional(
                                    curve: Curves.linearToEaseOut,
                                    duration: const Duration(milliseconds: 300),
                                    start: 30.0,
                                    bottom: index == 0 ? nameWidgetController.projectScrollOffset.value - height * (index + 0.80) : index == 1 ? nameWidgetController.projectScrollOffset.value - height * (index + 0.85) : nameWidgetController.projectScrollOffset.value - height * (index + 1.50),
                                    child: Container(
                                      height: height / 1.13,
                                      width: 500,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(image: AssetImage(nameWidgetController.projectList[index].picUrl[0]), fit: BoxFit.scaleDown, alignment: Alignment.topLeft, filterQuality: FilterQuality.high,),
                                      ),
                                    ),
                                  ),),
                                  Obx(() => AnimatedPositionedDirectional(
                                    curve: Curves.linearToEaseOut,
                                    duration: const Duration(milliseconds: 500),
                                    end: -50.0,
                                    bottom: index == 0 ? nameWidgetController.projectScrollOffset.value - height * (index + 1.45) : index == 1 ? nameWidgetController.projectScrollOffset.value - height * (index + 1.48) : nameWidgetController.projectScrollOffset.value - height * (index + 2.11),
                                    child: Container(
                                      height: height / 1.75,
                                      width: 500,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(image: AssetImage(nameWidgetController.projectList[index].picUrl[3]), fit: BoxFit.scaleDown)
                                      ),
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(sigmaX: 0.4, sigmaY: 0.4),
                                        child: Container(
                                          decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
                                        ),
                                      ),
                                    ),
                                  ),),
                                  Obx(() => AnimatedPositionedDirectional(
                                    curve: Curves.linearToEaseOut,
                                    duration: const Duration(milliseconds: 400),
                                    end: 30.0,
                                    bottom: index == 0 ? nameWidgetController.projectScrollOffset.value - height * (index + 0.90) : index == 1 ? nameWidgetController.projectScrollOffset.value - height * (index + 0.95) : nameWidgetController.projectScrollOffset.value - height * (index + 1.57),
                                    child: Container(
                                      alignment: Alignment.topRight,
                                      height: height / 1.27,
                                      width: 500,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(image: AssetImage(nameWidgetController.projectList[index].picUrl[1]), fit: BoxFit.scaleDown, alignment: Alignment.topRight,)
                                      ),
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(sigmaX: 0.2, sigmaY: 0.2),
                                        child: Container(
                                          decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
                                        ),
                                      ),
                                    ),
                                  ),),
                                ],
                              ),
                            );
                          }, 
                        ),
                      ),
                    ),
                  )
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}