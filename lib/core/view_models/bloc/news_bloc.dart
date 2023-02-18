import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/article_model.dart';
import '../../repositories/news_repository.dart';
import '../../services/fetchDataService.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsRepository newsRepository;
  NewsBloc(this.newsRepository) : super(LoadingNewsState()) {
    on<FetchNewsEvent>((event, emit) async {
      emit(LoadingNewsState());
      try {
        var news = await newsRepository.getNews();
        emit(FetchedNewsState(news));
      } catch (e) {
        emit(ErrorNewsState(e.toString()));
      }
    });
  }
}
