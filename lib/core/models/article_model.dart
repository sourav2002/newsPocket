
class ArticleModel {
  ArticleModel({
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.source,
    required this.author,
    required this.publishedAt,
    required this.content,
  });

  String source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    print("article model class");
    DateTime dr = DateTime.parse(json["publishedAt"]);
    String date = '${dr.day}-${dr.month}-${dr.year}';
    return ArticleModel(
      source: json["source"]['name'] ?? "NA",
      author: json["author"] ?? "anonymous",
      title: json["title"] ?? "Title not available",
      description: json["description"] ?? "description not available",
      url: json["url"] ?? "NA",
      urlToImage: json["urlToImage"] ?? "https://images.unsplash.com/photo-1588681664899-f142ff2dc9b1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80",
      publishedAt: date,
      content: json["content"] ?? "content not available",
    );
  }
}