import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp( PersonalCardApp());

class PersonalCardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Card',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('About Me'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/profile.jpg'), // Add your image in assets folder
                ),
                SizedBox(height: 16),
                Text(
                  'Yousef Mohmmad',
                  style: GoogleFonts.pacifico(fontSize: 24),
                ),
                SizedBox(height: 8),
                Text(
                  'Flutter Student',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                InfoRow(icon: Icons.email, text: 'Ym222cx@student.lnu.se'),
                InfoRow(icon: Icons.phone, text: '0762631789'),
                InfoRow(icon: Icons.location_city, text: 'Växjö, Sweden'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  InfoRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: <Widget>[
          Icon(icon, color: Colors.blue),
          SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
