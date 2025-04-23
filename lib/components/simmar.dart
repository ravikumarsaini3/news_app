import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Simmar {
  static Widget HotestSimmar() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,

      child: Row(
        children: List.generate(3, (index) => shimmerPlaceholder()),
      ),
    );
  }

 static Widget shimmerPlaceholder() {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Shimmer.fromColors(
        baseColor: Colors.black26,
        highlightColor: Colors.grey.shade100,
        child: Row(
          children: [

            Container(
              width: 100,
              height: 200,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(12),
              ),

            ),




          ],
        ),
      ),
    );
  }
}