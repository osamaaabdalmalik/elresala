import 'package:elresala/core/constants/app_enums.dart';
import 'package:elresala/core/helpers/get_state_from_failure.dart';
import 'package:elresala/features/hadith/data/models/hadith_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

import '../../domain/usecases/get_hadithenc_hadithes_use_case.dart';
import '../../domain/usecases/get_sunnah_hadithes_use_case.dart';

class HadithController extends GetxController
    with GetSingleTickerProviderStateMixin {
  // Data
  SunnahHadithModel? sunnahHadithes;
  // List<Map> bookHadithes = [];

  HaditencHadithModel? hadithencHadithes;
  List<Map> categoryHadithes = [];

  // States
  StateType getSunnahHadithesState = StateType.init;
  StateType getHadithencHadithesState = StateType.init;

  // Primitive
  String validationMessage = '';

  // Tab Bar
  late TabController tabController;
  final List<Tab> tabs = <Tab>[
    const Tab(text: 'Sunnah'),
    const Tab(text: 'Hadithenc'),
  ];
  // final PageController pageController = PageController();
  // final RxInt currentPage = 0.obs;

  @override
  void onInit() async {
    Get.find<Logger>().i("Start onInit HadithController");
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    await getSunnahHadithes();
    await getHadithencHadithes();
    Get.find<Logger>().w("End onInit HadithController");
  }

  Future<void> getSunnahHadithes() async {
    Get.find<Logger>().i("Start `getHadithes` in |HadithController|");
    getSunnahHadithesState = StateType.loading;
    update();
    GetSunnahHadithesUseCase getSunnahHadithesUseCase =
        GetSunnahHadithesUseCase(Get.find());
    var result = await getSunnahHadithesUseCase();
    result.fold(
      (l) async {
        getSunnahHadithesState = getStateFromFailure(l);
        validationMessage = l.message;
        update();
        await Future.delayed(const Duration(milliseconds: 50));
        getSunnahHadithesState = StateType.init;
      },
      (r) {
        getSunnahHadithesState = StateType.success;
        sunnahHadithes = r;
        update();
      },
    );
    Get.find<Logger>()
        .w("End `getHadithes` in |HadithController| $getSunnahHadithesState");
  }

  List<String>? get getbookHadithesName {
    List<String>? bookHadithesName = [];
    sunnahHadithes?.sunnahHadithes.forEach(
      (key, value) {
        if (key == Get.arguments['title']) {
          value.forEach((key, value) {
            bookHadithesName.add(key);
          });
        }
      },
    );
    return bookHadithesName;
  }

  List<String>? getSunnahHadith(
    String bookName,
    String hadithName,
  ) {
    List<String>? hadith = [];
    sunnahHadithes?.sunnahHadithes.forEach(
      (key, value) {
        if (key == bookName) {
          value.forEach((key, value) {
            if (key == hadithName) {
              value.forEach((key, value) {
                hadith.add(value);
              });
            }
          });
        }
      },
    );
    return hadith;
  }

  Future<void> getHadithencHadithes() async {
    Get.find<Logger>().i("Start `getHadithes` in |HadithController|");
    getHadithencHadithesState = StateType.loading;
    update();
    GetHadithencHadithesUseCase getHadithencHadithesUseCase =
        GetHadithencHadithesUseCase(Get.find());
    var result = await getHadithencHadithesUseCase();
    result.fold(
      (l) async {
        getHadithencHadithesState = getStateFromFailure(l);
        validationMessage = l.message;
        update();
        await Future.delayed(const Duration(milliseconds: 50));
        getHadithencHadithesState = StateType.init;
      },
      (r) {
        getHadithencHadithesState = StateType.success;
        hadithencHadithes = r;
        update();
      },
    );
    Get.find<Logger>().w(
        "End `getHadithes` in |HadithController| $getHadithencHadithesState");
  }

  List<String>? get getCategorySubCategoriesName {
    List<String>? categorySubCategoryName = [];
    hadithencHadithes?.hadithencHadithes.forEach(
      (key, value) {
        if (key == Get.arguments['title']) {
          value.forEach((key, value) {
            categorySubCategoryName.add(key);
          });
        }
      },
    );
    return categorySubCategoryName;
  }

  List<String>? get getSubCategoryHadithesName {
    List<String>? subCategoryHadithesName = [];
    hadithencHadithes?.hadithencHadithes.forEach(
      (key, value) {
        if (key == Get.arguments['categoryName']) {
          value.forEach((key, value) {
            if (key == Get.arguments['title']) {
              value.forEach((key, value) {
                subCategoryHadithesName.add(key);
              });
            }
          });
        }
      },
    );
    return subCategoryHadithesName;
  }

  List<String>? getHadithencHadith(
    String categoryName,
    String subCategoryName,
    String hadithName,
  ) {
    List<String>? hadith = [];
    hadithencHadithes?.hadithencHadithes.forEach(
      (key, value) {
        if (key == categoryName) {
          value.forEach((key, value) {
            if (key == subCategoryName) {
              value.forEach((key, value) {
                if (key == hadithName) {
                  value.forEach((key, value) {
                    hadith.add(value);
                  });
                }
              });
            }
          });
        }
      },
    );
    return hadith;
  }
}
