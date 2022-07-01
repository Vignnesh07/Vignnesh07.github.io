import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../constants/controllers.dart';
import '../utils/no_scroll_glow.dart';
import 'about_me.dart';
import 'name.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);
  @override

  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: NotificationListener<ScrollNotification>(
        onNotification: nameWidgetController.updateNameOffset,
        child: NestedScrollView(
          floatHeaderSlivers: false,
          physics: const ClampingScrollPhysics(),
          controller: nameWidgetController.scrollController,
          scrollBehavior: NoScrollGlow(),
          headerSliverBuilder: (context, isScrolled) {
            return [
              SliverAppBar(
                backgroundColor: Colors.white,
                collapsedHeight: height * 2,
                expandedHeight: height * 2,
                flexibleSpace: const Appbar(),
              ),
            ];
          },
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
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
                          child: ConstrainedBox(
                            constraints: BoxConstraints(maxHeight: height),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
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
                                ),
                                const SizedBox(height: 60.0),
                                Container(
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
                                ),
                                const SizedBox(height: 30.0),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  padding: const EdgeInsets.symmetric(horizontal: 65.0),
                                  child: Text(
                                    nameWidgetController.projectList[nameWidgetController.currentlyDisplayed.value].role,
                                    // textHeightBehavior: const TextHeightBehavior(applyHeightToFirstAscent: true),
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                      // height: 0.5,
                                      fontSize: 25,
                                      color: Color.fromARGB(255, 54, 54, 54),
                                      fontFamily: 'Avenir-Medium', 
                                      // fontWeight: FontWeight.w600
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 15.0),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  padding: const EdgeInsets.symmetric(horizontal: 65.0),
                                  child: Text(
                                    nameWidgetController.projectList[nameWidgetController.currentlyDisplayed.value].description,
                                    // textHeightBehavior: const TextHeightBehavior(applyHeightToFirstAscent: true),
                                    textAlign: TextAlign.left,
                                    softWrap: true,
                                    style: const TextStyle(
                                      // height: 0.5,
                                      fontSize: 25,
                                      color: Color.fromARGB(255, 54, 54, 54),
                                      fontFamily: 'Avenir-Book', 
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                AnimatedContainer(
                                  curve: const Cubic(0.19, 1, 0.22, 1),
                                  duration: const Duration(seconds: 1),
                                  alignment: Alignment.bottomLeft,
                                  padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30.0),
                                  child: Text(
                                    nameWidgetController.projectList[nameWidgetController.currentlyDisplayed.value].appType.toUpperCase(),
                                    // textHeightBehavior: const TextHeightBehavior(applyHeightToFirstAscent: true),
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                      // height: 0.5,
                                      fontSize: 25,
                                      color: Color.fromARGB(255, 54, 54, 54),
                                      fontFamily: 'Avenir-Heavy', 
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
              ),

              // Expanded(child: SizedBox(height: height, child: const Center(child: Text("Hello World!"),),))
            ],
          ),
        ),
      ),
    );
  }
}


class Appbar extends StatelessWidget {
  const Appbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        const NameWidget(),
        Column(
          children: [
            SizedBox(height: height),
            const AboutMeWidget()
          ],
        )
      ],
    );
  }
}