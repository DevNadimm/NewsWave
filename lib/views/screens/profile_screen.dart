import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        surfaceTintColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage("assets/images/avatar.jpg"),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "User Name",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Text(
                "Account settings",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 20),
              _buildListTile(
                context,
                Colors.blue.withOpacity(0.5),
                CupertinoIcons.person,
                "Your profile",
                "Edit and view profile info",
                true,
                true,
              ),
              const SizedBox(height: 30),
              Text(
                "App settings",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 20),
              _buildListTile(
                context,
                Colors.greenAccent.withOpacity(0.5),
                CupertinoIcons.brightness,
                "Display preferences",
                "Adjust your display",
                false,
                true,
              ),
              const SizedBox(height: 15),
              _buildListTile(
                context,
                Colors.orange.withOpacity(0.5),
                CupertinoIcons.bell,
                "Notification",
                "On/Off your notification",
                false,
                true,
              ),
              const SizedBox(height: 15),
              _buildListTile(
                context,
                Colors.purple.withOpacity(0.5),
                CupertinoIcons.lock,
                "Privacy",
                "Manage your privacy settings",
                false,
                true,
              ),
              const SizedBox(height: 15),
              _buildListTile(
                context,
                Colors.teal.withOpacity(0.5),
                CupertinoIcons.settings,
                "General",
                "General app settings",
                false,
                true,
              ),
              const SizedBox(height: 30),
              Text(
                "Developer Info",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () => launchUrl(
                    Uri.parse(
                        "https://www.linkedin.com/in/developernadimchowdhury/"),
                    mode: LaunchMode.externalApplication),
                child: _buildListTile(
                  context,
                  Colors.blue.withOpacity(0.5),
                  CupertinoIcons.info_circle_fill,
                  "LinkedIn",
                  "linkedin.com/in/developernadimchowdhury",
                  false,
                  false,
                ),
              ),
              const SizedBox(height: 15),
              GestureDetector(
                onTap: () =>
                    launchUrl(Uri.parse("mailto:nadimchowdhury87@gmail.com")),
                child: _buildListTile(
                  context,
                  Colors.red.withOpacity(0.5),
                  CupertinoIcons.mail,
                  "Email",
                  "nadimchowdhury87@gmail.com",
                  false,
                  false,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListTile(
      BuildContext context,
      Color color,
      IconData icon,
      String title,
      String subTitle,
      bool isErrorIconVisible,
      bool isNextIconVisible) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: color,
          child: Icon(icon),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              subTitle,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        const Spacer(),
        Row(
          children: [
            if (isErrorIconVisible) const Icon(Icons.error, color: Colors.red),
            if (isNextIconVisible)
              Icon(Icons.navigate_next_sharp, color: Colors.grey[600]),
          ],
        ),
      ],
    );
  }
}
