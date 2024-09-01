import 'package:flutter/material.dart';
import 'package:news_wave/controller/news_controller.dart';
import 'package:news_wave/models/news_model.dart';
import 'package:news_wave/views/widgets/source_card.dart';

class SourcesScreen extends StatefulWidget {
  const SourcesScreen({super.key});

  @override
  State<SourcesScreen> createState() => _SourcesScreenState();
}

class _SourcesScreenState extends State<SourcesScreen> {
  NewsController newsController = NewsController();
  late Future<NewsModel> sourcesNewsForBBC;
  late Future<NewsModel> sourcesNewsForAlJazeera;
  late Future<NewsModel> sourcesNewsForCNN;
  late Future<NewsModel> sourcesNewsForFoxNews;
  late Future<NewsModel> sourcesNewsForHuffPost;

  @override
  void initState() {
    sourcesNewsForBBC = newsController.getSourceNews("bbc");
    sourcesNewsForAlJazeera = newsController.getSourceNews("aljazeera");
    sourcesNewsForCNN = newsController.getSourceNews("cnn");
    sourcesNewsForFoxNews = newsController.getSourceNews("foxnews");
    sourcesNewsForHuffPost = newsController.getSourceNews("huffpost");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/logo/news_wave_title.png",
          width: 150,
        ),
        centerTitle: false,
        surfaceTintColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SourceCard(
              sourceName: 'BBC News',
              sourceImgUrl:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZrRNR9_sMkmiN5g2UN_f9kKx8H4Z9JDC5Pg&s',
              sourceNews: sourcesNewsForBBC,
            ),
            SourceCard(
              sourceName: 'Al Jazeera',
              sourceImgUrl:
                  'https://play-lh.googleusercontent.com/1pvYY4tIk0u0ZPkqp-zMRHXekDNq793b5TNxFO0ZUMe2ML87G6moZrvfiVWFWteEUirC',
              sourceNews: sourcesNewsForAlJazeera,
            ),
            SourceCard(
              sourceName: 'CNN',
              sourceImgUrl:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgT-R52bE5nFi11FvXv3Er0ADTmXuBd3ieeQ&s',
              sourceNews: sourcesNewsForCNN,
            ),
            SourceCard(
              sourceName: 'Fox News',
              sourceImgUrl:
                  'https://kreafolk.com/cdn/shop/articles/fox-news-logo-design-history-and-evolution-kreafolk_03495064-605c-4de7-aeea-1b60300fbf6f.jpg?v=1717724993&width=2048',
              sourceNews: sourcesNewsForFoxNews,
            ),
            SourceCard(
              sourceName: 'HuffPost',
              sourceImgUrl:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTVDeSZ7qfzm8LOVJx23MgOgXwNzKirAmQjeA&s',
              sourceNews: sourcesNewsForHuffPost,
            ),
          ],
        ),
      ),
    );
  }
}
