import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
                    color:
                    Theme.of(context).colorScheme.onSurfaceVariant,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      errorWidget: (context, url, error) {
                        return Center(child: Icon(Icons.error, color: Colors.red));
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
                SizedBox(height: 20),
                Text(
                  model.title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      model.publishedAt.toString().substring(0,15),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Spacer(),
                    Text(
                      model.author.toString(),
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
          SizedBox(height: 20),
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
