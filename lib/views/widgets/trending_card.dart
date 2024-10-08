import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_wave/utils/colors.dart';
import 'package:news_wave/models/news_model.dart';
import 'package:news_wave/views/screens/details_news_screen.dart';

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
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              final article = newsList[index];
              final imageUrl = article.urlToImage ??
                  'https://i.ibb.co/nwgFFQf/20240901-180827.jpg';
              final headline = article.title;
              final authorName =
                  article.author.isNotEmpty ? article.author : 'Unknown';
              final authorInitial =
                  article.author.isNotEmpty ? article.author[0] : 'U';
              final formattedDate = _formatDate(article.publishedAt);
              final trendingRank = index + 1;

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (_) => DetailsNewsScreen(
                        article: article,
                      ),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 10),
                  padding: const EdgeInsets.all(10),
                  width: 280,
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 180,
                        decoration: BoxDecoration(
                          color: bgColor,
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Trending Rank $trendingRank',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Text(
                            formattedDate,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      Text(
                        headline,
                        style: Theme.of(context).textTheme.titleMedium,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 10,
                            backgroundColor: accentColor,
                            child: Center(
                              child: Text(
                                authorInitial,
                                style: const TextStyle(
                                    color: bgColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              authorName,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
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
