import 'package:elresala/features/sites/presentation/controller/rasul_uallah/rasul_artical_controller.dart';
import 'package:elresala/features/sites/presentation/screen/rasul_uallah/Artical/artical_contain_screen.dart';
import 'package:elresala/features/sites/presentation/widget/app_bar_custom.dart';
import 'package:elresala/features/sites/presentation/widget/inkwell_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArticalScreen extends StatelessWidget {
  const ArticalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RasulArticalControllerImp());
    return Scaffold(
        appBar: const AppBarCustom(title: 'Artical').customAppBar(context),
        body: GetBuilder<RasulArticalControllerImp>(
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
                          Get.to(ArticalContainScreen(
                              dataText: controller.dataArticalTitle[index],
                              itemCount:
                                  controller.dataArticalTitle[index].length,
                              onTap: controller.dataArticalContatin[index]));
                        },
                      );
                    }))));
  }
}
