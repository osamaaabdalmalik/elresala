import 'package:elresala/core/services/api_service.dart';

abstract class MainRemoteDataSource {}

class MainRemoteDataSourceImpl extends MainRemoteDataSource {
  final ApiService apiService;

  MainRemoteDataSourceImpl({required this.apiService});
}
