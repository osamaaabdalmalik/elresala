import 'package:elresala/features/sites/presentation/controller/islam_port.dart';
import 'package:elresala/features/sites/presentation/widget/appbar.dart';
import 'package:elresala/features/sites/presentation/widget/artical_custom.dart';
import 'package:elresala/features/sites/presentation/widget/inkwell_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IslamPortPage extends StatelessWidget {
  const IslamPortPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(IslamPortControllerImp());
    return Scaffold(
      appBar: const AppBarCustom(title: 'Islam port').customAppBar(context),
      body: GetBuilder<IslamPortControllerImp>(
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
