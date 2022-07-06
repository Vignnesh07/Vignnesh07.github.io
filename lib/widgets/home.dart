import 'package:flutter/material.dart';

import '../constants/controllers.dart';
import '../utils/no_scroll_glow.dart';
import 'about_me.dart';
import 'name.dart';
import 'project1.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);
  @override

  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        floatHeaderSlivers: false,
        physics: const ClampingScrollPhysics(),
        controller: nameWidgetController.nestedScrollController,
        scrollBehavior: NoScrollGlow(),
        headerSliverBuilder: (context, isScrolled) {
          isScrolled ? print(nameWidgetController.nestedScrollController.offset) : null;
          return [
            SliverAppBar(
              backgroundColor: Colors.white,
              collapsedHeight: height * 2,
              expandedHeight: height * 2,
              flexibleSpace: const Appbar(),
            ),
          ];
        },
        body: const Project1Widget(),
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
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: height),
              const AboutMeWidget()
            ],
          ),
        )
      ],
    );
  }
}