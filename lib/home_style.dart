import 'package:flutter/material.dart';
import 'quiz.dart';
import 'log_style.dart'; // Import the file where LogStyle is defined
import 'about_style.dart'; // Import the file where AboutStyle is defined
import 'package:url_launcher/url_launcher_string.dart';

class HomeStyle extends StatelessWidget {
  const HomeStyle({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'Nurture',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: const Color(0xFFE46D86),
          automaticallyImplyLeading: false,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              Icon(
                Icons.favorite, // Changed to a heart icon
                size: 100,
                color: const Color(0xFFE46D86), // Feminine pink color
              ),
              SizedBox(height: 20),
              Text(
                'Empowering Mothers through Post Partum Mental Health Support',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: const Color(0xFFE46D86), // Feminine pink color
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Designed to help you become aware about post-partum depression and take the steps to flourish your mental wellbeing',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Quiz()),
                  );
                },
                icon: Icon(Icons.assignment_turned_in), // Checkmark icon
                label: Text('Think you have post-partum? Take the Screening Tool', style: TextStyle(color: Colors.white)), // Adjusted text color to white
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE46D86), // Feminine pink color
                  textStyle: TextStyle(
                    fontSize: 16,
                    
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LogStyle()),
                  );
                },
                icon: Icon(Icons.track_changes), // Trending up icon
                label: Text('Track Your Mood', style: TextStyle(color: Colors.white)), // Adjusted text color to white
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE46D86), // Feminine pink color
                  textStyle: TextStyle(
                    fontSize: 16,
                    
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  _launchExternalLink('https://partyrock.aws/u/fyrebolt700/P0NKvlIYC/Postpartum-Wellness-Companion');
                },
                icon: Icon(Icons.chat), // Chat bubble icon
                label: Text('Talk to the AI Chat bot', style: TextStyle(color: Colors.white)), // Adjusted text color to white
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE46D86), // Feminine pink color
                  textStyle: TextStyle(
                    fontSize: 16,
                   
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutStyle()),
                  );
                },
                icon: Icon(Icons.info), // Info icon
                label: Text('Why Nurture', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE46D86), // Feminine pink color
                  textStyle: TextStyle(
                    fontSize: 16,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ],
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
