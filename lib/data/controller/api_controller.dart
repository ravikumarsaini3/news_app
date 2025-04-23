import 'package:get/get.dart';
import 'package:news/data/services/news_services.dart';
import 'package:news/model/daily_news_model.dart';
import 'package:news/model/hotest_news_model.dart';

class ApiController extends GetxController {

  NewsServices newsServices = NewsServices();
  var hotestNews = <Article>[].obs;
  var dailyNews = <Article2>[].obs;

  fetchHotestNews() async {
    try {
      var data = await newsServices.fetchHotestNews();
      hotestNews.assignAll(data);
      print('object     bhjh$hotestNews.assignAll(data)');

    } catch (e) {
      print(e);
    }

  }
  fetchDailyNews() async {
    try {
      var data = await newsServices.fetchDailyNews();
      dailyNews.assignAll(data);
      print('object     bhjh$hotestNews.assignAll(data)');

    } catch (e) {
      print(e);
    }

  }
}
