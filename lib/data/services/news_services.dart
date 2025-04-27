import 'package:http/http.dart' as http;
import 'package:news/config/app_url.dart';

import 'dart:convert';

import 'package:news/model/hotest_news_model.dart';

class NewsServices {
  Future<List<Article>> techCrunchNews() async {
    try {
      final responce = await http.get(Uri.parse(AppUrl.TechCrunch));
      if (responce.statusCode == 200) {
        var data = jsonDecode(responce.body);
        print('data $data');
        final hotNews = HotestNewsModel.fromJson(data);
        print(hotNews);
        print('hotest news article ${hotNews.articles}');

        return hotNews.articles;
      }

    }catch(e){
      print(e);
    }

    return throw Exception('tech Error');
  }

  Future<List<Article>> businessNews() async {
    try {
      final responce = await http.get(Uri.parse(AppUrl.businessNews));
      if (responce.statusCode == 200) {
        var data = jsonDecode(responce.body);
        print('data $data');
        final hotNews = HotestNewsModel.fromJson(data);

        return hotNews.articles;
      }

    }
    catch(e){
      print(e);
    }

    return throw Exception('business Error');
  }

  Future<List<Article>> teslaNews() async {
    try {
      final responce = await http.get(Uri.parse(AppUrl.teslaNews));
      if (responce.statusCode == 200) {
        var data = jsonDecode(responce.body);
        print('data $data');
        final dailyNews = HotestNewsModel.fromJson(data);

        return dailyNews.articles;
      }

    }catch(e){
      print(e);
    }

    return throw Exception(' tesla Error');
  }



  Future<List<Article>>  AppleNews() async {
    try {
      final responce = await http.get(Uri.parse(AppUrl.AppleNews));
      if (responce.statusCode == 200) {
        var data = jsonDecode(responce.body);
        print('data $data');
        final dailyNews = HotestNewsModel.fromJson(data);

        return dailyNews.articles;
      }

    }
    catch(e){
      print(e);
    }

    return throw Exception('Error');
  }
}



