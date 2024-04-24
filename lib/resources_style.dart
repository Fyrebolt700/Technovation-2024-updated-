import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ResourcesStyle extends StatelessWidget {
  const ResourcesStyle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Resources',
        style: TextStyle(fontWeight: FontWeight.bold)
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFE46D86), // Use the theme's primary color
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: [
          _buildLink('AI Chatbot', 'https://partyrock.aws/u/fyrebolt700/P0NKvlIYC/Postpartum-Wellness-Companion'),
          _buildLink('Youtube Videos', 'https://www.youtube.com/watch?v=Aj1Vk3q-4tg'),
          _buildLink('Online Support', 'https://www.betterhelp.com/get-started/?go=true&utm_source=AdWords&utm_medium=Search_PPC_c&utm_term=anxiety+help_b&utm_content=141703084457&network=g&placement=&target=&matchtype=b&utm_campaign=19025092756&ad_type=text&adposition=&kwd_id=kwd-11418211&gad_source=1&gclid=CjwKCAjwuJ2xBhA3EiwAMVjkVHFs-ej0uggY4WATzjKZ8dbMw3U4wD4ksy5mBfxcCY757Z_lDJuSqhoC10MQAvD_BwE&not_found=1&gor=start'),
          _buildLink('Facebook Community', 'https://www.facebook.com/groups/maternalmhmatterssupportgroup/'),
          _buildLink('Hotlines', 'https://www.postpartum.net/get-help/in-an-emergency/'),
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
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey[300]!)), // Add a bottom border to separate links
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.black87,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios, // Arrow icon
              color: Colors.black87,
            ),
          ],
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
