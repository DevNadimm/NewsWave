import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:news_wave/utils/bookmark.dart';
import 'package:news_wave/utils/colors.dart';
import 'package:news_wave/models/news_model.dart';
import 'package:news_wave/views/screens/webview_article.dart';

class DetailsNewsScreen extends StatefulWidget {
  const DetailsNewsScreen({
    super.key,
    required this.article,
    this.isBookmarked = false,
  });

  final Article article;
  final bool isBookmarked;

  @override
  _DetailsNewsScreenState createState() => _DetailsNewsScreenState();
}

class _DetailsNewsScreenState extends State<DetailsNewsScreen> {
  late bool _isBookmarked;

  @override
  void initState() {
    super.initState();
    _isBookmarked = widget.isBookmarked;
  }

  void _toggleBookmark() {
    setState(() {
      if (!_isBookmarked) {
        Bookmark.bookmarkArticle.add(widget.article);
      } else {
        Bookmark.bookmarkArticle.remove(widget.article);
      }
      _isBookmarked = !_isBookmarked;
    });

    if (_isBookmarked) {
      Fluttertoast.showToast(
        msg: "Article added to bookmarks",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: secondaryColor,
        textColor: textColor,
        fontSize: 16.0,
      );
    } else {
      Fluttertoast.showToast(
        msg: "Article removed from bookmarks",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
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
        key: ValueKey<bool>(_isBookmarked),
        appBar: AppBar(
          title: Image.asset(
            "assets/logo/news_wave_title.png",
            width: 150,
          ),
          surfaceTintColor: Colors.transparent,
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: _toggleBookmark,
              icon: Icon(
                _isBookmarked
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
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontSize: 16,
                      ),
                ),
                const SizedBox(height: 7),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
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
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 7),
                          Expanded(
                            child: Text(
                              widget.article.author.isEmpty
                                  ? "Unknown"
                                  : widget.article.author,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                    fontSize: 14,
                                    color: textColor.withOpacity(0.9),
                                  ),
                            ),
                          ),
                        ],
                      ),
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
                const SizedBox(height: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    widget.article.urlToImage ??
                        "https://i.ibb.co/nwgFFQf/20240901-180827.jpg",
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Description",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(fontSize: 16),
                ),
                Text(
                  widget.article.description ?? '',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: textColor.withOpacity(0.9),
                      ),
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (_) => WebviewArticle(
                          articleUrl: widget.article.url,
                        ),
                      ),
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
