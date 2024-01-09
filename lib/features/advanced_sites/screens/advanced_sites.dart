// ignore_for_file: camel_case_types, sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_colors.dart';
import '../widgets/custom_appBar.dart';
import '../widgets/custom_gridview.dart';
import '../widgets/item _card.dart';

class Advanced_Sites extends StatefulWidget {
  const Advanced_Sites({super.key});

  @override
  State<Advanced_Sites> createState() => _Advanced_SitesState();
}

class _Advanced_SitesState extends State<Advanced_Sites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: CustomScrollView(
        slivers: [
          const Custom_AppBar(
            title: 'Advanced Sites',
            isSearch: true,
            isPinned: true,
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                //
                Container(
                  padding: EdgeInsets.only(top: 10),
                  height: 80,
                  child: Item_GridView(),
                ),

                //
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Container(
                    height: Get.height,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: MediaQuery.of(context).size.height),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return const Item_Card();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
