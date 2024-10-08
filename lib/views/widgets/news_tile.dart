import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_wave/utils/colors.dart';
import 'package:news_wave/models/news_model.dart';
import 'package:news_wave/views/screens/details_news_screen.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({
    super.key,
    required this.futureNews,
    this.itemCount,
  });

  final Future<NewsModel> futureNews;
  final int? itemCount;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureNews,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else if (!snapshot.hasData || snapshot.data!.articles.isEmpty) {
          return Center(
            child: Text(
              'No news available.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          );
        } else {
          final newsList = snapshot.data!.articles;
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: itemCount ?? newsList.length,
              itemBuilder: (context, index) {
                final article = newsList[index];
                final imageUrl = article.urlToImage ??
                    'https://i.ibb.co/nwgFFQf/20240901-180827.jpg';
                final headline = article.title;
                final authorName =
                    article.author.isNotEmpty ? article.author : 'Unknown';
                final authorInitial =
                    article.author.isNotEmpty ? article.author[0] : "U";
                final formattedDate = _formatDate(article.publishedAt);

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
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            color: bgColor,
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              image: NetworkImage(imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                headline,
                                style: Theme.of(context).textTheme.titleMedium,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 10,
                                    backgroundColor: accentColor,
                                    child: Text(
                                      authorInitial,
                                      style: const TextStyle(
                                        color: bgColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Expanded(
                                    child: Text(
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      authorName,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                formattedDate,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(
                  height: 10,
                );
              },
            ),
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
