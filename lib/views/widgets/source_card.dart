import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_wave/colors.dart';
import 'package:news_wave/models/news_model.dart';
import 'package:news_wave/views/screens/details_news_screen.dart';

class SourceCard extends StatelessWidget {
  const SourceCard({
    super.key,
    required this.sourceImgUrl,
    required this.sourceName,
    required this.sourceNews,
  });

  final String sourceImgUrl;
  final String sourceName;
  final Future<NewsModel> sourceNews;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsModel>(
      future: sourceNews,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        } else if (!snapshot.hasData || snapshot.data!.articles.isEmpty) {
          return const Center(child: Text('No news available.'));
        } else {
          final newsList = snapshot.data!.articles;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundImage: NetworkImage(sourceImgUrl),
                      backgroundColor: accentColor,
                    ),
                    const SizedBox(width: 7),
                    Text(
                      sourceName,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(width: 7),
                    const Icon(
                      Icons.verified,
                      color: Colors.blue,
                      size: 16,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    final article = newsList[index];
                    final imgUrl = article.urlToImage ??
                        "https://i.ibb.co/nwgFFQf/20240901-180827.jpg";
                    final headline = article.title;
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
                        margin: const EdgeInsets.symmetric(horizontal: 10),
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
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                  image: NetworkImage(imgUrl),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              formattedDate,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(height: 7),
                            Text(
                              headline,
                              style: Theme.of(context).textTheme.titleMedium,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 25),
            ],
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
