import 'package:flutter/material.dart';
import 'package:news_wave/controller/news_controller.dart';
import 'package:news_wave/models/news_model.dart';
import 'package:news_wave/views/screens/loading_news_tile.dart';
import 'package:news_wave/views/widgets/news_tile.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key, required this.title});

  final String title;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late final Future<NewsModel> categoryNews;
  final NewsController newsController = NewsController();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchNewsData();
  }

  void fetchNewsData() {
    categoryNews = newsController.getCategoryNews(widget.title);

    Future.wait([categoryNews]).then((_) {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        surfaceTintColor: Colors.transparent,
      ),
      body: isLoading
          ? const LoadingNewsTile()
          : SingleChildScrollView(
              child: NewsTile(
                futureNews: categoryNews,
              ),
            ),
    );
  }
}
