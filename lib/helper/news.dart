import 'package:news_task/models/article_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:developer';

class News {
  List<Article> news = [];

  Article demo = Article(
      "title of the article is abcv sourav ok and this",
      "description",
      "https://images.unsplash.com/photo-1661956603025-8310b2e3036d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80",
      "sourceName");

  Future<void> getArticles() async {
    String url =
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=4966fddb340846f4a2ec45dcaca1ae28";
    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    news.add(demo);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((articleData) {
        if (articleData['urlToImage'] != null &&
            articleData['description'] != null && articleData['title'] != null && articleData['source']['name'] != null) {
          Article article = Article(
              articleData['title'],
              articleData['description'],
              articleData['urlToImage'],
              articleData["source"]['name']);
          news.add(article);
        }
      });
    }
  }


}
