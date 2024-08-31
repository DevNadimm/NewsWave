import 'package:flutter/material.dart';
import 'package:news_wave/colors.dart';
import 'package:news_wave/controller/news_controller.dart';
import 'package:news_wave/models/news_model.dart';
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


  @override
  void initState() {
    trendingNews = newsController.getTrendingNews();
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
            const SizedBox(
              height: 10,
            ),
            _buildHeadingRow(context, "Hottest News", () {}),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 330,
              child: TrendingCard(
                trendingNews: trendingNews,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 10, right: 10, top: 15, bottom: 5),
              child: Image.asset('assets/logo/barrier.png'),
            ),
            _buildHeadingRow(context, "News For You", () {}),
            const NewsTile(
              imageUrl:
              'https://api.time.com/wp-content/uploads/2024/08/GettyImages-2165952554.jpg?quality=85&w=1920',
              headline: 'How Bangladesh Can Become a True Democracy',
              authorName: 'BBC News',
              authorImageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZrRNR9_sMkmiN5g2UN_f9kKx8H4Z9JDC5Pg&s',
              relativeTime: '2 Days Ago',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeadingRow(BuildContext context, String header,
      VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            header,
            style: Theme
                .of(context)
                .textTheme
                .titleMedium,
          ),
          GestureDetector(
            onTap: onTap,
            child: Row(
              children: [
                Text(
                  "See More",
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleSmall,
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
