// ignore_for_file: camel_case_types

import 'package:get/get.dart';

import '../controller/advanced_learning_controller.dart';

class Advanced_LearningBindings extends Bindings {
  @override
  dependencies() async {
    //

    Get.put(Advanced_LearningController());
  }
}
