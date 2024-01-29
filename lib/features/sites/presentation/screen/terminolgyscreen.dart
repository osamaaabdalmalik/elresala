import 'package:elresala/features/sites/presentation/controller/terminologycontroller.dart';
import 'package:elresala/features/sites/presentation/widget/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elresala/features/sites/presentation/widget/artical_custom.dart';
import 'package:elresala/features/sites/presentation/widget/inkwell_custom.dart';

class TerminologyPage extends StatelessWidget {
  const TerminologyPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return Scaffold(
      appBar: const AppBarCustom(title: 'Terminology').customAppBar(context),
      body: GetBuilder<HomeControllerImp>(
          builder: (controller) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: ListView.builder(
                  padding: const EdgeInsets.all(5),
                  itemCount: controller.data.length,
                  itemBuilder: (context, index) {
                    return InkwellCustom(
                      catigory: false,
                      dataText: controller.data[index],
                      onTap: () {
                        Get.to(ArticalCustom(
                          dataText: controller.artical[index],
                        ));
                      },
                    );
                  }))),
    );
  }
}
