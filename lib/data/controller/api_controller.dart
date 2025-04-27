import 'package:get/get.dart';
import 'package:news/data/services/news_services.dart';

import 'package:news/model/hotest_news_model.dart';

class ApiController extends GetxController {
  NewsServices newsServices = NewsServices();

  var techCrunchNewsList = <Article>[].obs;
  var appleNewsList10 = <Article>[].obs;
  var appleNewsList = <Article>[].obs;
  var techCrunchNewsList10 = <Article>[].obs;
  var businessNewsList = <Article>[].obs;
  var businessNewsList10 = <Article>[].obs;

  var teslaNewsList = <Article>[].obs;
  var filterTeslaNewsList = <Article>[].obs;
  var teslaNewsList10 = <Article>[].obs;
  var isTechCrunch = false.obs;
  var isBussiness = false.obs;
  var isTesla = false.obs;
  var isApple = false.obs;
  var search = ''.obs;
  var isSearch = false.obs;

  void searchNews(String query) async {
    try {


      if (query.isEmpty) {
        filterTeslaNewsList.assignAll(teslaNewsList);
      } else {


        filterTeslaNewsList.assignAll(
          teslaNewsList
              .where((p) => p.title.toString().toLowerCase().contains(query))
              .toList(),
        );

      }
    } catch (e) {


      print(e);
    }
  }

  techCrunchtNews() async {
    try {
      var data = await newsServices.techCrunchNews();

      techCrunchNewsList.assignAll(data);
      techCrunchNewsList10.assignAll(data.take(5));
      print('data techCrunchNewsList  $data');
    } catch (e) {
      print(e);
    }
  }

  appletNews() async {
    try {
      var data = await newsServices.AppleNews();

      appleNewsList.assignAll(data.take(30));
      appleNewsList10.assignAll(data.take(5));
    } catch (e) {
      print(e);
    }
  }

  void toggleListAppleList() {
    isApple.value = !isApple.value;
    appleNewsList10.assignAll(
      isApple.value ? appleNewsList : appleNewsList.take(5),
    );
  }

  businessNews() async {
    try {
      var data = await newsServices.businessNews();

      businessNewsList.assignAll(data);
      businessNewsList10.assignAll(data.take(5));
    } catch (e) {
      print(e);
    }
  }

  void toggleListTechCrunch() {
    isTechCrunch.value = !isTechCrunch.value;
    techCrunchNewsList10.assignAll(
      isTechCrunch.value ? techCrunchNewsList : techCrunchNewsList.take(5),
    );
  }

  void toggleListbusinessNews() {
    isBussiness.value = !isBussiness.value;
    businessNewsList10.assignAll(
      isBussiness.value ? businessNewsList : businessNewsList.take(5),
    );
  }

  teslaNews() async {
    try {
      var data = await newsServices.teslaNews();
      teslaNewsList.assignAll(data);
      filterTeslaNewsList.assignAll(data);
      teslaNewsList10.assignAll(data.take(8));
    } catch (e) {
      print(e);
    }
  }

  void toggleTeslaNews() {
    isTesla.value = !isTesla.value;
    teslaNewsList10.assignAll(
      isTesla.value ? teslaNewsList : teslaNewsList.take(8),
    );
  }
}
