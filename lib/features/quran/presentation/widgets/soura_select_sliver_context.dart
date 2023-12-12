import 'package:elresala/features/quran/presentation/widgets/opacity_container_text.dart';
import 'package:elresala/features/quran/presentation/widgets/soura_item.dart';
import 'package:flutter/material.dart';


import 'package:elresala/core/constants/app_colors.dart';
class SouraSelectSliver extends StatelessWidget {
  const SouraSelectSliver({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: const Size.fromHeight(kToolbarHeight).height,
              color:AppColors. kPrimaryColor,
              child: const Row(
                children: [
                  OpacityContainerText(text: 'Continue reading'),
                  OpacityContainerText(text: 'Saved'),
                ],
              ),
            ),
            Container(
              color:AppColors. kPrimaryColor,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)),
                    child: Container(
                      decoration: const BoxDecoration(
                        color:AppColors. kWhiteColor,
                        // borderRadius: BorderRadius.only(
                        //     topLeft: Radius.circular(100),
                        //     topRight: Radius.circular(100)),
                      ),
                      child: const Column(children: [
                        SizedBox(
                          height: 10,
                        ),
                        SouraItem(
                            souraNumber: 1,
                            souraName: 'souraName',
                            isSaved: true),
                        SouraItem(
                            souraNumber: 2,
                            souraName: 'souraName',
                            isSaved: false),
                        SouraItem(
                            souraNumber: 3,
                            souraName: 'souraName',
                            isSaved: false),
                        SouraItem(
                            souraNumber: 4,
                            souraName: 'souraName',
                            isSaved: false),
                        SouraItem(
                            souraNumber: 5,
                            souraName: 'souraName',
                            isSaved: false),
                        SouraItem(
                            souraNumber: 6,
                            souraName: 'souraName',
                            isSaved: false),
                        SouraItem(
                            souraNumber: 1,
                            souraName: 'souraName',
                            isSaved: false),
                        SouraItem(
                            souraNumber: 1,
                            souraName: 'souraName',
                            isSaved: true),
                        SouraItem(
                            souraNumber: 1,
                            souraName: 'souraName',
                            isSaved: true),
                        SouraItem(
                            souraNumber: 1,
                            souraName: 'souraName',
                            isSaved: true),
                        SouraItem(
                            souraNumber: 1,
                            souraName: 'souraName',
                            isSaved: true),
                        SouraItem(
                            souraNumber: 1,
                            souraName: 'souraName',
                            isSaved: true),
                        SouraItem(
                            souraNumber: 1,
                            souraName: 'souraName',
                            isSaved: true),
                        SouraItem(
                            souraNumber: 1,
                            souraName: 'souraName',
                            isSaved: true),
                        SouraItem(
                            souraNumber: 1,
                            souraName: 'souraName',
                            isSaved: true),
                        SouraItem(
                            souraNumber: 1,
                            souraName: 'souraName',
                            isSaved: true),
                        SouraItem(
                            souraNumber: 1,
                            souraName: 'souraName',
                            isSaved: true),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
