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
  final String? cont;
  final String? dec;

  const HotestNewsItem({
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
    var width = MediaQuery.of(context).size.width * 1;
    var hieght = MediaQuery.of(context).size.height * 1;
    return Container(
      margin: EdgeInsets.only(right: 18),
      width: width/1.4,
      height: hieght/2.1,

      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.onSurface,
      ),
      child: Column(
        children: [
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Container(
                padding: EdgeInsets.all(4),
                height: hieght/4,

                width: width/1.4,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onSecondary,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Hero(
                  tag: 'image',
                    child: CachedNetworkImage(
                      imageUrl:image,
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) {
                        return Center(
                          child: Icon(Icons.error, color: Colors.red),
                        );
                      },
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
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Published', style: Theme.of(context).textTheme.bodyMedium),
              Spacer(),
              Text(time, style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
          SizedBox(height: 10),
          Text(
            title,
            maxLines: 2,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(height: 10),
          Row(
            children: [
              CircleAvatar(

                backgroundColor: Theme.of(context).colorScheme.primary,
                child:Text(title[0],style: TextStyle(color: Colors.white),),


                radius: 15,
              ),
              SizedBox(width: 10),
              Flexible(
                child: Text(
                  overflow: TextOverflow.ellipsis,

                  '$author ',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
