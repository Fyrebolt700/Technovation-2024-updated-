import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'home_style.dart';
import 'news_style.dart';
import 'log_style.dart';
import 'resources_style.dart';
import 'about_style.dart'; // Ensure this file defines AboutStyle

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width; // Get screen width
    bool isSmallScreen = screenWidth < 350; // Define a breakpoint for small screens

    const List<Widget> widgetOptions = <Widget>[
      HomeStyle(),
      AboutStyle(),
      NewsStyle(),
      LogStyle(),
      ResourcesStyle(),
    ];

    return Scaffold(
      body: Center(
        child: widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: GNav(
         rippleColor: Colors.grey[300]!, // ripple color
        hoverColor: Colors.grey[100]!, // hover color
        gap: 8, // reduced gap between icons and text
        color: Colors.grey[800], // unselected icon color
        activeColor: Colors.pink, // selected icon color
        iconSize: isSmallScreen ? 20 : 17, // adjust icon size based on screen size
        tabBackgroundColor: Colors.pink.withAlpha(150), // selected tab background color
        padding: EdgeInsets.symmetric(horizontal: isSmallScreen ? 20 : 1, vertical: 12), // adaptive padding
        duration: Duration(milliseconds: 400), // animation duration
        tabMargin: EdgeInsets.symmetric(horizontal: isSmallScreen ? 1 : 10), // adaptive margin
        textStyle: TextStyle(fontSize: isSmallScreen ? 1 : 12), // adjust text size based on screen size
        tabs: [
          GButton(
            icon: Icons.home,
            text: isSmallScreen ? '' : 'Home', // Conditional text based on screen size
          ),
          GButton(
            icon: Icons.people,
            text: isSmallScreen ? '' : 'About',
          ),
          GButton(
            icon: Icons.note_add_rounded,
            text: isSmallScreen ? '' : 'Articles',
          ),
          GButton(
            icon: Icons.calendar_month_outlined,
            text: isSmallScreen ? '' : 'Log',
          ),
          GButton(
            icon: Icons.book_sharp,
            text: isSmallScreen ? '' : 'Resources',
          ),
        ],
        selectedIndex: _selectedIndex,
        onTabChange: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
