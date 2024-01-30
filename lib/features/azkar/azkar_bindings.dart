import 'package:elresala/features/azkar/data/data_sources/azkar_local_data_source.dart';
import 'package:elresala/features/azkar/data/data_sources/azkar_remote_data_source.dart';
import 'package:elresala/features/azkar/data/repository/azkar_repo_impl.dart';
import 'package:elresala/features/azkar/domain/repository/azkar_repo.dart';
import 'package:elresala/features/azkar/presentation/controller/azkar_controller.dart';
import 'package:get/get.dart';

class AzkarBindings extends Bindings {
  @override
  dependencies() async {
    Get.put<AzkarRemoteDataSource>(
      AzkarRemoteDataSourceImpl(apiService: Get.find()),
    );
    Get.put<AzkarLocalDataSource>(
      AzkarLocalDataSourceImpl(
        sharedPreferencesService: Get.find(),
        archiveService: Get.find(),
      ),
    );
    Get.put<AzkarRepo>(
      AzkarRepoImpl(
        azkarLocalDataSource: Get.find(),
        azkarRemoteDataSource: Get.find(),
      ),
    );

    Get.put(AzkarController());
  }
}
