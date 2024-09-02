import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_wave/colors.dart';
import 'package:news_wave/models/news_model.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsNewsScreen extends StatefulWidget {
  const DetailsNewsScreen({super.key, required this.article});

  final Article article;

  @override
  _DetailsNewsScreenState createState() => _DetailsNewsScreenState();
}

class _DetailsNewsScreenState extends State<DetailsNewsScreen> {
  bool isBookmarked = false;

  void _toggleBookmark() {
    setState(() {
      isBookmarked = !isBookmarked;
    });
  }

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);

    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Oops, failed to load the article.',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Oops, an error occurred while trying to open the URL: $e',
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      child: Scaffold(
        key: ValueKey<bool>(isBookmarked),
        appBar: AppBar(
          title: Image.asset(
            "assets/logo/news_wave_title.png",
            width: 150,
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: _toggleBookmark,
              icon: Icon(
                isBookmarked
                    ? CupertinoIcons.bookmark_fill
                    : CupertinoIcons.bookmark,
                size: 20,
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.article.title,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontSize: 16),
                ),
                const SizedBox(
                  height: 7,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 10,
                          backgroundColor: accentColor,
                          child: Center(
                            child: Text(
                              widget.article.author.isEmpty
                                  ? "U"
                                  : widget.article.author[0],
                              style: const TextStyle(
                                  color: bgColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        Text(
                          widget.article.author.isEmpty
                              ? "Unknown"
                              : widget.article.author,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    fontSize: 14,
                                    color: textColor.withOpacity(0.9),
                                  ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 8),
                    Text(
                      _formatDate(widget.article.publishedAt),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 13,
                          ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    width: double.infinity,
                    fit: BoxFit.cover,
                    widget.article.urlToImage ??
                        "https://i.ibb.co/nwgFFQf/20240901-180827.jpg",
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Description",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontSize: 16),
                ),
                Text(
                  widget.article.description.toString(),
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: textColor.withOpacity(0.9),
                      ),
                ),
                const SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    _launchURL(
                      widget.article.url,
                    );
                  },
                  child: Text(
                    "Read Full Article",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
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
