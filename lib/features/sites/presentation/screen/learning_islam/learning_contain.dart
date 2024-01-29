import 'package:elresala/features/sites/presentation/controller/learning_islam.dart';
import 'package:elresala/features/sites/presentation/screen/learning_islam/learning_title_lesson.dart';
import 'package:elresala/features/sites/presentation/widget/appbar.dart';
import 'package:elresala/features/sites/presentation/widget/inkwell_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LearningContainPage extends StatelessWidget {
  final int itemCount;
  final List dataText;
  final List onTap;
  const LearningContainPage(
      {super.key,
      required this.itemCount,
      required this.dataText,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    Get.put(LearningIslamControllerImp());
    return Scaffold(
        appBar:
            const AppBarCustom(title: 'Learning islam').customAppBar(context),
        body: GetBuilder<LearningIslamControllerImp>(
            builder: ((controller) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: ListView.builder(
                    padding: const EdgeInsets.all(5),
                    itemCount: itemCount,
                    itemBuilder: (context, index) {
                      return InkwellCustom(
                        catigory: false,
                        dataText: dataText[index],
                        onTap: () {
                          Get.to(LearningTitleLessonPage(
                            dataText: controller.temprory[onTap[index]],
                            itemCount: controller.temprory[onTap[index]].length,
                          ));
                        },
                      );
                    })))));
  }
}
