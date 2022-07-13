import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../constants/controllers.dart';
import '../utils/contact_container.dart';
import '../utils/contact_form.dart';

class ContactWidget extends StatelessWidget {
  const ContactWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final Animation<double> animation = Tween<double>(begin: 0.0, end: 1.0).animate(
    CurvedAnimation(
      parent: nameWidgetController.contactAnimationController,
      curve: const Interval(
        0.0, 1.0,
        curve: Curves.fastOutSlowIn
      ),
    ),
  );

    return AnimatedBuilder(
      animation: nameWidgetController.contactAnimationController,
      builder: (context, child) {
        return FadeTransition(
          opacity: animation,
          child: Transform(
            transform: Matrix4.translationValues(0.0, 50 * (1.0 - animation.value), 0.0),
            child: child,
          ),
        );
      },
      child: Container(
        height: height + 70,
        width: width,
        color: Colors.white,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Obx(() => AnimatedPositionedDirectional(
              top: 220,
              curve: Curves.linearToEaseOut,
              duration: const Duration(milliseconds: 500),
              start: ResponsiveValue(
                context,
                defaultValue: nameWidgetController.mainScrollOffset.value - height / 0.345,
                valueWhen: [
                  Condition.smallerThan(breakpoint: 1500, value: nameWidgetController.mainScrollOffset.value - height / 0.275),
                  Condition.smallerThan(breakpoint: 1400, value: nameWidgetController.mainScrollOffset.value - height / 0.271),
                  Condition.smallerThan(breakpoint: 1300, value: nameWidgetController.mainScrollOffset.value - height / 0.266),
                  Condition.smallerThan(breakpoint: 1200, value: nameWidgetController.mainScrollOffset.value - height / 0.263),
                  Condition.smallerThan(breakpoint: 1050, value: nameWidgetController.mainScrollOffset.value - height / 0.257),
                ]
              ).value,
              child: const ContactContainerWidget(contact: 'LinkedIn', asset: 'assets/images/logos/linkedin.png',),
            ),),
            Obx(() => AnimatedPositionedDirectional(
              top: 220,
              curve: Curves.linearToEaseOut,
              duration: const Duration(milliseconds: 600),
              start: ResponsiveValue(
                context,
                defaultValue: nameWidgetController.mainScrollOffset.value - height / 0.31,
                valueWhen: [
                  Condition.smallerThan(breakpoint: 1500, value: nameWidgetController.mainScrollOffset.value - height / 0.275),
                  Condition.smallerThan(breakpoint: 1400, value: nameWidgetController.mainScrollOffset.value - height / 0.271),
                  Condition.smallerThan(breakpoint: 1300, value: nameWidgetController.mainScrollOffset.value - height / 0.266),
                  Condition.smallerThan(breakpoint: 1200, value: nameWidgetController.mainScrollOffset.value - height / 0.263),
                  Condition.smallerThan(breakpoint: 1050, value: nameWidgetController.mainScrollOffset.value - height / 0.257),
                ]
              ).value,
              child: const ContactContainerWidget(contact: 'GitHub', asset: 'assets/images/logos/github.png',),
            ),),
            const ContactFormWidget(),
          ],
        ),
      ),
    );
  }
}