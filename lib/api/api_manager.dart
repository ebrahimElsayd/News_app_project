import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:my_news_app/api/api_constatnts.dart';
import 'package:my_news_app/model/NewsResponse.dart';
import 'package:my_news_app/model/SourceResponse.dart';

@singleton
class ApiManager {
  /*
  https://newsapi.org/v2/top-headlines/sources?apiKey=500c5a4f9b244f3db92a47f436f1819e
   */
  Future<SourceResponse?> getSources(String categoryId) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.sourcesApi,
        {'apiKey': '500c5a4f9b244f3db92a47f436f1819e', 'category': categoryId});
    var response = await http.get(url);
    try {
      var responseBody = response.body;

      /// String
      var json = jsonDecode(responseBody);

      /// json
      return SourceResponse.fromJson(json);

      /// object
    } catch (e) {
      throw e;
    }

    // SourceResponse.fromJson(jsonDecode(response.body));
  }

  /*
  https://newsapi.org/v2/everything?q=bitcoin&apiKey=500c5a4f9b244f3db92a47f436f1819e
   */
  Future<NewsResponse?> getNewsBySourceId(String sourceId) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.newsApi, {
      'apiKey': '500c5a4f9b244f3db92a47f436f1819e',
      'sources': sourceId,
    });
    var response = await http.get(url);
    try {
      return NewsResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw e;
    }
  }
}
