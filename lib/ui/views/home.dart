import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_task/core/repositories/news_repository.dart';
import 'package:news_task/core/view_models/bloc/news_bloc.dart';
import 'package:news_task/ui/widgets/article_card.dart';
import '../../core/consts/color.dart';

import 'package:news_task/core/models/article_model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsBloc(
        RepositoryProvider.of<NewsRepository>(context),
      )..add(FetchNewsEvent()),
      child: Scaffold(
        backgroundColor: AppColors.MAIN_SCREEN_BACKGROUND,
        appBar: AppBar(
            elevation: 0.0,
            backgroundColor: AppColors.APP_BAR_COLOR,
            title: const Center(
              child: Text(
                "HEADLINES",
                style: TextStyle(
                    letterSpacing: 3,
                    fontWeight: FontWeight.bold,
                    fontSize: 29,
                    color: Color(0xFFffffff)),
              ),
            )),
        body: BlocBuilder<NewsBloc, NewsState>(builder: (context, state) {
          if (state is LoadingNewsState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is FetchedNewsState) {
            List<ArticleModel> news = state.news;

            return ListView.builder(
              itemCount: news.length,
              itemBuilder: (context, index) {
                return ArticleCard(
                  news[index].title,
                  news[index].description,
                  news[index].urlToImage,
                  news[index].source,
                );
              },
            );
          }
          return const Center(
              child: Text(
            "List is Empty",
            style: TextStyle(
              fontSize: 30,
              color: Colors.red,
            ),
          ));
        }),
      ),
    );
  }
}
