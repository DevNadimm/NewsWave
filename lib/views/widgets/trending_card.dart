import 'package:flutter/material.dart';
import 'package:news_wave/colors.dart';

class TrendingCard extends StatelessWidget {
  const TrendingCard({
    super.key,
    required this.imageUrl,
    required this.headline,
    required this.authorName,
    required this.authorImageUrl,
    required this.relativeTime,
    required this.trendingRank,
  });

  final String imageUrl;
  final String headline;
  final String authorName;
  final String authorImageUrl;
  final String relativeTime;
  final String trendingRank;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(10),
      width: 280,
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Container(
            height: 180,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                trendingRank,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              Text(
                relativeTime,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            headline,
            style: Theme.of(context).textTheme.titleMedium,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              CircleAvatar(
                radius: 10,
                backgroundColor: accentColor,
                backgroundImage: NetworkImage(authorImageUrl),
              ),
              const SizedBox(
                width: 08,
              ),
              Text(
                authorName,
                style: Theme.of(context).textTheme.titleSmall,
              )
            ],
          )
        ],
      ),
    );
  }
}
