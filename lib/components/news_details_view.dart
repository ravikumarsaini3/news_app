import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
import 'package:news/data/controller/api_controller.dart';
import 'package:news/model/hotest_news_model.dart';
import 'package:shimmer/shimmer.dart';

class NewsDetailsViewItem extends StatelessWidget {
  // final String title;
  // final String image;
  // final String tag;
  // final String time;
  // final String author;
  // final String? dec;
  // final String? cont;
  final Article model;

  NewsDetailsViewItem({super.key, required this.model});

  // const NewsDetailsViewItem({super.key, required this.title, required this.image, required this.tag, required this.time, required this.author, this.dec,  this.cont});
ApiController apiController=Get.put(ApiController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(
                context,
              ).colorScheme.onSurfaceVariant.withOpacity(1.0),
            ),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Hero(
                      tag: 'image',
                      child: CachedNetworkImage(
                        errorWidget: (context, url, error) {
                          return Center(
                            child: Icon(Icons.error, color: Colors.red),
                          );
                        },
                        imageUrl: model.urlToImage!,
                        height: 300,
                        fit: BoxFit.fill,

                        placeholder:
                            (context, url) => Shimmer.fromColors(
                              baseColor: Colors.grey,
                              highlightColor: Colors.white,
                              child: Container(color: Colors.grey),
                            ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  model.title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      model.publishedAt.toString().substring(0, 15),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Spacer(),
                    Text(
                      model.author.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              model.content.toString(),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          SizedBox(height: 10),
          Text('Click to listen',textAlign: TextAlign.start, style: Theme.of(context).textTheme.titleLarge),
          SizedBox(height: 10),
          Container(
            width: 300,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Obx(
                ()=> Row(
                  children: [
                    InkWell(
                      onTap: () {
                        if(apiController.isSpeak.value){
                          apiController.pause();
                        }
                        else{
                          apiController.speak(model.description.toString());
                        }

                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Icon(
                          apiController.isSpeak.value? Icons.pause :
                          Icons.play_arrow,
                          size: 40,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Lottie.asset(
                        'assets/voice_animation/voice3.json',

                         fit: BoxFit.fill,
                     //   reverse: true,
                        animate: apiController.isSpeak.value,
                        addRepaintBoundary: true,
                        backgroundLoading: true,
                        repeat: true
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Visibility(
                          visible: apiController.isSpeak.value,
                          child: InkWell(
                              onTap: () => apiController.stop(),child: Icon(Icons.stop_circle_outlined,size: 30,color: Theme.of(context).colorScheme.onPrimary,)),),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              model.description.toString(),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }
}
