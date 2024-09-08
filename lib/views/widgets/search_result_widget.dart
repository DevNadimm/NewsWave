// import 'package:flutter/material.dart';
// import 'package:news_wave/models/news_model.dart';
//
// class SearchResultWidget extends StatelessWidget {
//   const SearchResultWidget({super.key, required this.searchNews});
//
//   final Future<NewsModel> searchNews;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder(
//         future: searchNews,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const CircularProgressIndicator();
//           } else if (snapshot.hasError) {
//             return Center(child: Text("Error: ${snapshot.error}"));
//           } else if (!snapshot.hasData || snapshot.data!.articles.isEmpty) {
//             return const Center(child: Text('No news available.'));
//           } else {
//             final newsList = snapshot.data!.articles;
//             return Column(
//
//             );
//           }
//         },
//       ),
//     );
//   }
// }
