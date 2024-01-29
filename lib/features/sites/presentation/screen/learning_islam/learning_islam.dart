import 'package:elresala/features/sites/presentation/controller/learning_islam.dart';
import 'package:elresala/features/sites/presentation/screen/learning_islam/learning_contain.dart';
import 'package:elresala/features/sites/presentation/widget/appbar.dart';
import 'package:elresala/features/sites/presentation/widget/inkwell_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LearningIslamPage extends StatelessWidget {
  const LearningIslamPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LearningIslamControllerImp());
    return Scaffold(
      appBar: const AppBarCustom(title: 'Learning islam').customAppBar(context),
      body: GetBuilder<LearningIslamControllerImp>(
          builder: (controller) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: ListView.builder(
                  padding: const EdgeInsets.all(5),
                  itemCount: controller.title.length,
                  itemBuilder: (context, index) {
                    return InkwellCustom(
                      catigory: false,
                      dataText: controller.title[index],
                      onTap: () {
                        Get.to(LearningContainPage(
                            dataText: controller.titleSubCatigory[index],
                            itemCount:
                                controller.titleSubCatigory[index].length,
                            onTap: controller.titleSubCatigory[index]));
                      },
                    );
                  }))),
    );
  }
}
