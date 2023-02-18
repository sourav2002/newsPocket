import 'article_model.dart';

class ApiResPacket {
  String status;
  List<ArticleModel> articles;

  ApiResPacket({
    required this.status,
    required this.articles,
  });

  factory ApiResPacket.fromJson(Map<String, dynamic> json) {
    return ApiResPacket(
      status: json["status"],
      articles: List<ArticleModel>.from(
          json["articles"].map((x) => ArticleModel.fromJson(x))),
    );
  }
}
