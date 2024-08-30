import 'package:flutter/material.dart';
import 'package:news_wave/views/widgets/source_card.dart';

class SourcesScreen extends StatelessWidget {
  const SourcesScreen({super.key});

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
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SourceCard(
              sourceName: 'BBC News',
              sourceImgUrl:
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZrRNR9_sMkmiN5g2UN_f9kKx8H4Z9JDC5Pg&s',
              imageUrl:
                  'https://ichef.bbci.co.uk/news/1024/cpsprodpb/d513/live/baa96ca0-58c2-11ef-9126-9ff3f32adbcf.jpg.webp',
              relativeTime: '3 Weeks Ago',
              headline:
                  'Yunus: I will help make students\' dream for Bangladesh come true',
            ),
            SizedBox(
              height: 20,
            ),
            SourceCard(
              sourceName: 'Al Jazeera',
              sourceImgUrl:
                  'https://play-lh.googleusercontent.com/1pvYY4tIk0u0ZPkqp-zMRHXekDNq793b5TNxFO0ZUMe2ML87G6moZrvfiVWFWteEUirC',
              imageUrl:
                  'https://www.aljazeera.com/wp-content/uploads/2024/07/2024-07-22T092620Z_1398568677_RC2609A1WMCR_RTRMADP_3_BANGLADESH-PROTESTS-1721641766.jpg?w=770&resize=770%2C513&quality=80',
              relativeTime: '3 Weeks Ago',
              headline:
                  'Bangladesh protesters issue demands amid shaky calm',
            ),
          ],
        ),
      ),
    );
  }
}
