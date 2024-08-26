import 'package:flutter/material.dart';
import 'package:news_wave/theme.dart';
import 'package:news_wave/views/widgets/bottom_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appTheme(),
      debugShowCheckedModeBanner: false,
      title: 'NewsWave',
      home:  const BottomNavBar(),
    );
  }
}
