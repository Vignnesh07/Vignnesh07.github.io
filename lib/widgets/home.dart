import 'package:flutter/material.dart';

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

    return Material(
      child: NotificationListener<ScrollNotification>(
        onNotification: nameWidgetController.updateNameOffset,
        child: ScrollConfiguration(
          behavior: NoScrollGlow(),
          child: Stack(
            children: <Widget> [
              const NameWidget(),
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: height),
                    const AboutMeWidget(),
                    Container(
                      height: height,
                      width: width,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}