import 'package:flutter/material.dart';
import 'package:news_wave/colors.dart';
import 'package:news_wave/views/widgets/news_tile.dart';
import 'package:news_wave/views/widgets/trending_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/logo/news_wave_title.png",
          width: 150,
        ),
        centerTitle: false,
        surfaceTintColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            _buildHeadingRow(context, "Hottest News", () {}),
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
                    relativeTime: '2 Days Ago',
                    trendingRank: '🔥 Trending No.1',
                  ),
                  TrendingCard(
                    imageUrl:
                        'https://ichef.bbci.co.uk/news/1024/cpsprodpb/8e0b/live/dfca7390-6136-11ef-bde7-4fd43dc8559b.jpg.webp',
                    headline:
                        'TikTok blamed for hit to Iceland cucumber supply',
                    authorName: 'BBC News',
                    authorImageUrl:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZrRNR9_sMkmiN5g2UN_f9kKx8H4Z9JDC5Pg&s',
                    relativeTime: '3 Days Ago',
                    trendingRank: '🔥 Trending No.2',
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, top: 15, bottom: 5),
              child: Image.asset('assets/logo/barrier.png'),
            ),
            _buildHeadingRow(context, "News For You", () {}),
            const NewsTile(
              imageUrl:
                  'https://api.time.com/wp-content/uploads/2024/08/GettyImages-2165952554.jpg?quality=85&w=1920',
              headline: 'How Bangladesh Can Become a True Democracy',
              authorName: 'BBC News',
              authorImageUrl:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZrRNR9_sMkmiN5g2UN_f9kKx8H4Z9JDC5Pg&s',
              relativeTime: '2 Days Ago',
            ),
            const NewsTile(
              imageUrl:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQw4Kpsps4TbFxgrOSqffJGCrdv38Mcspx0AA&s',
              headline:
                  'Trump’s personal attacks aren’t just who he is. They’re his strategy',
              authorName: 'BBC News',
              authorImageUrl:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZrRNR9_sMkmiN5g2UN_f9kKx8H4Z9JDC5Pg&s',
              relativeTime: '2 Days Ago',
            ),
            const NewsTile(
              imageUrl:
                  'https://cdn.bdnews24.com/bdnews24/media/bangla/imgAll/2024August/cumilla-monohargonj-nangolkot-flood-250824-04-1724579987.jpg',
              headline:
                  'Flood situation continues to improve in Feni, may deteriorate in Bandarban, Khagrachhari',
              authorName: 'BBC News',
              authorImageUrl:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZrRNR9_sMkmiN5g2UN_f9kKx8H4Z9JDC5Pg&s',
              relativeTime: '2 Days Ago',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeadingRow(
      BuildContext context, String header, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            header,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          GestureDetector(
            onTap: onTap,
            child: Row(
              children: [
                Text(
                  "See More",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const Icon(
                  Icons.navigate_next_rounded,
                  color: subTextColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
