import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_news_app/api/api_manager.dart';
import 'package:my_news_app/home/news/cubit/news_states.dart';
import 'package:my_news_app/repository/news/dataSource/news_remote_data_source.dart';
import 'package:my_news_app/repository/news/news_data_source.dart';
import 'package:my_news_app/repository/news/news_repository.dart';
import 'package:my_news_app/repository/news/repository/news_repository_impl.dart';

class NewsWidgetViewModel extends Cubit<NewsStates> {
  late NewsRepository newsRepository;
  late NewsRemoteDataSource remoteDataSource;
  late ApiManager apiManager;

  NewsWidgetViewModel() : super(NewsLoadingState()) {
    apiManager = ApiManager();
    remoteDataSource = NewsRemoteDataSourceImpl(apiManager: apiManager);
    newsRepository = NewsRepositoryImpl(remoteDataSource: remoteDataSource);
  }

  //todo: hold data - handle logic
  void getNewsBySourceId(String sourceId) async {
    try {
      emit(NewsLoadingState());
      var response = await newsRepository.getNewsBySourceId(sourceId);
      if (response?.status == 'error') {
        emit(NewsErrorState(errorMessage: response!.message!));
        return;
      }
      if (response?.status == 'ok') {
        emit(NewsSuccessState(newsList: response!.articles!));
        return;
      }
    } catch (e) {
      emit(NewsErrorState(errorMessage: e.toString()));
    }
  }
}
