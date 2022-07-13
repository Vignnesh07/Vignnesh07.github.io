import 'package:flutter/material.dart';
import 'package:flutter_animator/widgets/attention_seekers/bounce.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../constants/controllers.dart';

class SkillsContainerWidget extends StatelessWidget {
  final String asset;
  final String skill;

  const SkillsContainerWidget({
    Key? key,
    required this.asset,
    required this.skill,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => nameWidgetController.onSkillsHovered(skill),
      onExit: (event) => nameWidgetController.onSkillsHovered(''),
      child: Obx(() => nameWidgetController.skillDisplayed.value == skill ? 
        Bounce(
          child: Container(
            width: 60,
            height: 60,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              image: DecorationImage(image: AssetImage(asset), fit: BoxFit.fill,)
            ),
          ),
        )
        :
        Container(
          width: 60,
          height: 60,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            image: DecorationImage(image: AssetImage(asset), fit: BoxFit.fill,)
          ),
        ),
      ),
    );
  }
}