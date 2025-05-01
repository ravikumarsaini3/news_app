import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/config/theme.dart';
import 'package:news/data/controller/api_controller.dart';
import 'package:news/view/artical_view.dart';
import 'package:news/view/home_view.dart';
import 'package:news/view/news_details_view.dart';
import 'package:news/view/page.dart';
import 'package:news/view/profile_view.dart';
import 'package:news/view/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ApiController apiController = Get.put(ApiController());

      return Obx(
            () => GetMaterialApp(
              debugShowCheckedModeBanner: false,
            title: 'News Seekers',
            themeMode:apiController.themeMode,
            theme: lightTheme,
            darkTheme: darkTheme,
            home:SplashScreen()

            ),
      );
  }
}

