import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ColumnTypeShimmer extends StatelessWidget {
  const ColumnTypeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    var hieght = MediaQuery.of(context).size.height * 1;
    var width = MediaQuery.of(context).size.width * 1;
    return Container(
      width: width,
      margin: EdgeInsets.only(bottom: 15),

      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 100,
            width: width / 2.5,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),

                Container(
                  width: width / 3,
                  height: 20,

                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: width / 3,
                  height: 20,

                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    CircleAvatar(radius: 15, child: Icon(Icons.account_circle)),
                    SizedBox(width: 10),
                    Flexible(
                      child: Container(
                        width: width / 4,
                        height: 20,

                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class RowTypeShimmer extends StatelessWidget {
  const RowTypeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    var width=MediaQuery.of(context).size.width*1;
    var hieght=MediaQuery.of(context).size.height*1;
    return Container(
      margin: EdgeInsets.only(right: 18),
      width: width,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
       // color: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: hieght/4,

            width: 350,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onSecondaryContainer,
              borderRadius: BorderRadius.circular(10),
            ),

          ),
          SizedBox(height: 10),

          Container(
              width: width/1.5,
              height: 20,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onSecondaryContainer,
                borderRadius: BorderRadius.circular(20)
              ),
              ),
          SizedBox(height: 10),
          Container(
            width: width/1.3,
            height: 20,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onSecondaryContainer,
                borderRadius: BorderRadius.circular(20)
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              CircleAvatar(

                backgroundColor: Theme.of(context).colorScheme.background,
                child: Icon(Icons.account_circle),
                radius: 20,
              ),
              SizedBox(width: 10),
              Container(
                width: width/2.5,
                height: 20,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onSecondaryContainer,
                    borderRadius: BorderRadius.circular(20)
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


class AppSimmer {
  static Widget rowSimmer() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.white,
        child: Row(
          children: List.generate(3, (index) => RowTypeShimmer()),
        ),
      ),


    );
  }
  static Widget columnSimmar() {
    return SingleChildScrollView(

      child: Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.white,
        child: Column(
          children: List.generate(3, (index) => ColumnTypeShimmer()),
        ),
      ),


    );
  }


}
