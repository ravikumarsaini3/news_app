import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';import 'package:news/components/navigation_bar.dart';
import 'package:news/data/controller/page_controller.dart';

class Page2 extends StatelessWidget {
  Page2({super.key});
PageController2 pagecnt=Get.put(PageController2());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      floatingActionButton: NavigationBar2(),
      body:Obx(() => pagecnt.pages[pagecnt.index.value] ,)

    );
  }
}
