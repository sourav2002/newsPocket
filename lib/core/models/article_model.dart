import 'dart:convert';

class ArticleModel {
   String title;
   String description;
   String urlToImage;
   String source;
   String publishedAt;
   String content;


   ArticleModel({required this.title, required this.description,
   required this.urlToImage, required this.source,
   required this.publishedAt, required this.content});

  factory ArticleModel.fromJson(Map<String, dynamic> json){

    DateTime dateTime = DateTime.parse(json["publishedAt"]);
    String date ='${dateTime.year}-${dateTime.month}-${dateTime.day}';

    return ArticleModel(
      title: json['title'],
      description: json['description'],
      urlToImage: json['urlToImage'],
      source: json['source']['name'], publishedAt: date,
      content: json['content']
    );
  }

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'urlToImage': urlToImage,
      'sourceName': source
    };
  }
}
