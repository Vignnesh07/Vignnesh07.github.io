import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../constants/controllers.dart';

class AboutMeWidget extends StatelessWidget {
  const AboutMeWidget({Key? key}) : super(key: key);

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
          Obx(() => AnimatedPositionedDirectional(
            curve: Curves.linearToEaseOut,
            duration: const Duration(milliseconds: 500),
            start: ResponsiveValue(
              context,
              defaultValue: nameWidgetController.nameScrollOffset.value - height / 1.6,
              valueWhen: [
                Condition.smallerThan(breakpoint: 1500, value: nameWidgetController.nameScrollOffset.value - height / 1.4),
                Condition.smallerThan(breakpoint: 1400, value: nameWidgetController.nameScrollOffset.value - height / 1.3),
                Condition.smallerThan(breakpoint: 1300, value: nameWidgetController.nameScrollOffset.value - height / 1.2),
                Condition.smallerThan(breakpoint: 1200, value: nameWidgetController.nameScrollOffset.value - height / 1.08),
                Condition.smallerThan(breakpoint: 1050, value: nameWidgetController.nameScrollOffset.value - height),
              ]
            ).value,
            child: Text(
              "ABOUT ME", 
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
            right: 30,
            child: Container(
              color: Colors.transparent,
              width: width / 2,
              child: Text(
                "A passionate full-stack web & mobile application developer and a final year software enginering student.",
                style: TextStyle(
                  fontSize: ResponsiveValue(
                    context, 
                    defaultValue: 30.0, 
                    valueWhen: const [
                      Condition.smallerThan(name: DESKTOP, value: 18.0),
                    ]
                  ).value,
                  fontFamily: 'Avenir-Light', 
                  fontWeight: FontWeight.w300, 
                ),
                textAlign: TextAlign.left,
                softWrap: true,
              ),
            ),
          )
        ],
      ),
    );
  }
}
