import 'package:news_task/core/models/api_res_packet.dart';
import 'package:news_task/core/models/article_model.dart';
import 'package:news_task/core/services/fetchDataService.dart';

class NewsRepository {
  final FetchDataService _fetchDataService = FetchDataService();
  Future<List<ArticleModel>> getNews() async {
    print("get news method of news repo called");
    ApiResPacket data = await _fetchDataService.getRequest();
    // print(data);
    print("artile list length is =>  ${data.articles.length}");
    return data.articles;
  }
}
