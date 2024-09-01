import 'package:flutter/material.dart';
import 'package:news_wave/controller/news_controller.dart';
import 'package:news_wave/models/news_model.dart';
import 'package:news_wave/views/widgets/news_tile.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key, required this.title});

  final String title;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  late Future<NewsModel> categoryNews;
  NewsController newsController = NewsController();

  @override
  void initState() {
    categoryNews = newsController.getCategoryNews(widget.title);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        surfaceTintColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: NewsTile(
          futureNews: categoryNews,
          isContainerColorVisible: false,
        ),
      ),
    );
  }
}
