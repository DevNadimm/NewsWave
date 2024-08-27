import 'package:flutter/material.dart';
import 'package:news_wave/models/cat_model.dart';

class TrendingCategories extends StatelessWidget {
  const TrendingCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
            childAspectRatio: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (BuildContext context, int index) {
            String key = categoryMap.keys.elementAt(index);
            Map<String, dynamic> category = categoryMap[key];

            return Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: AssetImage(category['imagePath']),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      category['name'],
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
