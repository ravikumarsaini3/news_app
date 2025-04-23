import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:news/components/navigation_bar.dart';
import 'package:news/components/news_of_day_item.dart';
import 'package:news/components/simmar.dart';
import 'package:news/components/tranding_news.dart';
import 'package:news/data/controller/api_controller.dart';
import 'package:shimmer/shimmer.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  ApiController newsServices = Get.put(ApiController());

  @override
  void initState() {
    // TODO: implement initState
    newsServices.fetchHotestNews();
    newsServices.fetchDailyNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(
              Icons.dashboard_customize,
              color: Theme
                  .of(context)
                  .colorScheme
                  .onPrimary,
            ),
            Spacer(),
            Text(
              'NEW SEEKERS',
              style: Theme
                  .of(context)
                  .textTheme
                  .headlineSmall,
            ),
            Spacer(),
            Icon(
              Icons.account_circle,
              color: Theme
                  .of(context)
                  .colorScheme
                  .onPrimary,
            ),
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'HottestNews',
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyLarge,
              ),
              Text(
                'see all',
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyMedium,
              ),
            ],
          ),
          SizedBox(height: 20),
          Obx(() {
            return newsServices.hotestNews.isEmpty
                ? Simmar.HotestSimmar()
                : SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children:
                newsServices.hotestNews
                    .map(
                      (e) =>
                      HotestNewsItem(
                        title: '${e.title}',
                        image:
                        '${e.urlToImage }',
                        author: '${e.author ?? 'Unknown'}',
                        tag: '',
                        time: e.publishedAt.toString().substring(2, 18),
                        dec: e.description ?? 'No description',
                        cont: e.content ?? 'No content',
                      ),
                )
                    .toList(),
              ),
            );
          }),

          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'News of the day',
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyLarge,
              ),
              Text(
                'see all',
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyMedium,
              ),
            ],
          ),
          SizedBox(height: 10),
              Obx(() {
                return SingleChildScrollView(
                  child: Column(
                    children: newsServices.dailyNews.map((element) =>
                        NewsDayItem(
                          title: element.title ?? 'No title',
                          image: element.urlToImage ?? 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.gettyimages.in%2Fphotos%2Fbreaking-news-newspaper&psig=AOvVaw190E6bxGMk7m4Y2wjxhpZY&ust=1745490183549000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCMji7OX37YwDFQAAAAAdAAAAABAE',
                          author: element.author ?? 'Unknown',
                          tag: 'General',
                          time: element.publishedAt.toString().substring(0,18),
                          dec: element.description ?? 'No description',
                          cont: element.content ?? 'No content',
                        ),
                    ).toList(),
                  ),
                );
              })

            ],
          ),
        ),
      ),
    );
  }


}
