import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:news/components/navigation_bar.dart';
import 'package:news/components/news_of_day_item.dart';
import 'package:news/components/newstitle_row.dart';
import 'package:news/components/simmar.dart';
import 'package:news/components/tranding_news.dart';
import 'package:news/data/controller/api_controller.dart';
import 'package:news/view/news_details_view.dart';
import 'package:news/view/profile_view.dart';
import 'package:shimmer/shimmer.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  ApiController apiController = Get.put(ApiController());

  @override
  void initState() {
    // TODO: implement initState
    apiController.techCrunchtNews();
    apiController.businessNews();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('home');
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(
              Icons.dashboard_customize,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            Spacer(),
            Text(
              'NEW SEEKERS',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Spacer(),
            InkWell(
              onTap: () => Get.to(ProfileView()),
              child: Image.network(
                height: 40,
                width: 40,
                'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
              ),
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
              Obx(
                    () => NewsRow(
                  title: 'Business News',
                  onTap: apiController.toggleListbusinessNews,
                  isList: apiController.isBussiness.value,
                ),
              ),
              SizedBox(height: 20),
              Obx(() {
                return apiController.businessNewsList.isEmpty
                    ? AppSimmer.rowSimmer()
                    : SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children:
                    apiController.businessNewsList10
                        .map(
                          (e) => GestureDetector(
                        onTap:
                            () => Get.to(NewsDetailsView(model: e)),
                        child: HotestNewsItem(
                          title: '${e.title}',
                          image: '${e.urlToImage}',
                          author: '${e.author ?? 'Unknown'}',

                          time: e.publishedAt.toString().substring(
                            10,
                            18,
                          ),
                          dec: e.description ?? 'No description',
                          cont: e.content ?? 'No content',
                        ),
                      ),
                    )
                        .toList(),
                  ),
                );
              }),

              SizedBox(height: 20),
              Obx(
                () => NewsRow(
                  title: 'TechCrunch News',
                  onTap: apiController.toggleListTechCrunch,
                  isList: apiController.isTechCrunch.value,
                ),
              ),
              SizedBox(height: 20),
              Obx(() {
                return apiController.techCrunchNewsList.isEmpty
                    ? AppSimmer.rowSimmer()
                    : SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children:
                            apiController.techCrunchNewsList10
                                .map(
                                  (e) => GestureDetector(
                                    onTap:
                                        () => Get.to(NewsDetailsView(model: e)),
                                    child: HotestNewsItem(
                                      title: '${e.title}',
                                      image: '${e.urlToImage}',
                                      author: '${e.author ?? 'Unknown'}',

                                      time: e.publishedAt.toString().substring(
                                        10,
                                        18,
                                      ),
                                      dec: e.description ?? 'No description',
                                      cont: e.content ?? 'No content',
                                    ),
                                  ),
                                )
                                .toList(),
                      ),
                    );
              }),
              SizedBox(height: 20),

              Obx(
                    () => NewsRow(
                  title: 'Tesla News',
                  onTap: apiController.toggleTeslaNews,
                  isList: apiController.isTesla.value,
                ),
              ),
              SizedBox(height: 10),
              Obx(() {
                if (apiController.teslaNewsList.isEmpty) {
                  return AppSimmer.columnSimmar();
                }
                return SingleChildScrollView(
                  child: Column(
                    children:
                        apiController.teslaNewsList10
                            .map(
                              (element) => GestureDetector(
                                onTap: () => Get.to(NewsDetailsView(model: element)),
                                child: NewsDayItem(
                                  title: element.title,
                                  image:
                                      element.urlToImage ??
                                      'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.gettyimages.in%2Fphotos%2Fbreaking-news-newspaper&psig=AOvVaw190E6bxGMk7m4Y2wjxhpZY&ust=1745490183549000&source=images&cd=vfe&opi=89978449&ved=0CBQQjRxqFwoTCMji7OX37YwDFQAAAAAdAAAAABAE',
                                  author: element.author ?? 'Unknown',
                                  tag: 'General',
                                  time: element.publishedAt.toString().substring(
                                    10,
                                    18,
                                  ),
                                  dec: element.description ?? 'No description',
                                  cont: element.content ?? 'No content',
                                ),
                              ),
                            )
                            .toList(),
                  ),
                );
              }),

              SizedBox(height: 20),
        Obx(
              () => NewsRow(
            title: 'Apple News',
            onTap: apiController.toggleListAppleList,
            isList: apiController.isApple.value,
          ),
        ),
              Obx(() {
                return apiController.appleNewsList.isEmpty
                    ? AppSimmer.rowSimmer()
                    : SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children:
                            apiController.appleNewsList10
                                .map(
                                  (e) => GestureDetector(
                                    onTap:
                                        () => Get.to(NewsDetailsView(model: e)),
                                    child: HotestNewsItem(
                                      title: '${e.title}',
                                      image: '${e.urlToImage}',
                                      author: '${e.author ?? 'Unknown'}',

                                      time: e.publishedAt.toString().substring(
                                        12,
                                        18,
                                      ),
                                      dec: e.description ?? 'No description',
                                      cont: e.content ?? 'No content',
                                    ),
                                  ),
                                )
                                .toList(),
                      ),
                    );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
