import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';


class ResourcesStyle extends StatelessWidget {
  const ResourcesStyle({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Resources',
      home: MultipleLinksScreen(),
    );
  }
}

class MultipleLinksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resources'),
      ),
      body: ListView(
        children: [
          _buildLink('AI Chatbot', 'https://partyrock.aws/u/fyrebolt700/P0NKvlIYC/Postpartum-Wellness-Companion'),
          _buildLink('Youtube Videos', 'https://www.youtube.com/watch?v=Aj1Vk3q-4tg'),
          // Add more links as needed
        ],
      ),
    );
  }

  Widget _buildLink(String title, String url) {
    return GestureDetector(
      onTap: () {
        _launchExternalLink(url);
      },
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.blue,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }


void _launchExternalLink(String url) async {
  if (await canLaunchUrlString(url)) {
       await launchUrlString(
        url,
        mode: LaunchMode.externalApplication,
      );
    }
  }
}