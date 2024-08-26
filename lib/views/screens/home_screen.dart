import 'package:flutter/material.dart';
import 'package:news_wave/views/widgets/trending_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'NewsWave',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Hottest News",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  "See All",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                TrendingCard(
                  imageUrl:
                      'https://media.cnn.com/api/v1/images/stellar/prod/u3a2929.JPG?q=w_1110,c_fill/f_webp',
                  headline:
                      'Millions in this country are stranded by flooding. Many blame their neighbor',
                  authorName: 'Nadim Chowdhury',
                  authorImageUrl:
                      'https://avatars.githubusercontent.com/u/161572904?v=4',
                  relativeTime: '2 days ago',
                  trendingRank: 'Trending no 1',
                ),
                TrendingCard(
                  imageUrl:
                      'https://ichef.bbci.co.uk/news/1024/cpsprodpb/8e0b/live/dfca7390-6136-11ef-bde7-4fd43dc8559b.jpg.webp',
                  headline: 'TikTok blamed for hit to Iceland cucumber supply',
                  authorName: 'BBC News',
                  authorImageUrl:
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZrRNR9_sMkmiN5g2UN_f9kKx8H4Z9JDC5Pg&s',
                  relativeTime: '3 days ago',
                  trendingRank: 'Trending no 2',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
