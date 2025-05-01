import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/data/services/news_services.dart';

import '../components/news_of_day_item.dart';
import '../components/simmar.dart';
import '../data/controller/api_controller.dart';

class ArticalView extends StatefulWidget {
  ArticalView({super.key});

  @override
  State<ArticalView> createState() => _ArticalViewState();
}

class _ArticalViewState extends State<ArticalView> {
  ApiController apiController = Get.put(ApiController());

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.all(18.0),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  suffixIcon: Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.amber,
                        ),

                        child: Icon(
                          Icons.search,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ),

                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  filled: true,

                  fillColor: Theme.of(context).colorScheme.onSurface,
                  hintText: 'Search Article here ....',
                  hintStyle: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                onChanged: (value) {
                  apiController.searchNews(value);
                },
              ),
            ),
            SizedBox(height: 20),

            Expanded(
              child: Obx(() {
                final filter = apiController.filterTeslaNewsList.toList();
                if (filter.isEmpty) {
                  return Center(
                    child: Text(
                      'No result found',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  );
                }
                if (apiController.filterTeslaNewsList.isEmpty) {
                  return AppSimmer.columnSimmar();
                }
                return ListView.builder(
                  itemCount: filter.length,
                  itemBuilder: (context, index) {
                    final element = filter.toList()[index];
                    return NewsDayItem(
                      title: element.title??'No title',
                      image:
                          element.urlToImage ??
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQoFRQjM-wM_nXMA03AGDXgJK3VeX7vtD3ctA&s',

                      author: element.author,
                      tag: 'General',
                      time: element.publishedAt.toString().substring(0, 18),
                      dec: element.description,
                      cont: element.content,
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
