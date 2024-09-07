import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_wave/utils/colors.dart';
import 'package:news_wave/views/widgets/trending_categories.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key, this.isCenterTitle = false});

  final bool isCenterTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/logo/news_wave_title.png",
          width: 150,
        ),
        centerTitle: isCenterTitle,
        surfaceTintColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "What are you looking for?",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 10),
                CupertinoSearchTextField(
                  padding: const EdgeInsets.all(10),
                  placeholder: "Search...",
                  placeholderStyle: Theme.of(context).textTheme.titleSmall,
                  backgroundColor: secondaryColor,
                  borderRadius: BorderRadius.circular(12),
                  prefixIcon: const Icon(
                    CupertinoIcons.search,
                    color: subTextColor,
                  ),
                  suffixIcon: const Icon(
                    CupertinoIcons.clear_circled,
                    color: subTextColor,
                  ),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(height: 20),
                const TrendingCategories(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
