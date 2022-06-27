import 'package:flutter/widgets.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';

class NameWidgetController extends GetxController {
  static NameWidgetController instance = Get.find();

  RxDouble nameWidgetOffset = 0.0.obs;

  /// Returns true to cancel the notification bubbling.
  bool updateNameOffset(ScrollNotification scrollNotification) {
    nameWidgetOffset.value = scrollNotification.metrics.pixels;
    return true;
  }
}