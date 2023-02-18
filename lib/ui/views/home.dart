import 'package:flutter/material.dart';
import 'package:news_task/ui/widgets/article_card.dart';
import '../../core/consts/color.dart';


import 'package:news_task/core/models/article_model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<ArticleModel> newsList = [];

  // void getNews() async {
  //   News newsClass = News();
  //   await newsClass.getArticles();
  //   newsList = newsClass.news;
  // }

  @override
  void initState()  {
    super.initState();
    // getNews();
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
                  color: Color(0xFFffffff)
              ),
            ),
          )),
      body: newsList.isEmpty ? const Text("List is Empty", style: TextStyle(fontSize: 30, color: Colors.red, ),) :
      Container(
        margin: const EdgeInsets.only(left: 16, right: 16,top: 16),
        child: ListView.builder(
          itemCount: newsList.length,
          itemBuilder: (context, index) {
            return ArticleCard(
              newsList[index].title,
              newsList[index].description,
              newsList[index].urlToImage,
              newsList[index].source,
            );
          },
        ),
      ),
    );
  }
}
