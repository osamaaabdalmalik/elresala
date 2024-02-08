import 'package:elresala/core/constants/app_keys.dart';
import 'package:elresala/core/services/archive_service.dart';
import 'package:elresala/core/services/shared_preferences_service.dart';
import 'package:elresala/features/muslim/data/models/course_model.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

abstract class MuslimLocalDataSource {
  Future<List<MuslimModel>> getCourses();
}

class MuslimLocalDataSourceImpl extends MuslimLocalDataSource {
  final SharedPreferencesService sharedPreferencesService;
  final ArchiveService archiveService;

  MuslimLocalDataSourceImpl({
    required this.sharedPreferencesService,
    required this.archiveService,
  });

  @override
  Future<List<MuslimModel>> getCourses() async {
    try {
      Get.find<Logger>().i("Start `getCourses` in |MuslimLocalDataSourceImpl|");
      String? muslimJson= await archiveService.readFile(name: AppKeys.newmuslim_quran);
       List<MuslimModel> courses = [];

      if (muslimJson != null) {
         var jsonData = json.decode(muslimJson);
         print(jsonData);
         courses = jsonData["courses"]
             .map<MuslimModel>(
               (surah) => MuslimModel.fromJson(surah),
             )
             .toList();
       }
      Get.find<Logger>().w("End `getCourses` in |MuslimLocalDataSourceImpl| ");
      return Future.value(courses);
    } catch (e,s) {
      Get.find<Logger>().e(
        "End `getCourses` in |MuslimLocalDataSourceImpl| Exception: ${e.runtimeType} $s",
      );
      rethrow;
    }
  }
}
