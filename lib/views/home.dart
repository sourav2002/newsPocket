import 'package:flutter/material.dart';
import 'package:news_task/components/article_card.dart';
import 'package:news_task/consts/color.dart';
import 'package:news_task/helper/news.dart';
import 'dart:developer';

import 'package:news_task/models/article_model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Article> newsList = [];



  void getNews() async {
    News newsClass = News();
    await newsClass.getArticles();
    newsList = newsClass.news;
  }

  @override
  void initState()  {
    getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: newsList.isEmpty ? const Text("list is empty", style: TextStyle(fontSize: 50),) : Container(
        margin: const EdgeInsets.only(left: 16, right: 16,top: 16),
        child: ListView.builder(
          itemCount: newsList.length,
          itemBuilder: (context, index) {
            return ArticleCard(
              newsList[index].title,
              newsList[index].description,
              newsList[index].urlToImage,
              newsList[index].sourceName,
            );
          },
        ),
      ),
    );
  }
}
