import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../constants/controllers.dart';

class NameWidget extends StatelessWidget {
  const NameWidget({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Obx(() => Positioned(
      top: -.50 * nameWidgetController.nameWidgetOffset.value,
      child: Center(
        child: SizedBox(
          height: height,
          width: width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DelayedWidget(
                animationDuration: const Duration(milliseconds: 700),
                child: Text(
                  "Vignnesh Ravindran", 
                  style: TextStyle(
                    fontFamily: 'Valencia', 
                    fontSize: ResponsiveValue(
                      context, 
                      defaultValue: 100.0, 
                      valueWhen: const [
                        Condition.smallerThan(breakpoint: 500, value: 80.0),
                      ]
                    ).value,
                  ), 
                  textAlign: TextAlign.center, 
                  maxLines: 1,
                ),
              ),
              const SizedBox(height: 20.0),
              DelayedWidget(
                delayDuration: const Duration(milliseconds: 700),
                animationDuration: const Duration(milliseconds: 700),
                child: Text(
                  "Mobile & Web Application Developer", 
                  style: TextStyle(
                    fontFamily: 'Metropolis-Regular',
                    fontSize: ResponsiveValue(
                      context, 
                      defaultValue: 28.0, 
                      valueWhen: const [
                        Condition.smallerThan(breakpoint: 500, value: 20.0),
                      ]
                    ).value,
                    fontWeight: FontWeight.w500
                  ), 
                  textAlign: TextAlign.center,
                  maxLines: 1,
                )
              ),
            ],
          ),
        )
      ),
    ));
  }
}