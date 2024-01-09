import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:elresala/core/constants/app_api_routes.dart';
import 'package:elresala/core/services/api_service.dart';
import 'package:elresala/features/main/data/models/pair_model.dart';

abstract class HadithRemoteDataSource {
  // TODO This is example
  Future<List<PairModel>> getCategoriesAsPair({required int repositoryId});
}

class HadithRemoteDataSourceImpl extends HadithRemoteDataSource {
  final ApiService apiService;

  HadithRemoteDataSourceImpl({required this.apiService});

  // TODO This is example
  @override
  Future<List<PairModel>> getCategoriesAsPair({required int repositoryId}) async {
    try {
      Get.find<Logger>().i("Start `getCategoriesAsPair` in |HadithRemoteDataSourceImpl|");

      Map<String, dynamic> mapData = await apiService.get(
        subUrl: AppApiRoutes.getCategoriesAsPair,
        parameters: {
          'repository_id': repositoryId.toString(),
        },
      );
      final List<PairModel> expenses = mapData['data']
          .map<PairModel>(
            (item) => PairModel.fromJson(item),
          )
          .toList();

      Get.find<Logger>().w("End `getCategoriesAsPair` in |HadithRemoteDataSourceImpl|");
      return Future.value(expenses);
    } catch (e) {
      Get.find<Logger>().e(
        "End `getCategoriesAsPair` in |HadithRemoteDataSourceImpl| Exception: ${e.runtimeType}",
      );
      rethrow;
    }
  }
}
