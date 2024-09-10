import 'dart:convert';
import 'package:news_wave/models/news_model.dart';
import 'package:http/http.dart' as http;

class NewsController {
  final apiKey = "8fa80a02433c44ba9c0aa206d7e21a64";

  Future<NewsModel> getTrendingNews() async {
    final oneWeekAgo = DateTime.now().subtract(const Duration(days: 7));
    final formattedDate = _formatDate(oneWeekAgo);

    final url =
        "https://newsapi.org/v2/everything?q=trending&from=$formattedDate&sortBy=publishedAt&language=en&apiKey=$apiKey";

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final news = NewsModel.fromJson(jsonResponse);

        return news;
      } else {
        throw Exception(
            "Failed to load news. Status code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("An error occurred while fetching trending news: $e");
    }
  }

  Future<NewsModel> getNewsForYou() async {
    final oneWeekAgo = DateTime.now().subtract(const Duration(days: 7));
    final formattedDate = _formatDate(oneWeekAgo);
    final url =
        "https://newsapi.org/v2/everything?q=bangladesh&from=$formattedDate&sortBy=publishedAt&language=en&apiKey=$apiKey";

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final news = NewsModel.fromJson(jsonResponse);
        return news;
      } else {
        throw Exception(
            "Failed to load news. Status code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("An error occurred while fetching 'For You' news: $e");
    }
  }

  Future<NewsModel> getSourceNews(String query) async {
    final url =
        "https://newsapi.org/v2/everything?domains=$query.com&language=en&apiKey=$apiKey";

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final news = NewsModel.fromJson(jsonResponse);
        return news;
      } else {
        throw Exception(
            "Failed to load news from domain '$query'. Status code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception(
          "An error occurred while fetching news from domain '$query': $e");
    }
  }

  Future<NewsModel> getCategoryNews(String query) async {
    final oneWeekAgo = DateTime.now().subtract(const Duration(days: 7));
    final formattedDate = _formatDate(oneWeekAgo);
    final url =
        "https://newsapi.org/v2/everything?q=$query&from=$formattedDate&sortBy=popularity&language=en&apiKey=$apiKey";
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final news = NewsModel.fromJson(jsonResponse);
        return news;
      } else {
        throw Exception(
            "Failed to load news for '$query'. Status code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("An error occurred while fetching news for '$query': $e");
    }
  }

  Future<NewsModel> getSearchNews(String query) async {
    final url =
        "https://newsapi.org/v2/everything?q=$query&sortBy=popularity&language=en&apiKey=$apiKey";
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final news = NewsModel.fromJson(jsonResponse);
        return news;
      } else {
        throw Exception(
            "Failed to load news for '$query'. Status code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("An error occurred while fetching news for '$query': $e");
    }
  }

  String _formatDate(DateTime date) {
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }
}
