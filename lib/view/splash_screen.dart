import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:news/view/home_view.dart';
import 'package:news/view/page.dart';

import '../data/controller/api_controller.dart';

class SplashScreen extends StatelessWidget {
   SplashScreen({super.key});
  ApiController newsServices = Get.put(ApiController());
  Future<dynamic> _pageLoad()async{
   await Future.wait<void>([


   newsServices.teslaNews(),
   newsServices.appletNews(),
    ] );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(future: _pageLoad(), builder:(context, snapshot) {
        if(snapshot.connectionState==ConnectionState.done){
          return Page2();
        }else{
          return Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('News App',style: Theme.of(context).textTheme.headlineLarge,),
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: LinearProgressIndicator(
                  color: Theme.of(context).colorScheme.onPrimary,
                  borderRadius: BorderRadius.circular(20),
                  minHeight:15,
                semanticsLabel: 'hello',
                  stopIndicatorColor: Colors.amber,







                ),
              ),
            ],
          ));
        }
      },)
    );
  }
}
