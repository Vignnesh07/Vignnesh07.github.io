import 'package:flutter/material.dart';
import 'package:flutter_animator/widgets/attention_seekers/bounce.dart';
import 'package:flutter_svg/svg.dart';
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
      onEnter: (event) => nameWidgetController.onEntered(skill),
      onExit: (event) => nameWidgetController.onEntered(''),
      child: Obx(() => nameWidgetController.skillDisplayed.value == skill ? 
        Bounce(
          child: Container(
            width: 50,
            height: 50,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: SvgPicture.asset(asset, fit: BoxFit.contain, semanticsLabel: skill, height: 50, width: 50,),
          ),
        )
        :
        Container(
          width: 50,
          height: 50,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: SvgPicture.asset(asset, fit: BoxFit.contain, semanticsLabel: skill, height: 50, width: 50,),
        ),
      ),
    );
  }
}