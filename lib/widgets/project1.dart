import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../constants/controllers.dart';

class Project1Widget extends StatelessWidget {
  const Project1Widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      height: height * nameWidgetController.projectList.length,
      width: width,
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: SizedBox(
              height: height,
              child: GestureDetector(
                
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      
                    ),
                  ],
                ),
              ),
            )
          ),
          Expanded(
            flex: 4,
            child: ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.all(0),
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (_, __) => const SizedBox(height: 10.0), 
              itemCount: nameWidgetController.projectList.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  height: height * index,
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.topCenter,
                    children: [
                      Obx(() => AnimatedPositionedDirectional(
                        curve: Curves.linearToEaseOut,
                        duration: const Duration(milliseconds: 500),
                        start: -30.0,
                        bottom: index == 0 ? nameWidgetController.nameWidgetOffset.value - height / 1.90 : index == 1 ? nameWidgetController.nameWidgetOffset.value + height * 3 : nameWidgetController.nameWidgetOffset.value + height * 4,
                        child: Container(
                          height: height / 1.55,
                          width: 500,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage(nameWidgetController.projectList[index].picUrl[2]), fit: BoxFit.scaleDown)
                          ),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 0.1, sigmaY: 0.1),
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
                        bottom: nameWidgetController.nameWidgetOffset.value - height * 2 * (index + 1),
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
                        bottom: nameWidgetController.nameWidgetOffset.value - height / 2.00,
                        child: Container(
                          height: height / 1.75,
                          width: 500,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage(nameWidgetController.projectList[index].picUrl[3]), fit: BoxFit.scaleDown)
                          ),
                        ),
                      ),),
                      Obx(() => AnimatedPositionedDirectional(
                        curve: Curves.linearToEaseOut,
                        duration: const Duration(milliseconds: 500),
                        end: 30.0,
                        bottom: nameWidgetController.nameWidgetOffset.value + height * 0.05,
                        child: Container(
                          alignment: Alignment.topRight,
                          height: height / 1.27,
                          width: 500,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage(nameWidgetController.projectList[index].picUrl[1]), fit: BoxFit.scaleDown, alignment: Alignment.topRight,)
                          ),
                        ),
                      ),),
                    ],
                  ),
                );
              }, 
            )
          )
        ],
      ),
    );
  }
}