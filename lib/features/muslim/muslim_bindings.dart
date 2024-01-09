import 'package:elresala/features/muslim/data/data_sources/muslim_local_data_source.dart';
import 'package:elresala/features/muslim/data/data_sources/muslim_remote_data_source.dart';
import 'package:elresala/features/muslim/data/repository/muslim_repo_impl.dart';
import 'package:elresala/features/muslim/domain/repository/muslim_repo.dart';
import 'package:elresala/features/muslim/presentation/controller/muslim_controller.dart';
import 'package:get/get.dart';

class MuslimBindings extends Bindings {
  @override
  dependencies() async {
    Get.put<MuslimRemoteDataSource>(
      MuslimRemoteDataSourceImpl(apiService: Get.find()),
    );
    Get.put<MuslimLocalDataSource>(
      MuslimLocalDataSourceImpl(
        sharedPreferencesService: Get.find(),
        firebaseStorageService: Get.find(),
      ),
    );
    Get.put<MuslimRepo>(
      MuslimRepoImpl(
        muslimLocalDataSource: Get.find(),
        muslimRemoteDataSource: Get.find(),
      ),
    );

    Get.put(MuslimController());
  }
}
