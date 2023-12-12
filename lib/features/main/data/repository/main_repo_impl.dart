import 'package:elresala/features/main/data/data_sources/main_local_data_source.dart';
import 'package:elresala/features/main/data/data_sources/main_remote_data_source.dart';
import 'package:elresala/features/main/domain/repository/main_repo.dart';

class MainRepoImpl implements MainRepo {
  final MainRemoteDataSource mainRemoteDataSource;
  final MainLocalDataSource mainLocalDataSource;

  const MainRepoImpl({
    required this.mainRemoteDataSource,
    required this.mainLocalDataSource,
  });
}
