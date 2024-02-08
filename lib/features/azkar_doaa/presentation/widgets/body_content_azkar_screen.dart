import 'package:elresala/core/constants/app_assets.dart';
import 'package:elresala/core/constants/app_colors.dart';
import 'package:elresala/features/azkar_doaa/data/models/azkar_model/zikr.dart';
import 'package:elresala/features/azkar_doaa/presentation/controller/azkar_doaa_controller.dart';
import 'package:elresala/features/azkar_doaa/presentation/widgets/custom_copy_share_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BodyContentAzkarScreen extends GetView<AzkarDoaaController> {
  const BodyContentAzkarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<ZikrModel> azkar = Get.arguments['data'];
    return Column(
      children: [
        SizedBox(
          height: Get.height * 0.5,
          child: PageView.builder(
            controller: controller.pageController,
            itemCount: azkar.length,
            onPageChanged: controller.onPageChanged,
            itemBuilder: (context, index) {
              ZikrModel zikr = azkar[index];
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColors.transparent,
                        backgroundImage:
                            const AssetImage(AppAssets.kZaghrafaIcon),
                        child: Text((index + 1).toString()),
                      ),
                      SizedBox(height: 20.h),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10.sp),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.sp),
                          color: AppColors.kGreenColor,
                        ),
                        child: Text(
                          zikr.arabic ?? "",
                          style: const TextStyle(
                            color: AppColors.kGoldenColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      const SizedBox(height: 35),
                      const CustomCopyShareWidget(),
                      const SizedBox(height: 35),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10.sp),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.sp),
                          color: AppColors.kGreenColor,
                        ),
                        child: Text(
                          zikr.espaniol ?? "",
                          style: const TextStyle(
                            color: AppColors.kGoldenColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(height: 35.h),
                      const CustomCopyShareWidget(),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 100.h),
        Container(
          width: Get.width,
          height: 50.sp,
          decoration: BoxDecoration(
            color: AppColors.kGoldenColor,
            borderRadius: BorderRadius.circular(15.sp),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                () => Text(
                  '${azkar[controller.currentPage.value].repeatNumber.toString()} / ',
                  style: const TextStyle(color: AppColors.black),
                ),
              ),
              const Text(
                "1",
                style: TextStyle(color: AppColors.white),
              ),
              const Icon(Icons.repeat, color: AppColors.black),
            ],
          ),
        ),
        SizedBox(height: 20.h),
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
                    azkar.length.toString(),
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
              () => controller.goToNextPage(azkar),
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
