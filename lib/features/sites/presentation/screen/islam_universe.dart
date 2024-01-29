import 'package:elresala/features/sites/presentation/controller/islam_universe.dart';
import 'package:elresala/features/sites/presentation/widget/appbar.dart';
import 'package:elresala/features/sites/presentation/widget/artical_custom.dart';
import 'package:elresala/features/sites/presentation/widget/inkwell_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IslamUniversePage extends StatelessWidget {
  const IslamUniversePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(IslamUniverseControllerImp());
    return Scaffold(
      appBar: const AppBarCustom(title: 'Islam universe').customAppBar(context),
      body: GetBuilder<IslamUniverseControllerImp>(
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
                        Get.to(ArticalCustom(
                          dataText: controller.artical[index],
                        ));
                      },
                    );
                  }))),
    );
  }
}
