import 'package:flutter/material.dart';
import 'package:flutter_animator/widgets/attention_seekers/bounce.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/controllers.dart';

class ContactContainerWidget extends StatelessWidget {
  const ContactContainerWidget({
    Key? key,
    required this.contact,
    required this.asset,
  }) : super(key: key);

  final String contact; 
  final String asset;

  @override
  Widget build(BuildContext context) {
    return Obx(() => GestureDetector(
      onTap: () async {
        if (contact == 'GitHub') {
          if (await canLaunchUrl(Uri.parse(nameWidgetController.githubUrl))){
            await launchUrl(
              Uri.parse(nameWidgetController.githubUrl),
              webOnlyWindowName: '_blank',
            );
          }
        }
        else {
          if (await canLaunchUrl(Uri.parse(nameWidgetController.linkedinUrl))){
            await launchUrl(
              Uri.parse(nameWidgetController.linkedinUrl),
              webOnlyWindowName: '_blank',
            );
          }
        }
      },
      child: MouseRegion(
        onEnter: (value) => nameWidgetController.onContactHovered(contact),
        onExit: (value) => nameWidgetController.onContactHovered(''),
        child: nameWidgetController.hoveredContact.value == contact ? 
        Bounce(
          child: Container(
            width: 40,
            height: 40,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              image: DecorationImage(image: AssetImage(asset), fit: BoxFit.contain,)
            ),
          ),
        )
        :
        Container(
          width: 40,
          height: 40,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            image: DecorationImage(image: AssetImage(asset), fit: BoxFit.contain,)
          ),
        ),
      ),
    ),);
  }
}