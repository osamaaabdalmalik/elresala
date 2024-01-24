import 'package:elresala/features/sites/rasul_uallah/presintition/controller/videocontroller.dart';
import 'package:elresala/features/sites/rasul_uallah/presintition/screen/Video/videocontain.dart';
import 'package:elresala/features/sites/widget/inkwell_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VideoControllerImp());
    return Scaffold(
        appBar: AppBar(),
        body: GetBuilder<VideoControllerImp>(
            builder: (controller) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: GridView.builder(
                    padding: const EdgeInsets.all(5),
                    itemCount: controller.dataVideoKey.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1, childAspectRatio: 3),
                    itemBuilder: (context, index) {
                      return InkwellCustom(
                        catigory: false,
                        dataText: controller.dataVideoKey[index],
                        onTap: () {
                          Get.to(VideoContainPage(
                              dataText: controller.dataVideoTitle[index],
                              itemCount:
                                  controller.dataVideoTitle[index].length,
                              onTap: controller.dataVideoLink[index]));
                        },
                      );
                    }))));
  }
}
