import 'package:flutter/material.dart';
import 'package:news_wave/colors.dart';

class SourceCard extends StatelessWidget {
  const SourceCard(
      {super.key,
      required this.imageUrl,
      required this.sourceImgUrl,
      required this.sourceName,
      required this.relativeTime,
      required this.headline});

  final String imageUrl;
  final String sourceImgUrl;
  final String sourceName;
  final String relativeTime;
  final String headline;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10,),
          child: Row(
            children: [
              CircleAvatar(
                radius: 15,
                backgroundImage: NetworkImage(
                  sourceImgUrl,
                ),
                backgroundColor: accentColor,
              ),
              const SizedBox(
                width: 7,
              ),
              Text(
                sourceName,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                width: 7,
              ),
              const Icon(
                Icons.verified,
                color: Colors.blue,
                size: 16,
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                padding: const EdgeInsets.all(10),
                width: 280,
                decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    Text(
                      relativeTime,
                      style: Theme.of(context).textTheme.bodyMedium,
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
                  ],
                ),
              ),
          
          
              const SizedBox(width: 10,),
          
              
              Container(
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
                    Text(
                      relativeTime,
                      style: Theme.of(context).textTheme.bodyMedium,
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
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
