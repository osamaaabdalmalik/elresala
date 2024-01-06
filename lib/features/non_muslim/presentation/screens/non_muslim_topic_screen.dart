import 'package:elresala/core/constants/app_colors.dart';
import 'package:elresala/core/styles/text_styles.dart';
import 'package:elresala/core/utils/components/appbar/build_sliver_appbar.dart';
import 'package:elresala/features/non_muslim/data/models/course_model.dart';
import 'package:elresala/features/non_muslim/presentation/controller/non_muslim_controller.dart';
import 'package:elresala/features/non_muslim/presentation/screens/non_muslim_sub_topic_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NonMuslimTopicsScreen extends GetView<NonMuslimController> {
  final List<IslamTopic> topic;
  const NonMuslimTopicsScreen({super.key, required this.topic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: CustomScrollView(
        slivers: [
          const SliverAppBarWidget(
            isSearch: true,
            isPinned: true,
          ),
          SliverList.builder(
            itemCount: topic.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Get.to(
                    () => NonMuslimSubTopicsScreen(
                        topic: topic[index].nestedTopics),
                    transition: Transition.cupertino,
                  );
                },
                child: Card(
                  color: AppColors.kGreenColor,
                  child: ListTile(
                    leading: const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: VerticalDivider(
                        thickness: 2,
                        color: AppColors.white,
                      ),
                    ),
                    title: Text(
                      topic[index].header,
                      style: Styles.textStyle18Godlen,
                    ),
                    subtitle: Text(
                      topic[index].nestedTopics.first.title,
                      style: const TextStyle(color: Colors.white),
                    ),
                    trailing: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.info,
                          color: AppColors.white,
                        ),
                        Container(
                          width: 10,
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.white,
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
