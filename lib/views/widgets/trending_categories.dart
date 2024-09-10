import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_wave/models/cat_model.dart';
import 'package:news_wave/utils/colors.dart';
import 'package:news_wave/views/screens/category_screen.dart';

class TrendingCategories extends StatelessWidget {
  const TrendingCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Trending Categories",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 10),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: categoryMap.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2.6,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (BuildContext context, int index) {
              String key = categoryMap.keys.elementAt(index);
              Map<String, dynamic> category = categoryMap[key];

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (_) => CategoryScreen(
                        title: category['name'],
                      ),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        category['name'],
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Icon(category['icon'], color: subTextColor)
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
