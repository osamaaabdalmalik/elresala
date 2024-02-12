import 'package:elresala/core/widgets/handle_states_widget.dart';
import 'package:elresala/features/muslim/presentation/Widget/custom_text_muslim.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../../../core/constants/app_colors.dart';
import '../controller/muslim_controller.dart';

class MuslimView extends GetView<MuslimController> {
  const MuslimView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kPrimaryColor,
        elevation: 0,
      ),
      body: GetBuilder<MuslimController>(
        builder: (controller) {
          bool isVedio = controller.namecourses[controller.number].values
                  .firstOrNull[0].lessons[controller.lisson_number].vedio ==
              null;
          return HandleStatesWidget(
              stateType: controller.getCoursesState,
              child: Container(
                height: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                color: AppColors.kPrimaryColor,
                child: SingleChildScrollView(
                  child:
                      Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
                    CustomTextMuslim(
                        text: controller
                            .namecourses[controller.number]
                            .values
                            .firstOrNull[0]
                            .lessons[controller.lisson_number]
                            .title,
                        istitle: true),
                    const SizedBox(
                      height: 10,
                    ),
                    /* controller
                        .namecourses[controller.number]
                        .values
                        .firstOrNull[0]
                        .lessons[controller.lisson_number]
                        .vedio==null? Container(  ):*/
                    Container(
                      height: 150,
                      width: double.infinity,
                      margin:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                      decoration: BoxDecoration(
                          color: AppColors.kGoldenColor,
                          borderRadius: BorderRadius.circular(20)),
                      child: controller.videocontroller.value.isInitialized
                          ? Stack(
                              children: [
                                VideoPlayer(controller.videocontroller),
                                Positioned(bottom: 0,left: 10,right: 10,
                                    child: Row(
                                  children: [
                                    Expanded(child: VideoProgressIndicator(
                                      controller.videocontroller
                                     ,padding: EdgeInsets.symmetric(vertical: 5)
                                      ,allowScrubbing: true,))
                                  ],
                                ))
                              ],
                            )
                          : Center(
                              child: CircularProgressIndicator(
                              color: AppColors.kPrimaryColor,
                            )),
                    ),
                    CustomTextMuslim(
                        text: controller
                            .namecourses[controller.number]
                            .values
                            .firstOrNull[0]
                            .lessons[controller.lisson_number]
                            .body,
                        istitle: false)
                  ]),
                ),
              ));
        },
      ),
    );
  }
}
