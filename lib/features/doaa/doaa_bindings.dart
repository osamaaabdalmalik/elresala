import 'package:elresala/features/doaa/data/data_sources/doaa_local_data_source.dart';
import 'package:elresala/features/doaa/data/data_sources/doaa_remote_data_source.dart';
import 'package:elresala/features/doaa/data/repository/doaa_repo_impl.dart';
import 'package:elresala/features/doaa/domain/repository/doaa_repo.dart';
import 'package:elresala/features/doaa/presentation/controller/doaa_controller.dart';
import 'package:get/get.dart';

class DoaaBindings extends Bindings {
  @override
  dependencies() async {
    Get.put<DoaaRemoteDataSource>(
      DoaaRemoteDataSourceImpl(apiService: Get.find()),
    );
    Get.put<DoaaLocalDataSource>(
      DoaaLocalDataSourceImpl(
        sharedPreferencesService: Get.find(),
        archiveService: Get.find(),
      ),
    );
    Get.put<DoaaRepo>(
      DoaaRepoImpl(
        doaaLocalDataSource: Get.find(),
        doaaRemoteDataSource: Get.find(),
      ),
    );

    Get.put(DoaaController());
  }
}
