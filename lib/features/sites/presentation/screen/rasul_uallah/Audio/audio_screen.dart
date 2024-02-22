import 'package:elresala/features/sites/presentation/controller/rasul_uallah/rasul_audio_controller.dart';
import 'package:elresala/features/sites/presentation/screen/rasul_uallah/Audio/audio_contain_screen.dart';
import 'package:elresala/features/sites/presentation/widget/app_bar_custom.dart';
import 'package:elresala/features/sites/presentation/widget/inkwell_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AudioScreen extends StatelessWidget {
  const AudioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RasulAudioControllerImp());
    return Scaffold(
        appBar: const AppBarCustom(title: 'Audio').customAppBar(context),
        body: GetBuilder<RasulAudioControllerImp>(
            builder: (controller) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: GridView.builder(
                    padding: const EdgeInsets.all(5),
                    itemCount: controller.dataAudioKey.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1, childAspectRatio: 3),
                    itemBuilder: (context, index) {
                      return InkwellCustom(
                        catigory: false,
                        dataText: controller.dataAudioKey[index],
                        onTap: () {
                          Get.to(AudioContainScreen(
                              dataText: controller.dataAudioTitle[index],
                              itemCount:
                                  controller.dataAudioTitle[index].length,
                              onTap: controller.dataAudioLink[index]));
                        },
                      );
                    }))));
  }
}
