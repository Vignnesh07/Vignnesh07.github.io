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

    return Flexible(
      fit: FlexFit.loose,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: SizedBox(
              height: height,
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                primary: false,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(left: 35.0, top: 40.0),
                      child: Text(
                        nameWidgetController.projectList[nameWidgetController.currentlyDisplayed.value].no.toString().padLeft(2, '0'),
                        style: TextStyle(
                          height: 0.5,
                          fontSize: 25,
                          color: Colors.black.withOpacity(1.0),
                          fontFamily: 'Metropolis-SemiBold', 
                          fontWeight: FontWeight.w900,
                        ),
                        textHeightBehavior: const TextHeightBehavior(applyHeightToFirstAscent: true),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: SingleChildScrollView(
              child: SizedBox(
                height: height * (nameWidgetController.projectList.length + 2.4),
                child: ListView.separated(
                  shrinkWrap: true,
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
                            bottom: index == 0 ? nameWidgetController.projectScrollOffset.value - height * (index + 2.22) : index == 1 ? nameWidgetController.projectScrollOffset.value - height * (index + 2.00) : nameWidgetController.projectScrollOffset.value - height * (index + 2.45),
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
                            bottom: index == 0 ? nameWidgetController.projectScrollOffset.value - height * (index + 1.40) : index == 1 ? nameWidgetController.projectScrollOffset.value - height * (index + 1.40) : nameWidgetController.projectScrollOffset.value - height * (index + 1.85),
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
                            bottom: index == 0 ? nameWidgetController.projectScrollOffset.value - height * (index + 2.20) : index == 1 ? nameWidgetController.projectScrollOffset.value - height * (index + 2.00) : nameWidgetController.projectScrollOffset.value - height * (index + 2.48),
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
                            duration: const Duration(milliseconds: 400),
                            end: 30.0,
                            bottom: index == 0 ? nameWidgetController.projectScrollOffset.value - height * (index + 1.65) : index == 1 ? nameWidgetController.projectScrollOffset.value - height * (index + 1.45) : nameWidgetController.projectScrollOffset.value - height * (index + 1.95),
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
                ),
              ),
            )
          )
        ],
      ),
    );
  }
}