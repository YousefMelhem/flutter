import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const PersonalCardApp());

class PersonalCardApp extends StatelessWidget {
  const PersonalCardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Card',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Personal Card'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage('assets/profile.jpg'),
                ),
                const SizedBox(height: 16),
                Text(
                  'Yousef Mohmmad',
                  style: GoogleFonts.pacifico(fontSize: 24),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Flutter Student',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                const InfoRow(icon: Icons.email, text: 'Ym222cx@student.lnu.se'),
                const InfoRow(icon: Icons.phone, text: '0762631789'),
                const InfoRow(icon: Icons.location_city, text: 'Växjö, Sweden'),
                const SizedBox(height: 16),
                GitHubLink(onTap: _launchURL),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static void _launchURL() async {
    const url = 'https://github.com/YousefMelhem';
    final Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      print('Could not launch $url');
      throw 'Could not launch $url';
    }
  }
}

class InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const InfoRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: <Widget>[
          Icon(icon, color: const Color.fromARGB(255, 37, 33, 243)),
          const SizedBox(width: 8),
          Text(
            text,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class GitHubLink extends StatelessWidget {
  final VoidCallback onTap;

  const GitHubLink({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.link, color: Color.fromARGB(255, 33, 65, 243)),
          SizedBox(width: 8),
          Text(
            'My GitHub Page ',
            style: TextStyle(
              fontSize: 16,
              color: Color.fromARGB(255, 33, 65, 243),
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }
}
