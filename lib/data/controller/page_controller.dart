import 'package:get/get.dart';
import 'package:news/view/artical_view.dart';
import 'package:news/view/home_view.dart';
import 'package:news/view/profile_view.dart';
import 'package:news/view/splash_screen.dart';

class PageController2 extends GetxController{
  Rx<int>index=0.obs;


  List pages=[
   // SplashScreen(),
    HomeView(),
  ArticalView(),
  ProfileView(),
  ];




}