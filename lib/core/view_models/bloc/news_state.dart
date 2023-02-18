part of 'news_bloc.dart';

abstract class NewsState extends Equatable {}

class LoadingNewsState extends NewsState {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FetchedNewsState extends NewsState {
  FetchedNewsState(this.news);
  final List<ArticleModel> news;

  @override
  List<Object?> get props => [news];
}

class ErrorNewsState extends NewsState {
  ErrorNewsState(this.error);
  final String error;

  @override
  List<Object?> get props => [error];
}
