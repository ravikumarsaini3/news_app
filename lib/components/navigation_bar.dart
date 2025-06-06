import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/controller/page_controller.dart';

class NavigationBar2 extends StatelessWidget {
  NavigationBar2({super.key});

  final PageController2 pageController = Get.put(PageController2());

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(4),
          width: 230,
          color: Theme.of(context).colorScheme.onSurface,
          child: Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 40,

                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        pageController.index.value == 0 ? Colors.amber : null,
                  ),
                  child: Center(
                    child: IconButton(
                      icon: Center(
                        child: Icon(
                          Icons.home,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                      onPressed: () {
                        pageController.index.value = 0;
                      },
                    ),
                  ),
                ),
                Container(
                  height: 40,

                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                    pageController.index.value == 1 ? Colors.amber : null,
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.description,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    onPressed: () {
                      pageController.index.value = 1;

                    },
                  ),
                ),
                Container(
                  height: 40,

                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                    pageController.index.value == 2 ? Colors.amber : null,
                  ),

                  child: IconButton(
                    icon: Icon(
                      Icons.person,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    onPressed: () {
                      pageController.index.value = 2;
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
