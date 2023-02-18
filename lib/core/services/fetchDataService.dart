import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:news_task/core/models/article_model.dart';

import '../models/api_res_packet.dart';

class FetchDataService{
  String url =
      "https://newsapi.org/v2/top-headlines?country=in&apiKey=4966fddb340846f4a2ec45dcaca1ae28";
  FetchDataService();

  Future<ApiResPacket> getRequest()  async {
    print("get request method of news service called");
    ApiResPacket apiResPacket;
    Dio dio = Dio();
    try{
      Response response = await dio.get(url);
      // print("get respones from dio ===>${response} and ${response.data} and ${response.data.toString()} ");
      apiResPacket = returnResponse(response);
      print("api res packet is ==> ${apiResPacket} ");
      // print(response.data.toString());
      return apiResPacket;
    } catch (e){
      rethrow;
    }
  }


  ApiResPacket returnResponse(Response response){
    print("return response method called from fetch data service file");
    switch (response.statusCode) {
      case 200:
        print("get 200 from server checked");
        ApiResPacket resPacket =
        ApiResPacket.fromJson(response.data);
        print("res packet is ==> ${resPacket.toString()} ");
        return resPacket;
      default:
        print("default condition matched");
        return ApiResPacket(
            status: "Something went wrong",
            articles: [],
            totalResults: 0
        );
    }
  }
}