import 'dart:convert';
import 'package:news_wave/models/news_model.dart';
import 'package:http/http.dart' as http;

class NewsController {
  Future<NewsModel> getTrendingNews() async {
    final oneWeekAgo = DateTime.now().subtract(const Duration(days: 7));
    final formattedDate = _formatDate(oneWeekAgo);

    final url =
        "https://newsapi.org/v2/everything?q=trending&from=$formattedDate&sortBy=publishedAt&apiKey=beb03bbb96e64abc8aa61ff7c809454f";

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final news = NewsModel.fromJson(jsonResponse);

        return news;
      } else {
        throw Exception("Failed to load news: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("An error occurred when fetching trending news: $e");
    }
  }

  Future<NewsModel> getNewsForYou() async {
    final oneWeekAgo = DateTime.now().subtract(const Duration(days: 7));
    final formattedDate = _formatDate(oneWeekAgo);
    String url =
        "https://newsapi.org/v2/everything?q=bangladesh&from=$formattedDate&sortBy=publishedAt&language=en&apiKey=beb03bbb96e64abc8aa61ff7c809454f";

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final news = NewsModel.fromJson(jsonResponse);
        return news;
      } else {
        throw Exception("Failed to load news: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("An error occurred when fetching for you news: $e");
    }
  }

  Future<NewsModel> getSourceNews(String query) async {
    final url =
        "https://newsapi.org/v2/everything?domains=$query.com&language=en&apiKey=beb03bbb96e64abc8aa61ff7c809454f";

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final news = NewsModel.fromJson(jsonResponse);
        return news;
      } else {
        throw Exception(
            "Failed to load news for domain '$query': ${response.statusCode}");
      }
    } catch (e) {
      throw Exception(
          "An error occurred when fetching news for domain '$query': $e");
    }
  }

  String _formatDate(DateTime date) {
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }
}
