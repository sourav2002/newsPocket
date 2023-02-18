part of 'news_bloc.dart';

abstract class NewsEvent {}

class LoadNewsEvent extends NewsEvent {}

class FetchNewsEvent extends NewsEvent {}
