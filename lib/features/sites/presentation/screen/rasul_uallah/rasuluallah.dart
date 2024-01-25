import 'package:elresala/core/constants/app_colors.dart';
import 'package:elresala/features/sites/presentation/controller/rasul_uallah/homecontroller.dart';
import 'package:elresala/features/sites/presentation/widget/appbar.dart';
import 'package:elresala/features/sites/presentation/widget/inkwell_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RasuluallahPage extends StatelessWidget {
  const RasuluallahPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return Scaffold(
      appBar: const AppBarCustom(title: 'Rasul Allah').customAppBar(context),
      backgroundColor: AppColors.kWhiteColor,
      body: GetBuilder<HomeControllerImp>(
          builder: (controller) => Container(
              margin: const EdgeInsets.only(top: 10, right: 5, left: 5),
              child: GridView.builder(
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
                  }))),
    );
  }
}
