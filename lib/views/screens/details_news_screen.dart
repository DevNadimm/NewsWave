import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_wave/models/news_model.dart';

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
            child: Column(
              children: [
                Text(
                  widget.article.title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 16),
                ),

              ],
            ),
          )),
    );
  }
}
