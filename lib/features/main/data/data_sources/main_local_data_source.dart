import 'dart:convert';

import 'package:elresala/core/constants/app_keys.dart';
import 'package:elresala/core/services/shared_preferences_service.dart';
import 'package:elresala/features/main/data/models/language_model.dart';
import 'package:elresala/features/main/domain/entities/language_entity.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class MainLocalDataSource {
  Future<List<Language>> getLanguages({required List<String> languagesAsListStrings});
}

class MainLocalDataSourceImpl extends MainLocalDataSource {
  final SharedPreferences pref;

  MainLocalDataSourceImpl({required this.pref});

  @override
  Future<List<Language>> getLanguages({required List<String> languagesAsListStrings}) async {
    try {
      Get.find<Logger>().i("Start `getLanguages` in |MainLocalDataSourceImpl|");
      List<Language> languages = [];
      String? languagesString = Get.find<SharedPreferencesService>().getData<String>(
        key: AppKeys.languages,
      );
      if (languagesString == null) {
        for (var language in languagesAsListStrings) {
          languages.add(Language(name: language, isDownloaded: false));
        }
      } else {
        languages = json
            .decode(languagesString)
            .map<LanguageModel>(
              (e) => LanguageModel.fromJson(e),
            )
            .toList();
        languages.removeWhere(
          (element) => !languagesAsListStrings.contains(element.name),
        );
        for (var element in languagesAsListStrings) {
          languages.addIf(
            !languages.any((e) => e.name == element),
            LanguageModel(
              name: element,
              isDownloaded: false,
            ),
          );
        }
      }
      Get.find<SharedPreferencesService>().setData(
        key: AppKeys.languages,
        value: languages
            .map(
              (e) => json.encode(e.toModel()),
            )
            .toList()
            .toString(),
      );
      Get.find<Logger>().w("End `getLanguages` in |MainLocalDataSourceImpl|");
      return languages;
    } catch (e, s) {
      Get.find<Logger>().e("End `getLanguages` in |MainLocalDataSourceImpl| Exception: $s");
      rethrow;
    }
  }
}
