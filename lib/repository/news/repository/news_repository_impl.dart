import 'package:my_news_app/model/NewsResponse.dart';
import 'package:my_news_app/repository/news/news_data_source.dart';
import 'package:my_news_app/repository/news/news_repository.dart';

class NewsRepositoryImpl implements NewsRepository {
  NewsRemoteDataSource remoteDataSource;

  NewsRepositoryImpl({required this.remoteDataSource});

  @override
  Future<NewsResponse?> getNewsBySourceId(String sourceId) {
    return remoteDataSource.getNewsBySourceId(sourceId);
  }
}
