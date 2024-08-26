import 'package:flutter/material.dart';
import 'package:news_wave/colors.dart';

class NewsTile extends StatelessWidget {
  const NewsTile({
    super.key,
    required this.imageUrl,
    required this.headline,
    required this.authorName,
    required this.authorImageUrl,
    required this.relativeTime,
  });

  final String imageUrl;
  final String headline;
  final String authorName;
  final String authorImageUrl;
  final String relativeTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  headline,
                  style: Theme.of(context).textTheme.titleMedium,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 10,
                      backgroundColor: accentColor,
                      backgroundImage: NetworkImage(authorImageUrl),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      authorName,
                      style: Theme.of(context).textTheme.titleSmall,
                    )
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  relativeTime,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
