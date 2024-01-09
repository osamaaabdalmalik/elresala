import 'dart:convert';

import 'package:elresala/core/constants/app_enums.dart';
import 'package:elresala/core/constants/app_keys.dart';
import 'package:elresala/core/constants/app_pages_routes.dart';
import 'package:elresala/core/helpers/get_state_from_failure.dart';
import 'package:elresala/core/services/shared_preferences_service.dart';
import 'package:elresala/core/widgets/primary_dialog.dart';
import 'package:elresala/features/main/data/models/language_model.dart';
import 'package:elresala/features/main/domain/entities/language_entity.dart';
import 'package:elresala/features/main/domain/usecases/download_files_use_case.dart';
import 'package:elresala/features/main/domain/usecases/get_languages_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class LanguagesController extends GetxController {
  // Data
  List<Language> languages = [];
  Language? selectedLanguage;

  // States
  StateType getLanguagesState = StateType.init;
  StateType downloadLanguagesState = StateType.init;

  // primitive
  String validationMessage = '';
  List<int> totalFilesList = [];
  List<int> downloadedFilesList = [];
  List<double> progressList = [];
  int totalFiles = 0, downloadedFiles = 0;
  double progress = 0;

  @override
  void onInit() async {
    Get.find<Logger>().i("Start  onInit MainController");
    super.onInit();
    await getLanguages();
    Get.find<Logger>().w("End onInit MainController");
  }

  Future<void> getLanguages() async {
    Get.find<Logger>().i("Start `getLanguages` in |MainController|");
    getLanguagesState = StateType.loading;
    update();
    String? language = Get.find<SharedPreferencesService>().getData<String>(
      key: AppKeys.currentLanguage,
    );
    if (language != null) {
      selectedLanguage = Language(name: language, isDownloaded: true);
    }
    GetLanguagesUseCase getLanguagesUseCase = GetLanguagesUseCase(Get.find());
    var result = await getLanguagesUseCase();
    result.fold((l) async {
      getLanguagesState = getStateFromFailure(l);
      validationMessage = l.message;
      update();
      await Future.delayed(const Duration(milliseconds: 50));
      getLanguagesState = StateType.init;
    }, (r) {
      getLanguagesState = StateType.success;
      languages = r;
      for (int i = 0; i < languages.length; i++) {
        totalFilesList.add(0);
        downloadedFilesList.add(0);
        progressList.add(0);
      }
      update();
    });
    Get.find<Logger>().w("End `getLanguages` in |MainController|");
  }

  Future<void> downloadFiles({required int index}) async {
    Get.find<Logger>().i("Start `downloadFiles` in |MainController|");
    downloadLanguagesState = StateType.loading;
    update();
    DownloadFilesUseCase downloadFilesUseCase = DownloadFilesUseCase(Get.find());
    var result = await downloadFilesUseCase(
      language: languages[index].name,
      onProgressFile: (progress) {
        progressList[index] = progress;
        update();
      },
      onProgressFiles: (totalFiles, downloadedFiles) {
        totalFilesList[index] = totalFiles;
        downloadedFilesList[index] = downloadedFiles;
        update();
      },
    );
    result.fold((l) {
      downloadLanguagesState = getStateFromFailure(l);
      update();
    }, (r) async {
      downloadLanguagesState = StateType.success;
      update();
      if (selectedLanguage == null) {
        Get.find<SharedPreferencesService>().setData(
          key: AppKeys.currentLanguage,
          value: languages[index].name,
        );
        selectedLanguage = languages[index];
      }
      languages[index] = LanguageModel(
        name: languages[index].name,
        isDownloaded: true,
      );
      Get.find<SharedPreferencesService>().setData(
        key: AppKeys.languages,
        value: languages.map((e) => json.encode(e.toModel())).toList().toString(),
      );
    });
    if (Get.previousRoute != AppPagesRoutes.mainScreen) {
      Get.offNamed(AppPagesRoutes.mainScreen);
    }
    Get.find<Logger>().w("End `downloadFiles` in |MainController|");
  }

  Future<void> showMakeLangAsDefaultDialog({required int index}) async {
    if (!languages[index].isDownloaded ||
        (selectedLanguage != null && languages[index].name == selectedLanguage!.name)) {
      return;
    }
    Get.dialog(
      PrimaryDialog(
        title: "Default Language",
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Do you make ${languages[index].name} default language for app content",
              textAlign: TextAlign.center,
            ),
          ),
        ],
        btnOkOnPress: () {
          Get.find<SharedPreferencesService>().setData(
            key: AppKeys.currentLanguage,
            value: languages[index].name,
          );
          selectedLanguage = languages[index];
          update();
          Get.back();
        },
      ),
    );
  }
}
