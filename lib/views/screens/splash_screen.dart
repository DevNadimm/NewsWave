import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_wave/colors.dart';
import 'package:news_wave/views/widgets/bottom_nav_bar.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/splash_bg_image.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Image.asset(
                  "assets/logo/splash_logo.png",
                  scale: 25,
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * .44,
                ),
                Text(
                  "Welcome to the\nNewsWave app",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  textAlign: TextAlign.center,
                  "Stay informed with the latest breaking news from around the world. Your gateway to up-to-date global headlines.",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const BottomNavBar(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: accentColor,
                      foregroundColor: bgColor,
                      textStyle: const TextStyle(fontSize: 18),
                    ),
                    child: const Text(
                      "GET STARTED",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: bgColor,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
