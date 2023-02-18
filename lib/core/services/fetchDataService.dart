import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../models/api_res_packet.dart';

class FetchDataService{
  String url =
      "https://newsapi.org/v2/top-headlines?country=in&apiKey=4966fddb340846f4a2ec45dcaca1ae28";
  FetchDataService();

  Future<ApiResPacket> getRequest()  async {
    ApiResPacket apiResPacket;
    Dio dio = Dio();
    try{
      Response response = await dio.get(url);
      apiResPacket = returnResponse(response);
      print(response.data.toString());
      return apiResPacket;
    } catch (e){
      rethrow;
    }
  }


  ApiResPacket returnResponse(Response response){
    switch (response.statusCode) {
      case 200:
        ApiResPacket resPacket =
        ApiResPacket.fromJson(response.data);
        return resPacket;
      default:
        return ApiResPacket(
            status: "Something went wrong",
            articles: []
        );
    }
  }
}