import 'package:my_news_app/model/SourceResponse.dart';

/// interface
abstract class SourceRepository {
  Future<SourceResponse?> getSources(String categoryId);
}
