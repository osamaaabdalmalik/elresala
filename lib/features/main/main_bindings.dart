import 'package:elresala/core/services/archive_service.dart';
import 'package:elresala/features/main/data/data_sources/main_local_data_source.dart';
import 'package:elresala/features/main/data/data_sources/main_remote_data_source.dart';
import 'package:elresala/features/main/data/repository/main_repo_impl.dart';
import 'package:elresala/features/main/domain/repository/main_repo.dart';
import 'package:elresala/features/main/presentation/controller/main_controller.dart';
import 'package:get/get.dart';

class MainBindings extends Bindings {
  @override
  dependencies() async {
    Get.put<MainRemoteDataSource>(
      MainRemoteDataSourceImpl(apiService: Get.find()),
    );
    Get.put<MainLocalDataSource>(
      MainLocalDataSourceImpl(pref: Get.find()),
    );
    Get.put<MainRepo>(
      MainRepoImpl(
        mainRemoteDataSource: Get.find(),
        mainLocalDataSource: Get.find(),
      ),
    );

    Get.put(MainController());
    Get.put(
      ArchiveService(sharedPreferencesService: Get.find()),
    );
  }
}
