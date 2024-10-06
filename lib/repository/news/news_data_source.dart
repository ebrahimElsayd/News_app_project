import 'package:my_news_app/model/NewsResponse.dart';

abstract class NewsRemoteDataSource {
  Future<NewsResponse?> getNewsBySourceId(String sourceId);
}

abstract class NewsOfflineDataSource {}
