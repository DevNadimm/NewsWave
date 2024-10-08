import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_wave/views/screens/loading_home_screen.dart';
import 'package:news_wave/utils/colors.dart';
import 'package:news_wave/controller/news_controller.dart';
import 'package:news_wave/models/news_model.dart';
import 'package:news_wave/views/screens/bookmark_screen.dart';
import 'package:news_wave/views/screens/profile_screen.dart';
import 'package:news_wave/views/screens/see_more_screen.dart';
import 'package:news_wave/views/widgets/news_tile.dart';
import 'package:news_wave/views/widgets/trending_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final NewsController newsController = NewsController();
  late final Future<NewsModel> trendingNews;
  late final Future<NewsModel> newsForYou;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchNewsData();
  }

  void fetchNewsData() {
    trendingNews = newsController.getTrendingNews();
    newsForYou = newsController.getNewsForYou();

    Future.wait([trendingNews, newsForYou]).then((_) {
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
        actions: _buildAppBarActions(context),
        centerTitle: false,
        surfaceTintColor: Colors.transparent,
      ),
      body: isLoading
          ? const LoadingHomeScreen()
          : SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  _buildHeadingRow(
                    context,
                    "Hottest News",
                    () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (_) => SeeMoreScreen(
                            title: "Hottest News",
                            futureNews: trendingNews,
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 327,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          const SizedBox(width: 10),
                          TrendingCard(trendingNews: trendingNews),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 15, bottom: 5),
                    child: Image.asset('assets/logo/barrier.png'),
                  ),
                  _buildHeadingRow(
                    context,
                    "News For You",
                    () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (_) => SeeMoreScreen(
                            title: "News For You",
                            futureNews: newsForYou,
                          ),
                        ),
                      );
                    },
                  ),
                  NewsTile(
                    itemCount: 10,
                    futureNews: newsForYou,
                  ),
                ],
              ),
            ),
    );
  }

  List<Widget> _buildAppBarActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (_) => const BookmarkScreen(),
            ),
          );
        },
        icon: const Icon(
          CupertinoIcons.bookmark,
          size: 20,
        ),
      ),
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
    ];
  }

  Widget _buildHeadingRow(
      BuildContext context, String header, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            header,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          GestureDetector(
            onTap: onTap,
            child: Row(
              children: [
                Text(
                  "See More",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const Icon(
                  Icons.navigate_next_rounded,
                  color: subTextColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
