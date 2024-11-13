// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Card',
      theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark, 
        primarySwatch: Colors.blueGrey,
      ),
      themeMode: ThemeMode.dark, 
      home: const Scaffold(
        body: Center(child: ProfileCard()),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView( 
      child: Card(
        margin: const EdgeInsets.all(10),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.asset(
                'assets/bg.jpg',  
                width: double.infinity,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),

            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/foto.jpg'),
            ),
            const SizedBox(height: 12),

            Text(
              'Dia Naufal Abiyyu Tsaqif',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.white, 
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '5026221042',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[300], 
              ),
            ),
            const SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "I'm someone who loves exploring new things and embracing a variety of life experiences. Spending time behind the wheel gives me a sense of freedom, and enjoying shrimp is one of life's simple pleasures for me. RnB music is a constant companion, setting the rhythm and vibe for my days. I also enjoy playing games, which not only entertain me but also allow me to explore creativity and strategy. Meeting new people and building friendships is something I value deeply, as I believe everyone brings a unique perspective that can enrich my life. With a passion for trying new things, I’m always ready to take on challenges that bring growth and adventure.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[300], 
                ),
              ),
            ),
            const SizedBox(height: 16),

            Text(
              '"It is what a man must do." - The Old Man and the Sea',
              style: TextStyle(
                fontSize: 14,
                fontStyle: FontStyle.italic,
                color: Colors.grey[300], 
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            Text(
              'Connect with me down below:',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.grey[300], 
              ),
            ),
            const SizedBox(height: 10),

            // Social Media Icons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.instagram, color: Colors.white),
                  onPressed: () => _launchURL('https://instagram.com/username'),
                ),
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.linkedin, color: Colors.white),
                  onPressed: () => _launchURL('https://linkedin.com/in/username'),
                ),
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.spotify, color: Colors.white), 
                  onPressed: () => _launchURL('https://open.spotify.com/user/username'),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
