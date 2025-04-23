import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:news/view/news_details_view.dart';
import 'package:shimmer/shimmer.dart';

class NewsDayItem extends StatelessWidget {
  final String title;
  final String image;
  final String tag;
  final String time;
  final String author;
  final String? dec;
  final String? cont;

  const NewsDayItem({
    super.key,
    required this.title,
    required this.image,
    required this.tag,
    required this.time,
    required this.author,
    this.dec,
    this.cont,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:
          () => Get.to(
            NewsDetailsView(
              image: image,
              title: '$title',
              author: '$author',
              tag: '',
              time: '$time',
              dec: '$dec',
              cont: '$cont',
            ),
          ),
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 15),

        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.onSurfaceVariant,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onSecondaryContainer,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  errorWidget: (context, url, error) {
                    return Center(child: Icon(Icons.error, color: Colors.red));
                  },
                  imageUrl: image,
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
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),

                  Text(
                    '$title',
                    maxLines: 2,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(height: 10),
                  Text(
                    '$time',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Theme.of(context).colorScheme.background,
                        radius: 15,child:Icon(Icons.account_circle) ,),
                      SizedBox(width: 10),
                      Flexible(
                        child: Text(
                          '$author',
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),


                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
