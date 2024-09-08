import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_wave/utils/colors.dart';
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
                child: _buildNewsCarousel(newsList),
              ),
              const SizedBox(height: 25),
            ],
          );
        }
      },
    );
  }

  Widget _buildNewsCarousel(List<Article> newsList) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
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
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                width: 10,
              );
            },
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime? date) {
    if (date == null) {
      return 'Unknown date';
    }
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }
}
