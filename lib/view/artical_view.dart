import 'package:flutter/material.dart';

import '../components/news_of_day_item.dart';

class ArticalView extends StatelessWidget {
  const ArticalView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextField(
                decoration: InputDecoration(
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.amber
                      ),

                        child: Icon(Icons.search,color: Theme.of(context).colorScheme.onPrimary,)),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20)),
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.onSurface,
                  hintText: 'Search Article ....',
                    hintStyle: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary
                    )
                ),
              ),
            ),
            SizedBox(height: 20,),
            NewsDayItem(
              title:
              'हसुप्रीम कोर्ट और बीजेपी नेताओं के बीच बढ़ते विवाद ने राजनीति में नई हलचल मचा दी है.',
              image:
              'https://www.newstak.in/_next/image?url=https%3A%2F%2Fcf-img-a-in.tosshub.com%2Flingo%2Fnwtak%2Fimages%2Fstory%2F202504%2F68070b8e66bc3-supreme-court-22224927-16x9.png&w=1920&q=75',
              author: 'Aaj Tak',
              tag: 'Politics',
              time: '51 min ago',
            ),
            NewsDayItem(
              title:
              'हसुप्रीम कोर्ट और बीजेपी नेताओं के बीच बढ़ते विवाद ने राजनीति में नई हलचल मचा दी है.',
              image:
              'https://www.newstak.in/_next/image?url=https%3A%2F%2Fcf-img-a-in.tosshub.com%2Flingo%2Fnwtak%2Fimages%2Fstory%2F202504%2F68070b8e66bc3-supreme-court-22224927-16x9.png&w=1920&q=75',
              author: 'Aaj Tak',
              tag: 'Politics',
              time: '51 min ago',
            ), NewsDayItem(
              title:
              'हसुप्रीम कोर्ट और बीजेपी नेताओं के बीच बढ़ते विवाद ने राजनीति में नई हलचल मचा दी है.',
              image:
              'https://www.newstak.in/_next/image?url=https%3A%2F%2Fcf-img-a-in.tosshub.com%2Flingo%2Fnwtak%2Fimages%2Fstory%2F202504%2F68070b8e66bc3-supreme-court-22224927-16x9.png&w=1920&q=75',
              author: 'Aaj Tak',
              tag: 'Politics',
              time: '51 min ago',
            ),
          ],
        ),
      ),
    );
  }
}
