import 'package:elresala/features/sites/rasul_uallah/presintition/controller/bookcontroller.dart';
import 'package:elresala/features/sites/rasul_uallah/presintition/screen/Book/bookcontain.dart';
import 'package:elresala/features/sites/widget/inkwell_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookScreen extends StatelessWidget {
  const BookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(BookControllerImp());
    return Scaffold(
        appBar: AppBar(),
        body: GetBuilder<BookControllerImp>(
            builder: (controller) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: GridView.builder(
                    padding: const EdgeInsets.all(5),
                    itemCount: controller.dataBookKey.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1, childAspectRatio: 3),
                    itemBuilder: (context, index) {
                      return InkwellCustom(
                        catigory: false,
                        dataText: controller.dataBookKey[index],
                        onTap: () {
                          Get.to(BookContainPage(
                              dataText: controller.dataBookTitle[index],
                              itemCount: controller.dataBookTitle[index].length,
                              onTap: controller.dataBookLink[index]));
                        },
                      );
                    }))));
  }
}
