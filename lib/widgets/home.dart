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
            children: const [
              Project1Widget(),
            ],
          ),
        ),
      //   child: NestedScrollView(
      //     floatHeaderSlivers: false,
      //     physics: const ClampingScrollPhysics(),
      //     controller: nameWidgetController.scrollController,
      //     scrollBehavior: NoScrollGlow(),
      //     body: SingleChildScrollView(
      //       primary: true,
      //       physics: const ClampingScrollPhysics(),
      //       child: Column(
      //         mainAxisSize: MainAxisSize.min,
      //         children: [
      //           const Project1Widget(),
      //           Flexible(
      //             fit: FlexFit.loose,
      //             child: SizedBox(
      //               height: height,
      //               width: width,
      //               child: const Center(child: Text("Hello World"),),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //     headerSliverBuilder: (context, isScrolled) {
      //       return [
      //         SliverAppBar(
      //           backgroundColor: Colors.white,
      //           collapsedHeight: height * 2,
      //           expandedHeight: height * 2,
      //           flexibleSpace: const Appbar(),
      //         ),
      //       ];
      //     }
      //   ),
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

// SingleChildScrollView(
              //   controller: nameWidgetController.scrollController,
              //   physics: const ClampingScrollPhysics(),
              //   child: Column(
              //     mainAxisSize: MainAxisSize.min,
              //     children: [
              //       SizedBox(height: height),
              //       const Flexible(fit: FlexFit.loose, child: AboutMeWidget()),
              //       const Project1Widget(),
              //       Flexible(
              //         fit: FlexFit.loose,
              //         child: SizedBox(
              //           height: height,
              //           width: width,
              //           child: const Center(child: Text("Hello World"),),
              //         ),
              //       ),
              //     ],
              //   ),
              // )