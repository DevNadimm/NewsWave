import 'package:flutter/material.dart';
import 'package:news_wave/utils/colors.dart';
import 'package:news_wave/views/widgets/loading_container.dart';

class LoadingNewsTile extends StatelessWidget {
  const LoadingNewsTile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    final BoxDecoration commonDecoration = BoxDecoration(
      color: secondaryColor,
      borderRadius: BorderRadius.circular(12),
    );

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildListTile(screenWidth, commonDecoration),
            _buildListTile(screenWidth, commonDecoration),
            _buildListTile(screenWidth, commonDecoration),
            _buildListTile(screenWidth, commonDecoration),
            _buildListTile(screenWidth, commonDecoration),
          ],
        ),
      ),
    );
  }

  Container _buildListTile(double screenWidth, BoxDecoration decoration) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: decoration,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const LoadingContainer(width: 110, height: 110),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LoadingContainer(width: screenWidth, height: 20),
                const SizedBox(height: 8),
                LoadingContainer(width: screenWidth * 0.5, height: 20),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const LoadingContainer(width: 20, height: 20),
                    const SizedBox(width: 8),
                    LoadingContainer(width: screenWidth * 0.28, height: 15),
                  ],
                ),
                const SizedBox(height: 8),
                LoadingContainer(width: screenWidth * 0.35, height: 15),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
