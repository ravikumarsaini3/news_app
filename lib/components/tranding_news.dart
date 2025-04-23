import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/view/news_details_view.dart';
import 'package:shimmer/shimmer.dart';

class HotestNewsItem extends StatelessWidget {
  final String title;
  final String image;
  final String tag;
  final String time;
  final String author;
  final String ? cont;
  final String? dec;

  const HotestNewsItem({super.key, required this.title, required this.image, required this.tag, required this.time, required this.author, this.dec, this.cont});

  @override
  Widget build(BuildContext context) {
    return InkWell(
         onTap: () => Get.to(NewsDetailsView(image: image, title: '$title',time: '$time',tag: '',author: '$author',dec: '$dec', cont: '$cont',)),
      child: Container(
        margin: EdgeInsets.only(right: 18),
        width: 250,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
        child: Column(
          children: [
            GestureDetector(

              child: Container(
                height: 180,
                width: 250,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
imageUrl:                     image,
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) {
                      return Center(child: Icon(Icons.error, color: Colors.red));
                    },
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: Colors.grey,
                      highlightColor: Colors.white,
                      child: Container(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(
                  '$tag',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Spacer(),
                Text(
                  '$time',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              '$title',
              maxLines: 2,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: 10),
            Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.background,
                    child: Icon(Icons.account_circle),
                    radius: 15,
                  ),
                  SizedBox(width: 10),
                  Flexible(child: Text('$author ',style: Theme.of(context).textTheme.bodyLarge,))
                ])
          ],
        ),
      ),
    );
  }
}
