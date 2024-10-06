import 'package:my_news_app/api/api_manager.dart';
import 'package:my_news_app/model/SourceResponse.dart';
import 'package:my_news_app/repository/sources/source_data_source.dart';

class SourceRemoteDataSourceImpl implements SourceRemoteDataSource {
  ApiManager apiManager;

  SourceRemoteDataSourceImpl({required this.apiManager});

  @override
  Future<SourceResponse?> getSources(String categoryId) async {
    var response = await apiManager.getSources(categoryId);
    return response;
  }
}
