import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:news/model/hotest_news_model.dart';

import '../components/news_details_view.dart';

class NewsDetailsView extends StatelessWidget {

  // final String title;
  // final String image;
  // final String tag;
  // final String time;
  // final String author;
  // final String? dec;
  // final String? cont;
  Article model;
  NewsDetailsView({required this.model});

  // const NewsDetailsView({super.key, required this.image, required this.title, required this.tag, required this.time, required this.author, this.dec, this.cont});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  padding: EdgeInsets.all(4),

                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).colorScheme.onSurface,
                    border: Border.all(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                  margin: EdgeInsets.only(left: 10, top: 20),
                  // height: 40,
                  // width: 40,
                  child: Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ),
              SizedBox(height: 20),


              SizedBox(),
              NewsDetailsViewItem(model: model),
              // NewsDetailsViewItem(title: '$title',image: '$image',time: '$time',tag: '',author: '$author',dec: '$dec',cont: '$cont',)

            ],
          ),
        ),
      ),
    );
  }
}
