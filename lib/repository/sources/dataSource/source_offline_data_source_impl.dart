import 'package:hive/hive.dart';
import 'package:my_news_app/model/SourceResponse.dart';
import 'package:my_news_app/repository/sources/source_data_source.dart';

class SourceOfflineDataSourceImpl implements SourceOfflineDataSource {
  @override
  Future<SourceResponse?> getSources(String categoryId) async {
    var box = await Hive.openBox('tabs');
    var data = SourceResponse.fromJson(box.get(categoryId));

    /// map => object
    return data;
  }

  @override
  void saveSources(SourceResponse? sourceResponse, String category) async {
    var box = await Hive.openBox('tabs');
    await box.put(category, sourceResponse?.toJson());

    /// map
    await box.close();
  }
}
