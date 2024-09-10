import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_wave/controller/news_controller.dart';
import 'package:news_wave/models/news_model.dart';
import 'package:news_wave/utils/colors.dart';
import 'package:news_wave/views/widgets/news_tile.dart';
import 'package:news_wave/views/widgets/trending_categories.dart';
import 'dart:async';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  final NewsController newsController = NewsController();
  Future<NewsModel>? searchResult;
  Timer? _debounce;

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "What are you looking for?",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            const SizedBox(height: 10),
            _buildTextField(context),
            const SizedBox(height: 20),
            searchController.text.isEmpty
                ? const TrendingCategories()
                : searchResult == null
                    ? Center(
                        child: Text(
                          "No search initiated.",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      )
                    : NewsTile(
                        futureNews: searchResult!,
                      ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _debounce?.cancel();
    searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      final trimmedQuery = query.trim();
      if (trimmedQuery.isEmpty) {
        setState(() {
          searchResult = null;
        });
      } else {
        setState(() {
          searchResult = newsController.getSearchNews(trimmedQuery);
        });
      }
    });
  }

  Widget _buildTextField(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: CupertinoSearchTextField(
        controller: searchController,
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
        onChanged: _onSearchChanged,
      ),
    );
  }
}
