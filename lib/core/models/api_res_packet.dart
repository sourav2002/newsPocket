import 'article_model.dart';

class ApiResPacket {
  ApiResPacket({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  String status;
  int totalResults;
  List<ArticleModel> articles;

  factory ApiResPacket.fromJson(Map<String, dynamic> json) {
    print("Article result packet called ....api res packet");
    return ApiResPacket(
      status: json["status"],
      totalResults: json["totalResults"],
      articles:
      List<ArticleModel>.from(json["articles"].map((x) => ArticleModel.fromJson(x))),
    );
  }
}
