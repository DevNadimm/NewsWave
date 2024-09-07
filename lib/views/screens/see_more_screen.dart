import 'package:flutter/material.dart';
import 'package:news_wave/models/news_model.dart';
import 'package:news_wave/views/widgets/news_tile.dart';

class SeeMoreScreen extends StatelessWidget {
  const SeeMoreScreen(
      {super.key, required this.title, required this.futureNews});

  final String title;
  final Future<NewsModel> futureNews;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        surfaceTintColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: NewsTile(
          futureNews: futureNews,
        ),
      ),
    );
  }
}
