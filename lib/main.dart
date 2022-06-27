import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

import 'constants/theme.dart';
import 'controllers/name_widget_controller.dart';
import 'widgets/home.dart';

void main() {
  Get.put<NameWidgetController>(NameWidgetController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vignnesh Ravindran',
      theme: CustomTheme().lightTheme(),
      home: const HomeWidget(),
    );
  }
}