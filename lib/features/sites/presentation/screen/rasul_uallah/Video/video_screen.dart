import 'package:elresala/features/sites/presentation/controller/rasul_uallah/rasul_video_controller.dart';
import 'package:elresala/features/sites/presentation/screen/rasul_uallah/Video/video_contain_screen.dart';
import 'package:elresala/features/sites/presentation/widget/app_bar_custom.dart';
import 'package:elresala/features/sites/presentation/widget/inkwell_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RasulVideoControllerImp());
    return Scaffold(
        appBar: const AppBarCustom(title: 'Video').customAppBar(context),
        body: GetBuilder<RasulVideoControllerImp>(
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
                          Get.to(VideoContainScreen(
                              dataText: controller.dataVideoTitle[index],
                              itemCount:
                                  controller.dataVideoTitle[index].length,
                              onTap: controller.dataVideoLink[index]));
                        },
                      );
                    }))));
  }
}
