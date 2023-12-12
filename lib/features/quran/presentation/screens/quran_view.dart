
import 'package:elresala/core/utils/components/appbar/build_sliver_appbar.dart';
import 'package:elresala/features/quran/presentation/widgets/quran_view_build_sliver_content.dart';
import 'package:elresala/features/quran/presentation/widgets/telawa_widget.dart';
import 'package:flutter/material.dart';
import 'package:elresala/core/constants/app_colors.dart';

class QuranView extends StatelessWidget {
  const QuranView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverAppBarWidget(
                    isSearch: false,
                    backgroundColor: AppColors.kWhiteColor,
                    iconColor: AppColors.kPrimaryColor),
                QuranViewSliver(),
              ],
            ),
          ),
          SizedBox(height: .1),
          TelawaWidget(),
        ],
      ),
    );
  }
}
