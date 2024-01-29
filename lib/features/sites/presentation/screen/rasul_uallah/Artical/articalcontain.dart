import 'package:elresala/core/constants/app_colors.dart';
import 'package:elresala/features/sites/presentation/controller/rasul_uallah/articalcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:elresala/features/sites/presentation/widget/artical_custom.dart';
import 'package:elresala/features/sites/presentation/widget/inkwell_custom.dart';

class ArticalContainPage extends StatelessWidget {
  final int itemCount;
  final List dataText;
  final List onTap;
  const ArticalContainPage(
      {super.key,
      required this.itemCount,
      required this.dataText,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    Get.put(ArticalControllerImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.kPrimaryColor,
        ),
        body: GetBuilder<ArticalControllerImp>(
            builder: ((controller) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: ListView.builder(
                    padding: const EdgeInsets.all(5),
                    itemCount: itemCount,
                    itemBuilder: (context, index) {
                      return InkwellCustom(
                        catigory: false,
                        dataText: dataText[index],
                        onTap: () {
                          Get.to(ArticalCustom(
                            dataText: onTap[index],
                          ));
                        },
                      );
                    })))));
  }
}
