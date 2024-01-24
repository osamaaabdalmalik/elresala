import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elresala/features/sites/rasul_uallah/presintition/controller/articalcontroller.dart';
import 'package:elresala/features/sites/rasul_uallah/presintition/screen/Artical/articalcontain.dart';
import 'package:elresala/features/sites/widget/inkwell_custom.dart';

class ArticalScreen extends StatelessWidget {
  const ArticalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ArticalControllerImp());
    return Scaffold(
        appBar: AppBar(),
        body: GetBuilder<ArticalControllerImp>(
            builder: (controller) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: GridView.builder(
                    padding: const EdgeInsets.all(5),
                    itemCount: controller.dataArticalKey.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1, childAspectRatio: 3),
                    itemBuilder: (context, index) {
                      return InkwellCustom(
                        catigory: false,
                        dataText: controller.dataArticalKey[index],
                        onTap: () {
                          Get.to(ArticalContainPage(
                              dataText: controller.dataArticalTitle[index],
                              itemCount:
                                  controller.dataArticalTitle[index].length,
                              onTap: controller.dataArticalContatin[index]));
                        },
                      );
                    }))));
  }
}
