import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/logo/news_wave.jpg',
          height: 30,
        ),
      ),
      body: const Center(
        child: Text('Home Screen'),
      ),
    );
  }
}
