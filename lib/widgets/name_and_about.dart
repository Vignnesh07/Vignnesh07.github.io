import 'package:flutter/material.dart';

import 'about_me.dart';
import 'name.dart';

class NameAndAboutWidget extends StatelessWidget {
  const NameAndAboutWidget({Key? key}) : super(key: key);

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