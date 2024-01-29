import 'package:elresala/features/sites/presentation/controller/learning_islam.dart';
import 'package:elresala/features/sites/presentation/widget/appbar.dart';
import 'package:elresala/features/sites/presentation/widget/artical_custom.dart';
import 'package:elresala/features/sites/presentation/widget/inkwell_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LearningTitleLessonPage extends StatelessWidget {
  final int itemCount;
  final List dataText;
  const LearningTitleLessonPage({
    super.key,
    required this.itemCount,
    required this.dataText,
  });

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
                        dataText: dataText[index]['title'],
                        onTap: () {
                          Get.to(ArticalCustom(
                            dataText: dataText[index]['lines'],
                          ));
                        },
                      );
                    })))));
  }
}
