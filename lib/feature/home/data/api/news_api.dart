import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/core/network/resulet_api.dart';
import 'package:news/feature/home/data/models/news_model.dart';


abstract class NewsApi {
  static Future<ResuletApi<NewsModel>> getNews() async {
    //https://newsapi.org/v2/everything?q=bitcoin&apiKey=4cd4fbcaab504103a0a227a9542bcd0c
    try {
      Uri url = Uri.https("newsapi.org", "/v2/everything", {
        'q': "bitcoin",
        'apiKey': "e1daf752de4b4a818d3f067fe06de7c1",
      });
      var respons = await http.get(url);
      if (respons.statusCode == 200 && respons.statusCode < 300) {
        String responsBody = respons.body;
        Map<String, dynamic> json = jsonDecode(responsBody);
        return Success<NewsModel>(NewsModel.fromJson(json));
      } else {
        return Error("Error on requst of Api");
      }
    } on Exception catch (e) {
      return Error<NewsModel>(e.toString());
    }
  }
}
