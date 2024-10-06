import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:my_news_app/model/SourceResponse.dart';
import 'package:my_news_app/repository/sources/source_data_source.dart';
import 'package:my_news_app/repository/sources/source_repository.dart';

class SourceRepositoryImpl implements SourceRepository {
  SourceRemoteDataSource remoteDataSource;
  SourceOfflineDataSource offlineDataSource;

  SourceRepositoryImpl(
      {required this.remoteDataSource, required this.offlineDataSource});

  @override
  Future<SourceResponse?> getSources(String categoryId) async {
    //todo: internet => remote
    var checkResult = await Connectivity().checkConnectivity();
    if (checkResult == ConnectivityResult.wifi ||
        checkResult == ConnectivityResult.mobile) {
      var sourceResponse = await remoteDataSource.getSources(categoryId);
      offlineDataSource.saveSources(sourceResponse, categoryId);
      return sourceResponse;
    } else {
      //todo: no internet => offline
      var sourceResponse = await offlineDataSource.getSources(categoryId);
      return sourceResponse;
    }
  }
}
