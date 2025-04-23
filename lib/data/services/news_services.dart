import 'package:http/http.dart' as http;
import 'package:news/config/app_url.dart';
import 'package:news/model/daily_news_model.dart';
import 'dart:convert';

import 'package:news/model/hotest_news_model.dart';

class NewsServices {
  Future<List<Article>> fetchHotestNews() async {
    final responce = await http.get(Uri.parse(AppUrl.hotestNews));
    if (responce.statusCode == 200) {
      var data = jsonDecode(responce.body);
      print('data $data');
      final hotNews = HotestNewsModel.fromJson(data);
      print(hotNews);
      print('hotest news article ${hotNews.articles}');
      return hotNews.articles;
    }
    return throw Exception('Error');
  }

  Future<List<Article2>> fetchDailyNews() async {

    final responce = await http.get(Uri.parse(AppUrl.newsDay));
    if (responce.statusCode == 200) {
      var data = jsonDecode(responce.body);
      print('data $data');
      final dailyNews = DailyNewsModel.fromJson(data);

      return dailyNews.articles;
    }
    return throw Exception('Error');
  }
}
