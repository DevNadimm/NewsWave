import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_wave/controller/news_controller.dart';
import 'package:news_wave/models/news_model.dart';
import 'package:news_wave/views/screens/loading_sources_screen.dart';
import 'package:news_wave/views/screens/profile_screen.dart';
import 'package:news_wave/views/widgets/source_card.dart';

class SourcesScreen extends StatefulWidget {
  const SourcesScreen({super.key});

  @override
  State<SourcesScreen> createState() => _SourcesScreenState();
}

class _SourcesScreenState extends State<SourcesScreen> {
  final NewsController newsController = NewsController();
  late Future<NewsModel> sourcesNewsForBBC;
  late Future<NewsModel> sourcesNewsForAlJazeera;
  late Future<NewsModel> sourcesNewsForCNN;
  late Future<NewsModel> sourcesNewsForFoxNews;
  late Future<NewsModel> sourcesNewsForHuffPost;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchNewsData();
  }

  void fetchNewsData() {
    sourcesNewsForBBC = newsController.getSourceNews("bbc");
    sourcesNewsForAlJazeera = newsController.getSourceNews("aljazeera");
    sourcesNewsForCNN = newsController.getSourceNews("cnn");
    sourcesNewsForFoxNews = newsController.getSourceNews("foxnews");
    sourcesNewsForHuffPost = newsController.getSourceNews("huffpost");

    Future.wait([
      sourcesNewsForBBC,
      sourcesNewsForAlJazeera,
      sourcesNewsForCNN,
      sourcesNewsForFoxNews,
      sourcesNewsForHuffPost,
    ]).then((_) {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/logo/news_wave_title.png",
          width: 150,
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (_) => const ProfileScreen(),
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Stack(
                children: [
                  SizedBox(
                    height: 27,
                    width: 27,
                    child: Image.asset('assets/images/avatar.jpg'),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 12,
                      width: 12,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black54,
                      ),
                      child: const Icon(
                        Icons.menu_open_rounded,
                        size: 10,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 15),
        ],
        centerTitle: false,
        surfaceTintColor: Colors.transparent,
      ),
      body: isLoading
          ? const LoadingSourcesScreen()
          : SingleChildScrollView(
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
