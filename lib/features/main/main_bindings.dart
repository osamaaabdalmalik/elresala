import 'package:get/get.dart';
import 'package:elresala/features/main/data/data_sources/main_remote_data_source.dart';
import 'package:elresala/features/main/data/repository/main_repo_impl.dart';
import 'package:elresala/features/main/domain/repository/main_repo.dart';
import 'package:elresala/features/main/domain/usecases/get_categories_as_pair_use_case.dart';
import 'package:elresala/features/main/presentation/controller/main_controller.dart';

class MainBindings extends Bindings {
  @override
  dependencies() async {
    Get.put<MainRemoteDataSource>(
      MainRemoteDataSourceImpl(apiService: Get.find()),
    );
    Get.put<MainRepo>(
      MainRepoImpl(mainRemoteDataSource: Get.find()),
    );

    Get.put(GetCategoriesAsPairUseCase(Get.find()));
    Get.put(MainController());
  }
}
