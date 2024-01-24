import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elresala/features/sites/muhammad_the_messanger/presintition/controller/muhammadcontroller.dart';
import 'package:elresala/features/sites/widget/artical_custom.dart';
import 'package:elresala/features/sites/widget/inkwell_custom.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return Scaffold(
      body: GetBuilder<HomeControllerImp>(
          builder: (controller) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: GridView.builder(
                  padding: const EdgeInsets.all(5),
                  itemCount: controller.data.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1, childAspectRatio: 4),
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
