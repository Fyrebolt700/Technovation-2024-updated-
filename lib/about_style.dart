import 'package:flutter/material.dart';
import 'main.dart'; // Import the main.dart file to access the HomePage

class AboutStyle extends StatelessWidget {
  const AboutStyle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About Us',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFE46D86),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50),
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('assets/nurture.png'), // Add your company logo here
            ),
            SizedBox(height: 20),
            Text(
              'Empowering Lives, Transforming Futures',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 202, 104, 137), // Pink color
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Motherhood is a journey filled with moments of love, joy, and wonder. However, it\'s also a path that can be fraught with unexpected challenges, including the often silent struggle of postpartum depression (PPD). At Nurture we understand the complexities of this journey, and we\'re here to offer you the support and guidance you need to navigate it with strength and resilience.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Our app is more than just a digital tool—it\'s a lifeline for mothers facing the emotional turmoil of postpartum depression. Whether you\'re experiencing feelings of sadness, anxiety, or overwhelm, you\'re not alone. Our compassionate community and comprehensive resources are here to help you every step of the way.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Through personalized self-assessment tools, expertly curated resources, and a supportive network of fellow mothers, Nurture empowers you to take control of your mental health and reclaim your sense of well-being. Together, we\'ll break the stigma surrounding postpartum depression and foster a culture of openness, understanding, and healing.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Join us on this journey of self-discovery and empowerment. Together, we\'ll redefine what it means to thrive as mothers, one courageous step at a time.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement( // Navigate to the HomePage, replacing the current route
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()), // Use the HomePage widget
                );
              },
              child: Text('Back to Home'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: const Color.fromARGB(255, 202, 104, 137), // Pink color
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
