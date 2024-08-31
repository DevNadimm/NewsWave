import 'package:flutter/material.dart';
import 'package:news_wave/colors.dart';
import 'package:news_wave/models/news_model.dart';

class TrendingCard extends StatelessWidget {
  final Future<NewsModel> trendingNews;

  const TrendingCard({super.key, required this.trendingNews});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsModel>(
      future: trendingNews,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData || snapshot.data!.articles.isEmpty) {
          return const Center(child: Text('No trending news available.'));
        } else {
          final newsList = snapshot.data!.articles;

          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              final article = newsList[index];

              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.all(10),
                width: 280,
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 180,
                      decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(
                            article.urlToImage ??
                                'https://t4.ftcdn.net/jpg/04/73/25/49/360_F_473254957_bxG9yf4ly7OBO5I0O5KABlN930GwaMQz.jpg',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Trending Rank ${index + 1}',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text(
                          _formatDate(article.publishedAt),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      article.title,
                      style: Theme.of(context).textTheme.titleMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 10,
                          backgroundColor: accentColor,
                          child: Center(
                            child: Text(
                              article.author.isNotEmpty ? article.author[0] : 'U',
                              style: const TextStyle(color: bgColor, fontSize: 14),
                            ),
                          ),
                        ),

                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            article.author.isNotEmpty
                                ? article.author
                                : 'Unknown',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        }
      },
    );
  }

  String _formatDate(DateTime? date) {
    if (date == null) {
      return 'Unknown date';
    }
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }
}
