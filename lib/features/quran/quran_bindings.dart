import 'package:elresala/features/quran/data/data_sources/quran_local_data_source.dart';
import 'package:elresala/features/quran/data/data_sources/quran_remote_data_source.dart';
import 'package:elresala/features/quran/data/repository/quran_repo_impl.dart';
import 'package:elresala/features/quran/domain/repository/quran_repo.dart';
import 'package:elresala/features/quran/presentation/controller/quran_controller.dart';
import 'package:get/get.dart';

class QuranBindings extends Bindings {
  @override
  dependencies() async {
    Get.put<QuranRemoteDataSource>(
      QuranRemoteDataSourceImpl(apiService: Get.find()),
    );
    Get.put<QuranLocalDataSource>(
      QuranLocalDataSourceImpl(
        sharedPreferencesService: Get.find(),
        archiveService: Get.find(),
      ),
    );
    Get.put<QuranRepo>(
      QuranRepoImpl(
        quranRemoteDataSource: Get.find(),
        quranLocalDataSource: Get.find(),
      ),
    );

    Get.put(QuranController());
  }
}
