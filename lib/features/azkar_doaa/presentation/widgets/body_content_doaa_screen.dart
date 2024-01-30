import 'package:elresala/core/constants/app_assets.dart';
import 'package:elresala/core/constants/app_colors.dart';
import 'package:elresala/features/azkar_doaa/presentation/controller/azkar_doaa_controller.dart';
import 'package:elresala/features/azkar_doaa/presentation/widgets/custom_copy_share_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BodyContentDoaaScreen extends GetView<AzkarDoaaController> {
  const BodyContentDoaaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List doaas = Get.arguments['data'];
    return Column(
      children: [
        SizedBox(
          height: Get.height * 0.6,
          child: PageView.builder(
            controller: controller.pageController,
            itemCount: doaas.length,
            onPageChanged: controller.onPageChanged,
            itemBuilder: (context, index) {
              var doaa = doaas[index];
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColors.transparent,
                        backgroundImage:
                            const AssetImage(AppAssets.kZaghrafaIcon),
                        child: Text((doaa.pageNumber).toString()),
                      ),
                      SizedBox(height: 20.h),
                      Container(
                        padding: EdgeInsets.all(10.sp),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.sp),
                          color: AppColors.kGreenColor,
                        ),
                        child: Text(
                          doaa.content[0].replaceAll(':', ''),
                          style: const TextStyle(
                            color: AppColors.kGoldenColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(height: 35.h),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: doaa.content.length,
                        itemBuilder: (BuildContext context, int index) {
                          var content = doaa.content[index];
                          return index != 0
                              ? Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.all(10.sp),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15.sp),
                                        color: AppColors.kGreenColor,
                                      ),
                                      child: Text(
                                        content,
                                        style: const TextStyle(
                                          color: AppColors.kGoldenColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 35.h),
                                    const CustomCopyShareWidget(),
                                    SizedBox(height: 35.h),
                                  ],
                                )
                              : const SizedBox.shrink();
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 80.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            navigateToPage(
              Icons.arrow_back_ios,
              controller.goToPreviousPage,
            ),
            SizedBox(width: 10.w),
            Container(
              padding: EdgeInsets.all(10.sp),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.sp),
                color: AppColors.kGreenColor,
              ),
              child: Row(
                children: [
                  Text(
                    doaas.length.toString(),
                    style: TextStyle(
                      color: AppColors.kGoldenColor,
                      fontSize: 20.sp,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    'of',
                    style: TextStyle(
                      fontSize: 20.sp,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Obx(
                    () => Text(
                      (controller.currentPage.value + 1).toString(),
                      style: TextStyle(
                        fontSize: 20.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10.w),
            navigateToPage(
              Icons.arrow_forward_ios,
              () => controller.goToNextPage(doaas),
            ),
          ],
        ),
      ],
    );
  }

  GestureDetector navigateToPage(IconData icon, Function() controllerFunction) {
    return GestureDetector(
      onTap: controllerFunction,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.sp),
          color: AppColors.kGreenColor,
        ),
        child: Icon(
          icon,
          color: AppColors.kGoldenColor,
        ),
      ),
    );
  }
}
