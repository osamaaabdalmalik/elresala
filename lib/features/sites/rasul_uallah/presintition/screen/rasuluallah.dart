import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elresala/features/sites/rasul_uallah/presintition/controller/homecontroller.dart';
import 'package:elresala/features/sites/widget/inkwell_custom.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(
        builder: (controller) => Container(
            margin: const EdgeInsets.only(top: 100, right: 5, left: 5),
            child: GridView.builder(
                padding: const EdgeInsets.all(5),
                itemCount: controller.data.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1, childAspectRatio: 4),
                itemBuilder: (context, index) {
                  return InkwellCustom(
                    catigory: true,
                    iconData: controller.icons[index],
                    dataText: controller.data[index],
                    onTap: () {
                      Get.to(controller.page[index]);
                    },
                  );
                })));
  }
}
