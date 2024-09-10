import 'package:flutter/material.dart';
import 'package:news_wave/views/widgets/loading_container.dart';
import 'package:news_wave/utils/colors.dart';

class LoadingSourcesScreen extends StatelessWidget {
  const LoadingSourcesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;

    final BoxDecoration commonDecoration = BoxDecoration(
      color: secondaryColor,
      borderRadius: BorderRadius.circular(12),
    );

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 10),
          child: Column(
            children: [
              _buildTopRow(
                screenWidth,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  _buildLargeCard(screenWidth, commonDecoration),
                  _buildSideColumn(screenWidth, commonDecoration),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              _buildTopRow(
                screenWidth,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  _buildLargeCard(screenWidth, commonDecoration),
                  _buildSideColumn(screenWidth, commonDecoration),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding _buildTopRow(double screenWidth) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const LoadingContainer(width: 30, height: 30),
          LoadingContainer(width: screenWidth * 0.35, height: 20),
        ],
      ),
    );
  }

  Container _buildLargeCard(double screenWidth, BoxDecoration decoration) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(10),
      width: 280,
      decoration: decoration,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LoadingContainer(width: screenWidth, height: 170),
          const SizedBox(height: 10),
          LoadingContainer(width: screenWidth * 0.35, height: 15),
          const SizedBox(height: 10),
          LoadingContainer(width: screenWidth, height: 20),
          const SizedBox(height: 10),
          LoadingContainer(width: screenWidth * 0.5, height: 20),
        ],
      ),
    );
  }

  Expanded _buildSideColumn(double screenWidth, BoxDecoration decoration) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
        decoration: decoration.copyWith(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            bottomLeft: Radius.circular(12),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LoadingContainer(width: screenWidth, height: 170),
            const SizedBox(height: 10),
            LoadingContainer(width: screenWidth, height: 15),
            const SizedBox(height: 10),
            LoadingContainer(width: screenWidth, height: 20),
            const SizedBox(height: 10),
            LoadingContainer(width: screenWidth, height: 20),
          ],
        ),
      ),
    );
  }
}
