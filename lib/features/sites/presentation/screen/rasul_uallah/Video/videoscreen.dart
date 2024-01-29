import 'package:elresala/features/sites/presentation/controller/rasul_uallah/videocontroller.dart';
import 'package:elresala/features/sites/presentation/screen/rasul_uallah/Video/videocontain.dart';
import 'package:elresala/features/sites/presentation/widget/appbar.dart';
import 'package:elresala/features/sites/presentation/widget/inkwell_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VideoControllerImp());
    return Scaffold(
        appBar: const AppBarCustom(title: 'Video').customAppBar(context),
        body: GetBuilder<VideoControllerImp>(
            builder: (controller) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: ListView.builder(
                    padding: const EdgeInsets.all(5),
                    itemCount: controller.dataVideoKey.length,
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
