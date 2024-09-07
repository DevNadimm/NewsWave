import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_wave/utils/bookmark.dart';
import 'package:news_wave/utils/colors.dart';
import 'package:news_wave/views/screens/details_news_screen.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  Future<void> _refreshBookmarks() async {
    setState(() {
      Bookmark.bookmarkArticle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bookmark',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        surfaceTintColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Bookmark.bookmarkArticle.isEmpty
            ? Center(
                child: Text(
                  "No bookmarks available!",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              )
            : RefreshIndicator(
                onRefresh: _refreshBookmarks,
                backgroundColor: bgColor,
                child: ListView.separated(
                  itemCount: Bookmark.bookmarkArticle.length,
                  itemBuilder: (context, index) {
                    final article = Bookmark.bookmarkArticle[index];
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
                              isBookmarked: true,
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
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
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
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          authorName,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    formattedDate,
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
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
              ),
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
