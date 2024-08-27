import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_wave/colors.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "What are you looking for?",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 10,
              ),
              CupertinoSearchTextField(
                padding: const EdgeInsets.all(10),
                placeholder: "Search...",
                placeholderStyle: Theme.of(context).textTheme.titleSmall,
                backgroundColor: secondaryColor,
                borderRadius: BorderRadius.circular(10),
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
            ],
          ),
        ),
      ),
    );
  }
}
